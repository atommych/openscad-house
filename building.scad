// ============================================================
// Building Model: Two-storey mixed-use building, Portugal
// Ground Floor (RC): Café Snack-Bar + Sala de Jantar + Service Area
// First Floor (Andar): Sala + Kitchen + 3 Bedrooms + Bathroom
// Garage: Separate structure to the left with Terraço above
// ============================================================
// Scale: 1 unit = 1 metre
// All parameters live in variables.scad
// ============================================================

include <variables.scad>

// ============================================================
// UTILITY: Solid wall box
// ============================================================
module wall_box(x, y, w, d, h) {
    translate([x, y, 0]) cube([w, d, h]);
}

// ============================================================
// UTILITY: Wall with a rectangular opening cut through it
//   axis: "x" = opening cut along X, "y" = cut along Y
//   pos  = position of opening centre along the wall run
//   oz   = Z of opening bottom
// ============================================================
module wall_with_opening(x, y, w, d, h, axis, pos, open_w, open_h, oz=0) {
    difference() {
        translate([x, y, 0]) cube([w, d, h]);
        if (axis == "x") {
            translate([x + pos - open_w/2, y - 0.01, oz])
                cube([open_w, d + 0.02, open_h]);
        } else {
            translate([x - 0.01, y + pos - open_w/2, oz])
                cube([w + 0.02, open_w, open_h]);
        }
    }
}

// ============================================================
// UTILITY: Room label in 3D
// ============================================================
module room_label(txt, x, y, z) {
    translate([x, y, z])
        rotate([90, 0, 0])
            linear_extrude(height=0.02)
                text(txt, size=label_size, halign="center", valign="center",
                     font="Liberation Sans:style=Bold");
}

// ============================================================
// MODULE: Staircase
//   Builds a straight flight of steps rising in Z.
//   Placed at (stair_x, stair_y) as defined in variables.scad.
// ============================================================
module staircase(base_z=0) {
    color("Tan") {
        for (i = [0 : stair_steps - 1]) {
            translate([stair_x,
                       stair_y + i * stair_run,
                       base_z + i * stair_rise])
                cube([stair_w, stair_run, stair_rise]);
        }
        // Stringer slab under the steps
        translate([stair_x, stair_y, base_z])
            cube([stair_w,
                  stair_steps * stair_run,
                  floor_slab]);
    }
}

// ============================================================
// MODULE: Ground Floor (RC)
// ============================================================
module ground_floor() {
    color("SandyBrown", 0.5) {

        // --- Outer perimeter walls with door/window openings ---

        // Front wall — main entrance door (centre) + 2 windows
        difference() {
            union() {
                wall_box(0, 0, building_w, wall_thickness, wall_height);
            }
            // Main entrance door (centred left half)
            translate([2.2, -0.01, 0])
                cube([door_w, wall_thickness + 0.02, door_h]);
            // Shop window left
            translate([0.4, -0.01, window_sill])
                cube([1.4, wall_thickness + 0.02, window_h]);
            // Shop window right
            translate([6.2, -0.01, window_sill])
                cube([window_w, wall_thickness + 0.02, window_h]);
            // Side entrance right
            translate([8.5, -0.01, 0])
                cube([door_w, wall_thickness + 0.02, door_h]);
        }

        // Back wall
        wall_box(0, building_d - wall_thickness, building_w, wall_thickness, wall_height);

        // Left wall — window
        difference() {
            wall_box(0, 0, wall_thickness, building_d, wall_height);
            translate([-0.01, 4.0, window_sill])
                cube([wall_thickness + 0.02, window_w, window_h]);
        }

        // Right wall — window
        difference() {
            wall_box(building_w - wall_thickness, 0, wall_thickness, building_d, wall_height);
            translate([building_w - wall_thickness - 0.01, 3.5, window_sill])
                cube([wall_thickness + 0.02, window_w, window_h]);
        }

        // --- Interior dividing wall: Café | Sala de Jantar ---
        wall_with_opening(gf_div_x, 0, wall_thickness, building_d * 0.65,
                          wall_height, "y", 1.5, door_w, door_h);

        // --- Service area rear partition ---
        wall_with_opening(0, gf_rear_y, building_w * 0.55, wall_thickness,
                          wall_height, "x", 1.5, door_w, door_h);

        // --- Bathroom block walls ---
        wall_box(gf_wc_x, gf_wc_y, wall_thickness, building_d - gf_wc_y, wall_height);
        wall_box(gf_wc_x, gf_wc_sep, building_w - gf_wc_x - wall_thickness,
                 wall_thickness, wall_height);

        // --- Floor slab ---
        translate([0, 0, -floor_slab]) cube([building_w, building_d, floor_slab]);
    }

    // --- Labels ---
    color("SaddleBrown") {
        room_label("Café Snack-Bar", 2.7, building_d * 0.35, label_z);
        room_label("50 m²",          2.7, building_d * 0.35 - 0.5, label_z);
        room_label("Sala de Jantar", 6.7, 3.0, label_z);
        room_label("27 m²",          6.7, 2.5, label_z);
        room_label("Bar",    3.5, 9.0, label_z);
        room_label("9.4 m²", 3.5, 8.5, label_z);
        room_label("Copa",   1.2, 9.0, label_z);
        room_label("4.5 m²", 1.2, 8.5, label_z);
        room_label("WC",     8.5, 6.5, label_z);
    }
}

// ============================================================
// MODULE: First Floor (Andar)
// ============================================================
module first_floor() {
    color("SteelBlue", 0.5) {

        // --- Front wall with windows ---
        difference() {
            wall_box(0, 0, building_w, wall_thickness, wall_height);
            // Two bedroom windows
            translate([1.0, -0.01, window_sill])
                cube([window_w, wall_thickness + 0.02, window_h]);
            translate([5.5, -0.01, window_sill])
                cube([window_w, wall_thickness + 0.02, window_h]);
        }

        // Back wall
        wall_box(0, building_d - wall_thickness, building_w, wall_thickness, wall_height);

        // Left wall — window
        difference() {
            wall_box(0, 0, wall_thickness, building_d, wall_height);
            translate([-0.01, 5.0, window_sill])
                cube([wall_thickness + 0.02, window_w, window_h]);
        }

        // Right wall — balcony door + window
        difference() {
            wall_box(building_w - wall_thickness, 0, wall_thickness, building_d, wall_height);
            translate([building_w - wall_thickness - 0.01, 1.0, 0])
                cube([wall_thickness + 0.02, 1.4, door_h]);   // balcony door
            translate([building_w - wall_thickness - 0.01, 5.0, window_sill])
                cube([wall_thickness + 0.02, window_w, window_h]);
        }

        // --- Central spine wall ---
        wall_with_opening(ff_spine_x, 0, wall_thickness, building_d,
                          wall_height, "y", 2.2, door_w, door_h);

        // --- Top band / middle band partition ---
        wall_with_opening(0, ff_top_y, building_w, wall_thickness,
                          wall_height, "x", ff_spine_x + 1.5, door_w, door_h);

        // --- Middle band / lower band partition ---
        wall_with_opening(0, ff_mid_y, building_w, wall_thickness,
                          wall_height, "x", ff_spine_x + 1.5, door_w, door_h);

        // --- Bathroom / stairwell block ---
        wall_with_opening(ff_bath_x, ff_mid_y, wall_thickness,
                          ff_top_y - ff_mid_y, wall_height,
                          "y", 1.0, door_w, door_h);
        wall_box(ff_spine_x, ff_bath_y, ff_bath_x - ff_spine_x,
                 wall_thickness, wall_height);

        // --- Floor slab ---
        translate([0, 0, -floor_slab]) cube([building_w, building_d, floor_slab]);
    }

    // --- Labels ---
    color("MidnightBlue") {
        room_label("Quarto",    2.3, 9.2, label_z);
        room_label("4.60×3.40", 2.3, 8.7, label_z);
        room_label("Cozinha",   7.3, 9.2, label_z);
        room_label("4.00×3.40", 7.3, 8.7, label_z);
        room_label("Quarto",    2.3, 6.1, label_z);
        room_label("4.60×3.20", 2.3, 5.6, label_z);
        room_label("Casa de Banho", 5.7, 5.8, label_z);
        room_label("Sala",      2.3, 2.2, label_z);
        room_label("4.50×4.30", 2.3, 1.7, label_z);
        room_label("Quarto",    7.3, 2.2, label_z);
        room_label("4.20×3.40", 7.3, 1.7, label_z);
    }
}

// ============================================================
// MODULE: Garage + Terraço
// ============================================================
module garage() {
    translate([garage_offset_x, garage_offset_y, 0]) {
        color("DarkOliveGreen", 0.6) {

            // Left wall
            wall_box(0, 0, wall_thickness, garage_d, wall_height);
            // Right wall
            wall_box(garage_w - wall_thickness, 0, wall_thickness, garage_d, wall_height);
            // Back wall
            wall_box(0, garage_d - wall_thickness, garage_w, wall_thickness, wall_height);

            // Front wall with garage door opening
            difference() {
                wall_box(0, 0, garage_w, wall_thickness, wall_height);
                translate([(garage_w - garage_door_w) / 2, -0.01, 0])
                    cube([garage_door_w, wall_thickness + 0.02, garage_door_h]);
            }

            // Terraço slab (roof of garage)
            translate([0, 0, wall_height])
                cube([garage_w, garage_d, floor_slab]);

            // Floor slab
            translate([0, 0, -floor_slab])
                cube([garage_w, garage_d, floor_slab]);
        }

        // Labels
        color("ForestGreen") {
            room_label("GARAGEM", garage_w/2, garage_d/2, label_z);
            room_label("5.50×4.50", garage_w/2, garage_d/2 - 0.5, label_z);
        }
        color("DarkGreen") {
            translate([garage_w/2, garage_d/2, wall_height + floor_slab + 0.05])
                rotate([90, 0, 0])
                    linear_extrude(height=0.02)
                        text("TERRAÇO", size=label_size * 1.1, halign="center",
                             valign="center", font="Liberation Sans:style=Bold");
        }
    }
}

// ============================================================
// ASSEMBLY
// ============================================================

// Ground floor at Z = 0
ground_floor();

// Staircase from RC to Andar
staircase(base_z=0);

// First floor stacked at wall_height + slab thickness
translate([0, 0, wall_height + floor_slab])
    first_floor();

// Garage (separate, offset left)
garage();

// ============================================================
// EOF
// ============================================================
