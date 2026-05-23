// ============================================================
// variables.scad — All parametric values for building.scad
// Edit this file to tune the model without touching geometry.
// ============================================================

// --- Structural ---
wall_thickness = 0.2;    // [m] exterior & interior wall thickness
gf_wall_height = 3.0;    // [m] pé-direito RC (Café/Bar)
wall_height    = 2.8;    // [m] pé-direito 1º Andar e Garagem
floor_slab     = 0.15;   // [m] concrete slab thickness between floors

// --- Main building footprint ---
building_w = 11.0;       // [m] width  (X axis)
building_d = 11.0;       // [m] depth  (Y axis)

// --- Garage footprint ---
garage_w   = 5.5;        // [m]
garage_d   = 4.5;        // [m]
arrumos_d  = 3.0;        // [m] storage room depth behind garage
garage_offset_x = building_w + 1.2;  // right of house + staircase (1.0 wide + 0.2 gap)
garage_offset_y = 0.0;               // front-aligned with main building

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
stair_rise    = 0.1875;  // [m] riser height per step (16 × 0.1875 = 3.0 m)
stair_steps   = 16;      // number of steps to reach gf_wall_height
stair_x       = building_w + 0.1;  // [m] outside right wall, between house and garage
stair_y       = 0.1;               // [m] aligned with front of building

// --- Labels ---
label_size = 0.35;       // [m] room label font size
label_z    = 1.2;        // [m] label height above floor level

// --- Ground floor interior partition positions ---
gf_front_y = 6.6;        // Café+Bar | Sala de Jantar horizontal divider
gf_bar_x   = 7.5;        // Café | Bar vertical divider (front zone)
gf_sala_x  = 6.0;        // Sala de Jantar right wall (rear zone)
gf_wc_x    = 8.0;        // WC block left wall (rear-right zone)
gf_wc_sep  = 9.2;        // WC cubicle partition Y

// --- First floor interior partition positions ---
ff_spine_x = 4.6;        // central spine wall X (left/right divider)
ff_kitch_y = 3.4;        // kitchen depth on right side (front)
ff_top_y   = 7.7;        // Quarto 1 | Quarto 2 divider Y
ff_mid_y   = 4.3;        // Sala | Quarto 1 divider Y
ff_bath_x  = 7.5;        // bathroom left wall X (right side)
ff_bath_y  = 5.5;        // bathroom sub-partition Y
