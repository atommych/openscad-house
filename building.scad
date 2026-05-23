// ============================================================
// Building Model: R. Dr. Victor Garrett, 71 - Negrelos, Santo Tirso
// Ground Floor (RC): Café Snack-Bar + Sala de Jantar + Service Area
// First Floor (Andar): Sala + Kitchen + 3 Bedrooms + Bathroom
// Garage: Separate structure to the left of main building
// ============================================================
// Scale: 1 unit = 1 meter
// ============================================================

// --- Global Parameters ---
wall_thickness = 0.2;
wall_height    = 2.8;
floor_slab     = 0.15;

// Main building footprint (approx 10 x 11 m)
building_w = 10.0;
building_d = 11.0;

// Garage footprint
garage_w = 5.5;
garage_d = 4.5;

// Label height offset above floor
label_z = 1.2;
label_size = 0.35;

// ============================================================
// UTILITY: Solid wall box
// ============================================================
module wall_box(x, y, w, d, h) {
    translate([x, y, 0])
        cube([w, d, h]);
}

// ============================================================
// UTILITY: Room label rendered in 3D
// ============================================================
module room_label(txt, x, y, z) {
    translate([x, y, z])
        rotate([90, 0, 0])
            linear_extrude(height=0.02)
                text(txt, size=label_size, halign="center", valign="center",
                     font="Liberation Sans:style=Bold");
}

// ============================================================
// MODULE: Ground Floor (RC)
//   Layout (looking from above, Y = depth into building):
//   Left strip  (~4.5 wide): Café Snack-Bar main room
//   Right strip (~5.5 wide): Sala de Jantar
//   Back strip  (~3.4 deep): Service Area (Bar + Copa) above-left
//   Bathrooms block right-rear
// ============================================================
module ground_floor() {
    color("SandyBrown", 0.5) {

        // --- Outer perimeter walls ---

        // Front wall (Y=0)
        wall_box(0, 0, building_w, wall_thickness, wall_height);
        // Back wall (Y = building_d - wt)
        wall_box(0, building_d - wall_thickness, building_w, wall_thickness, wall_height);
        // Left wall (X=0)
        wall_box(0, 0, wall_thickness, building_d, wall_height);
        // Right wall (X = building_w - wt)
        wall_box(building_w - wall_thickness, 0, wall_thickness, building_d, wall_height);

        // --- Interior dividing wall: Café | Sala de Jantar (X ≈ 5.5) ---
        wall_box(5.5, 0, wall_thickness, building_d * 0.65, wall_height);

        // --- Interior dividing wall: Service area rear partition (Y ≈ 7.6) ---
        wall_box(0, 7.6, building_w * 0.55, wall_thickness, wall_height);

        // --- Bathroom block walls (right side, rear) ---
        // Vertical wall separating bathrooms from Sala de Jantar
        wall_box(7.5, 5.0, wall_thickness, building_d - 5.0, wall_height);
        // Horizontal partition between two WC cubicles
        wall_box(7.5, 7.8, building_w - 7.5 - wall_thickness, wall_thickness, wall_height);

        // --- Floor slab ---
        translate([0, 0, -floor_slab])
            cube([building_w, building_d, floor_slab]);
    }

    // --- Room Labels ---
    color("SaddleBrown") {
        // Café Snack-Bar (central-left area)
        room_label("Café Snack-Bar", 2.7, building_d * 0.35, label_z);
        room_label("50 m²", 2.7, building_d * 0.35 - 0.5, label_z);

        // Sala de Jantar (right strip, front portion)
        room_label("Sala de Jantar", 6.7, 3.0, label_z);
        room_label("27 m²", 6.7, 2.5, label_z);

        // Bar (service, rear-left)
        room_label("Bar", 3.5, 9.0, label_z);
        room_label("9.4 m²", 3.5, 8.5, label_z);

        // Copa (far-left rear)
        room_label("Copa", 1.2, 9.0, label_z);
        room_label("4.5 m²", 1.2, 8.5, label_z);

        // WC Sanitários
        room_label("WC", 8.5, 6.5, label_z);
    }
}

// ============================================================
// MODULE: First Floor (Andar / Cobertura)
//   Stacked at Z = wall_height + floor_slab
//   Layout (from floor plan image):
//   Top-left:    Quarto 4.60x3.40
//   Top-right:   Cozinha 4.00x3.40
//   Mid-left:    Quarto 4.60x3.20
//   Mid-right:   Casa de Banho
//   Bot-left:    Sala 4.50x4.30
//   Bot-right:   Quarto 4.20x3.40
// ============================================================
module first_floor() {
    base_z = wall_height + floor_slab;

    color("SteelBlue", 0.5) {

        // --- Outer perimeter walls ---
        wall_box(0, 0, building_w, wall_thickness, wall_height);
        wall_box(0, building_d - wall_thickness, building_w, wall_thickness, wall_height);
        wall_box(0, 0, wall_thickness, building_d, wall_height);
        wall_box(building_w - wall_thickness, 0, wall_thickness, building_d, wall_height);

        // --- Vertical central spine wall (X ≈ 4.6) ---
        wall_box(4.6, 0, wall_thickness, building_d, wall_height);

        // --- Horizontal partition: top rooms / middle rooms (Y ≈ 7.6) ---
        wall_box(0, 7.6, building_w, wall_thickness, wall_height);

        // --- Horizontal partition: middle / lower rooms (Y ≈ 4.4) ---
        wall_box(0, 4.4, building_w, wall_thickness, wall_height);

        // --- Bathroom / stairwell block (right side, middle band) ---
        // Vertical wall isolating bathroom (X ≈ 6.5)
        wall_box(6.5, 4.4, wall_thickness, 7.6 - 4.4, wall_height);
        // Horizontal sub-partition (Y ≈ 6.0)
        wall_box(4.6, 6.0, 6.5 - 4.6, wall_thickness, wall_height);

        // --- Floor slab ---
        translate([0, 0, -floor_slab])
            cube([building_w, building_d, floor_slab]);
    }

    // --- Room Labels ---
    color("MidnightBlue") {
        // Quarto 1 (top-left, 4.60x3.40)
        room_label("Quarto", 2.3, 9.2, label_z);
        room_label("4.60×3.40", 2.3, 8.7, label_z);

        // Cozinha (top-right, 4.00x3.40)
        room_label("Cozinha", 7.3, 9.2, label_z);
        room_label("4.00×3.40", 7.3, 8.7, label_z);

        // Quarto 2 (mid-left, 4.60x3.20)
        room_label("Quarto", 2.3, 6.1, label_z);
        room_label("4.60×3.20", 2.3, 5.6, label_z);

        // Casa de Banho (mid-right)
        room_label("Casa de Banho", 7.3, 5.5, label_z);

        // Sala (lower-left, 4.50x4.30)
        room_label("Sala", 2.3, 2.2, label_z);
        room_label("4.50×4.30", 2.3, 1.7, label_z);

        // Quarto 3 (lower-right, 4.20x3.40)
        room_label("Quarto", 7.3, 2.2, label_z);
        room_label("4.20×3.40", 7.3, 1.7, label_z);
    }
}

// ============================================================
// MODULE: Garage
//   Placed to the left of the main building (negative X)
//   5.5 wide × 4.5 deep, same wall_height
//   Terrace (Terraço) sits above it as a flat roof / open slab
// ============================================================
module garage() {
    // Offset garage to the left of the main building
    garage_x = -(garage_w + 0.5);
    garage_y = building_d - garage_d - 0.5;   // align toward rear

    color("DarkOliveGreen", 0.6) {
        translate([garage_x, garage_y, 0]) {

            // Perimeter walls
            wall_box(0, 0, garage_w, wall_thickness, wall_height);
            wall_box(0, garage_d - wall_thickness, garage_w, wall_thickness, wall_height);
            wall_box(0, 0, wall_thickness, garage_d, wall_height);
            wall_box(garage_w - wall_thickness, 0, wall_thickness, garage_d, wall_height);

            // Garage door opening (front, centred, 2.5 m wide) - left as void
            // Roof slab (solid top = Terraço base)
            translate([0, 0, wall_height])
                cube([garage_w, garage_d, floor_slab]);

            // Floor slab
            translate([0, 0, -floor_slab])
                cube([garage_w, garage_d, floor_slab]);
        }
    }

    // Terraço label on the roof level
    color("DarkGreen") {
        translate([garage_x + garage_w / 2, garage_y + garage_d / 2,
                   wall_height + floor_slab + 0.05])
            rotate([90, 0, 0])
                linear_extrude(height=0.02)
                    text("TERRAÇO", size=label_size * 1.2, halign="center",
                         valign="center",
                         font="Liberation Sans:style=Bold");

        translate([garage_x + garage_w / 2, garage_y + garage_d / 2 - 0.6,
                   wall_height + floor_slab + 0.05])
            rotate([90, 0, 0])
                linear_extrude(height=0.02)
                    text("(sobre Garagem)", size=label_size * 0.8,
                         halign="center", valign="center",
                         font="Liberation Sans");
    }

    // Garage ground label
    color("ForestGreen") {
        room_label("GARAGEM", garage_x + garage_w / 2, garage_y + garage_d / 2, label_z);
        room_label("5.50×4.50", garage_x + garage_w / 2, garage_y + garage_d / 2 - 0.5, label_z);
    }
}

// ============================================================
// ASSEMBLY: Stack floors and add garage
// ============================================================

// Ground floor at Z = 0
ground_floor();

// First floor stacked at top of ground floor walls + slab
translate([0, 0, wall_height + floor_slab])
    first_floor();

// Garage (separate, offset in X)
garage();

// ============================================================
// EOF
// ============================================================
