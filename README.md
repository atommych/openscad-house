# Building 3D Model — R. Dr. Victor Garrett, 71

OpenSCAD parametric 3D model of a two-storey mixed-use building in
São Tomé Negrelos, Santo Tirso, Portugal.

## Structure

| File | Description |
|------|-------------|
| `building.scad` | Single-file OpenSCAD model |

## Modules

| Module | Description |
|--------|-------------|
| `ground_floor()` | RC: Café Snack-Bar (50 m²), Sala de Jantar (27 m²), Bar + Copa service area, WC block |
| `first_floor()` | 1st floor: Sala (4.5×4.3), Cozinha (4.0×3.4), 3 Quartos, Casa de Banho |
| `garage()` | Separate garage (5.5×4.5) with Terraço slab above |

## Key Parameters

```openscad
wall_thickness = 0.2;   // metres
wall_height    = 2.8;   // metres per floor
floor_slab     = 0.15;  // metres
```

## Scale

**1 OpenSCAD unit = 1 metre**

## Usage

1. Install [OpenSCAD](https://openscad.org/) (v2021.01 or later).
2. Open `building.scad`.
3. Press **F5** to preview or **F6** to render.

## Colour Coding

| Colour | Element |
|--------|---------|
| SandyBrown (semi-transparent) | Ground floor walls |
| SteelBlue (semi-transparent) | First floor walls |
| DarkOliveGreen | Garage |

## Building Data (from Caderneta Predial)

- **Address:** R. Dr. Victor Garrett, 71, São Tomé Negrelos, 4795-679
- **Artigo Matricial:** 1218
- **Land area:** 650 m²
- **Implantation area:** 160.45 m²
- **Gross construction area:** 320.9 m²
- **Year built:** 1990
- **Energy certificate:** Class F (SCE399933440, valid to 25/03/2036)
