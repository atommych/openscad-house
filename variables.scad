// ============================================================
// variables.scad — All parametric values for building.scad
// Edit this file to tune the model without touching geometry.
// ============================================================

// --- Structural ---
wall_thickness = 0.2;    // [m] exterior & interior wall thickness
wall_height    = 2.8;    // [m] floor-to-ceiling height (both floors)
floor_slab     = 0.15;   // [m] concrete slab thickness between floors

// --- Main building footprint ---
building_w = 10.0;       // [m] width  (X axis)
building_d = 11.0;       // [m] depth  (Y axis)

// --- Garage footprint ---
garage_w = 5.5;          // [m]
garage_d = 4.5;          // [m]
garage_offset_x = -(garage_w + 0.5);   // left of main building
garage_offset_y = 3.0;                 // aligned toward rear

// --- Openings ---
door_w  = 0.9;           // [m] standard interior door width
door_h  = 2.1;           // [m] standard interior door height
window_w = 1.2;          // [m] standard window width
window_h = 1.2;          // [m] standard window height
window_sill = 0.9;       // [m] height of window sill from floor

// Garage door
garage_door_w = 2.5;     // [m]
garage_door_h = 2.2;     // [m]

// --- Staircase ---
stair_w       = 1.0;     // [m] stair flight width
stair_run     = 0.27;    // [m] tread depth (horizontal run per step)
stair_rise    = 0.175;   // [m] riser height per step
stair_steps   = 16;      // number of steps to reach wall_height
stair_x       = 4.8;     // [m] X position in building
stair_y       = 3.5;     // [m] Y position in building

// --- Labels ---
label_size = 0.35;       // [m] room label font size
label_z    = 1.2;        // [m] label height above floor level

// --- Ground floor interior partition X positions ---
gf_div_x   = 5.5;        // Café | Sala de Jantar divider
gf_rear_y  = 7.6;        // service area rear wall Y
gf_wc_x    = 7.5;        // WC block left wall X
gf_wc_y    = 5.0;        // WC block front wall Y
gf_wc_sep  = 7.8;        // WC cubicle partition Y

// --- First floor interior partition positions ---
ff_spine_x = 4.6;        // central spine wall X
ff_top_y   = 7.6;        // top band / middle band divider Y
ff_mid_y   = 4.4;        // middle band / lower band divider Y
ff_bath_x  = 6.5;        // bathroom left wall X
ff_bath_y  = 6.0;        // bathroom sub-partition Y
