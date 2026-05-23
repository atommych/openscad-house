# Especificação de Arquitectura — Edifício Rebordões

Modelo paramétrico 3D em OpenSCAD do edifício misto em Rebordões, Portugal.  
Ficheiros: `building.scad` (geometria) · `variables.scad` (parâmetros).  
Escala: 1 unidade = 1 metro.

---

## Implantação geral

```
Y
^
|  [Edifício principal 11×11]  [Escada]  [Garagem+Arrumos 5.5×7.5]
|
+-----------------------------------------------------------> X
   X=0                        X=11.1  X=12.2            X=17.7
```

| Elemento | X (início) | X (fim) | Y (início) | Y (fim) |
|---|---|---|---|---|
| Edifício principal | 0.0 | 11.0 | 0.0 | 11.0 |
| Escada exterior | 11.1 | 12.1 | 0.1 | 4.42 |
| Garagem + Arrumos | 12.2 | 17.7 | 0.0 | 7.5 |

---

## Níveis verticais (Z)

| Nível | Z início | Z fim | Espessura |
|---|---|---|---|
| Laje de piso RC | −0.15 | 0.00 | 0.15 m |
| **RC (Café/Bar)** | 0.00 | 3.00 | **3.00 m** |
| Laje inter-pisos | 3.00 | 3.15 | 0.15 m |
| **1.º Andar** | 3.15 | 5.95 | **2.80 m** |
| Laje terraço garagem | 2.80 | 2.95 | 0.15 m |

---

## Estrutura — parâmetros gerais

| Variável | Valor | Descrição |
|---|---|---|
| `wall_thickness` | 0.20 m | Espessura de todas as paredes |
| `gf_wall_height` | 3.00 m | Pé-direito RC |
| `wall_height` | 2.80 m | Pé-direito 1.º Andar e Garagem |
| `floor_slab` | 0.15 m | Espessura das lajes |
| `building_w` | 11.0 m | Largura do edifício (eixo X) |
| `building_d` | 11.0 m | Profundidade do edifício (eixo Y) |

---

## RC — Rés-do-Chão (Café/Bar)

Uso: comercial. Pé-direito: 3.0 m.

### Divisórias interiores

| Variável | Valor | Descrição |
|---|---|---|
| `gf_front_y` | 6.6 m | Parede horizontal: Café+Bar (frente) / Sala de Jantar (fundo) |
| `gf_bar_x` | 7.5 m | Parede vertical: Café (esq.) / Bar (dir.) — zona frontal |
| `gf_sala_x` | 6.0 m | Parede direita da Sala de Jantar — zona traseira |
| `gf_wc_x` | 8.0 m | Parede esquerda do bloco WC — zona traseira-direita |
| `gf_wc_sep` | 9.2 m | Separação interior do WC (eixo Y) |

### Espaços

| Espaço | Zona (X) | Zona (Y) | Área aprox. |
|---|---|---|---|
| Café Snack-Bar | 0.0 → 7.5 | 0.0 → 6.6 | 50 m² |
| Bar | 7.5 → 11.0 | 0.0 → 6.6 | 9.7 m² |
| Sala de Jantar | 0.0 → 6.0 | 6.6 → 11.0 | 27 m² |
| Copa | 6.0 → 8.0 | 6.6 → 11.0 | — |
| WC | 8.0 → 11.0 | 6.6 → 11.0 | — |

### Aberturas — RC

**Parede frontal (Y = 0):**

| Abertura | X início | Largura | Z início | Altura | Tipo |
|---|---|---|---|---|---|
| Montra esquerda | 0.40 | 1.40 m | 0.90 | 1.20 m | Janela |
| Entrada principal | 2.20 | 0.90 m | 0.00 | 2.10 m | Porta |
| Montra direita | 6.20 | 1.20 m | 0.90 | 1.20 m | Janela |
| Entrada lateral | 8.50 | 0.90 m | 0.00 | 2.10 m | Porta |

**Parede lateral esquerda (X = 0):** janela em Y = 4.0, 1.20 × 1.20 m, peitoril 0.90 m  
**Parede lateral direita (X = 11.0):** janela em Y = 3.5, 1.20 × 1.20 m, peitoril 0.90 m  
**Divisória Café/Sala de Jantar (Y = 6.6):** porta interior em X = 3.0, 0.90 × 2.10 m  
**Divisória Café/Bar (X = 7.5):** porta interior em Y = 3.3, 0.90 × 2.10 m  
**Parede direita Sala de Jantar (X = 6.0):** porta interior em Y = 2.0 (relativo ao Y = 6.6), 0.90 × 2.10 m

---

## 1.º Andar

Uso: habitacional T3. Pé-direito: 2.8 m. Arranca em Z = 3.15 m.

### Divisórias interiores

| Variável | Valor | Descrição |
|---|---|---|
| `ff_spine_x` | 4.6 m | Parede-espinha central (eixo X) |
| `ff_kitch_y` | 3.4 m | Parede traseira da cozinha (lado direito) |
| `ff_mid_y` | 4.3 m | Divisória Sala / Quarto 1 (lado esquerdo) |
| `ff_top_y` | 7.7 m | Divisória Quarto 1 / Quarto 2 (lado esquerdo) |
| `ff_bath_x` | 7.5 m | Parede esquerda da casa de banho (lado direito) |
| `ff_bath_y` | 5.5 m | Sub-divisória da casa de banho (eixo Y) |

### Espaços

| Espaço | Zona (X) | Zona (Y) | Dimensões | Área |
|---|---|---|---|---|
| Sala | 0.0 → 4.6 | 0.0 → 4.3 | 4.50 × 4.30 m | 19.4 m² |
| Quarto 1 | 0.0 → 4.6 | 4.3 → 7.7 | 4.60 × 3.40 m | 15.6 m² |
| Quarto 2 | 0.0 → 4.6 | 7.7 → 11.0 | 4.60 × 3.20 m | 14.7 m² |
| Cozinha | 4.6 → 11.0 | 0.0 → 3.4 | 4.00 × 3.40 m | 13.6 m² |
| Quarto 3 | 4.6 → 7.5 | 3.4 → 7.7 | 4.20 × 3.40 m | 14.3 m² |
| Casa de Banho | 7.5 → 11.0 | 3.4 → 7.7 | — | — |

### Aberturas — 1.º Andar

**Parede frontal (Y = 0):** duas janelas de 1.20 × 1.20 m em X = 1.0 e X = 5.5, peitoril 0.90 m  
**Parede lateral esquerda (X = 0):** janela em Y = 5.0, 1.20 × 1.20 m, peitoril 0.90 m  
**Parede lateral direita (X = 11.0):**
- Porta de varanda em Y = 1.0, 1.40 × 2.10 m
- Janela em Y = 5.0, 1.20 × 1.20 m, peitoril 0.90 m

**Parede-espinha (X = 4.6):** porta interior em Y = 2.2, 0.90 × 2.10 m  
**Divisória Sala/Q1 (Y = 4.3):** porta interior em X = 2.3, 0.90 × 2.10 m  
**Divisória Q1/Q2 (Y = 7.7):** porta interior em X = 2.3, 0.90 × 2.10 m  
**Parede C. Banho (X = 7.5):** porta interior em Y = 1.5 (relativo ao Y = 3.4), 0.90 × 2.10 m

---

## Garagem e Arrumos

Estrutura separada, à direita do edifício principal.  
Posição: `garage_offset_x = 12.2 m`, `garage_offset_y = 0.0 m`.

| Variável | Valor | Descrição |
|---|---|---|
| `garage_w` | 5.5 m | Largura |
| `garage_d` | 4.5 m | Profundidade da garagem |
| `arrumos_d` | 3.0 m | Profundidade dos arrumos |
| `garage_door_w` | 2.5 m | Largura do portão |
| `garage_door_h` | 2.2 m | Altura do portão |

| Espaço | Y (início) | Y (fim) | Área |
|---|---|---|---|
| Garagem | 0.0 | 4.5 | 24.75 m² |
| Arrumos | 4.5 | 7.5 | 16.50 m² |
| Terraço (laje) | 0.0 | 7.5 | 41.25 m² |

**Portão da garagem:** centrado em X, em Y = 0; largura 2.50 m, altura 2.20 m.  
**Pé-direito:** 2.80 m (`wall_height`).  
**Terraço:** laje a Z = 2.95 m (2.80 + 0.15) cobrindo garagem + arrumos.

---

## Escada exterior RC → 1.º Andar

Localização: entre o edifício principal e a garagem, à direita.

| Variável | Valor |
|---|---|
| `stair_x` | 11.1 m (= `building_w` + 0.1) |
| `stair_y` | 0.1 m |
| `stair_w` | 1.0 m (largura do lanço) |
| `stair_steps` | 16 degraus |
| `stair_rise` | 0.1875 m / degrau |
| `stair_run` | 0.27 m / degrau |
| Subida total | 3.0 m (= 16 × 0.1875) |
| Desenvolvimento horizontal | 4.32 m (= 16 × 0.27) |

---

## Áreas totais (valores de referência)

| Nível | Área bruta |
|---|---|
| RC (edifício principal) | 121 m² (11.0 × 11.0) |
| 1.º Andar (edifício principal) | 121 m² |
| Garagem + Arrumos | 41.25 m² (5.5 × 7.5) |
| **Total construído** | **~283 m²** |

> Valores das plantas oficiais (CPU.pdf): footprint 160.45 m² · área bruta total 320.9 m².
