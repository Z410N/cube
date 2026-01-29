# Cuadris

Generative art sketch built with [Processing](https://processing.org/) (P3D).

Produces 3D compositions of colored box grids, thin lines, and micro-cubes scattered in space with random rotations. Each generation uses a unique seed for full reproducibility.

## Output

- Preview window: 960×960
- Saved images: 3840×3840 PNG (offscreen hi-res rendering)

## Controls

| Key | Action |
|-----|--------|
| Any key | Generate new artwork with random seed |
| `s` | Save current artwork as timestamped PNG |

## Requirements

- [Processing 4](https://processing.org/download)

## Run

Open `cuadris.pde` in Processing IDE, or from command line:

```
processing-java --sketch=/path/to/cuadris --run
```

## How it works

The sketch renders the same scene twice per generation:
1. On the 960×960 window for live preview
2. On a 1920×1920 offscreen `PGraphics` buffer (output 3840×3840 with `pixelDensity(2)`)

Three layers of 3D elements are placed with random rotations and positions:
- **640 box grids** — subdivided boxes with checkerboard coloring
- **640 thin lines** — elongated flat boxes
- **6400 micro-cubes** — tiny scattered particles

Colors are interpolated from a 5-color palette using `lerpColor`.

## License

MIT
