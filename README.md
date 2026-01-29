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

## Palettes

Each generation picks a random palette from 43 available. The palette is deterministic per seed.

| # | Name | Colors |
|---|------|--------|
| 0 | og | `#F4D3DE, #E04728, #F7B63D, #3F9686, #313168` |
| 1 | Anglican | `#2b2b2b, #e5e5e5, #fca311, #14213d` |
| 2 | Baikal | `#2d3142, #bfc0c0, #ffffff, #ef8354, #4f5d75` |
| 3 | Black & White | `#000000, #ffffff` |
| 4 | Buy me a shrubbery | `#1c7c54, #73e2a7, #def4c6, #1b512d, #b6e2d3` |
| 5 | CC239 | `#e3ddcf, #6c6b61, #e8472e, #2d3637, #c6b5b5` |
| 6 | CC242 | `#4c5b5c, #ff715b, #f9cb40, #bced09, #2f52e0` |
| 7 | Cliffs | `#011627, #fdfffc, #2ec4b6, #e71d36, #ff9f1c` |
| 8 | Cold | `#3d5a80, #98c1d9, #e0fbfc, #ee6c4d, #293241` |
| 9 | Cube | `#e2e2e2, #c9c9c9, #919191, #5e5e5e, #2b2b2b` |
| 10 | Ducci J | `#3b3628, #c39a8e, #e6c9c6, #674843, #394a59` |
| 11 | Ducci Q | `#403337, #d9b8a8, #a6897e, #734c3e, #261c1a` |
| 12 | Ducci U | `#f2f2f2, #d9d9d9, #bfbfbf, #a6a6a6, #8c8c8c` |
| 13 | Ducci V | `#d9d9d9, #bfbfbf, #a6a6a6, #8c8c8c, #737373` |
| 14 | Ducci X | `#dd614a, #f5af29, #f5f5f5, #73a580, #1a535c` |
| 15 | Electric | `#00ffff, #ff00ff, #ffff00, #000000` |
| 16 | Four | `#222222, #333333, #444444, #555555` |
| 17 | Grey | `#eeeeee, #cccccc, #aaaaaa, #888888, #666666, #444444, #222222` |
| 18 | Highur | `#1a535c, #4ecdc4, #f7fff7, #ff6b6b, #ffe66d` |
| 19 | Jung | `#e7e6e1, #f7f6e7, #d8c8b8, #b8a898, #988878` |
| 20 | Levin | `#3b3b3b, #e5e5e5, #fca311, #14213d` |
| 21 | Meta | `#e63946, #f1faee, #a8dadc, #457b9d, #1d3557` |
| 22 | Mono | `#000000, #111111, #222222, #333333, #444444` |
| 23 | Neco | `#0b090a, #161a1d, #660708, #a4161a, #ba181b, #e5383b, #b1a7a6, #d3d3d3, #f5f3f4, #ffffff` |
| 24 | Night | `#000000, #14213d, #fca311, #e5e5e5, #ffffff` |
| 25 | Ouch | `#fdfffc, #2ec4b6, #e71d36, #ff9f1c, #011627` |
| 26 | Paddle | `#2e294e, #541388, #f1e9da, #ffd400, #d90368` |
| 27 | Palettes | `#f2d7ee, #d3bcc0, #a5668b, #69306d, #0e103d` |
| 28 | Pencils | `#f94144, #f3722c, #f8961e, #f9844a, #f9c74f, #90be6d, #43aa8b, #4d908e, #577590, #277da1` |
| 29 | Pigs | `#f08080, #f4978e, #f8ad9d, #fbc4ab, #ffdab9` |
| 30 | Pink | `#ffcdb2, #ffb4a2, #e5989b, #b5838d, #6d6875` |
| 31 | Pxtn | `#e63946, #f1faee, #a8dadc, #457b9d, #1d3557` |
| 32 | Rbn | `#001219, #005f73, #0a9396, #94d2bd, #e9d8a6, #ee9b00, #ca6702, #bb3e03, #ae2012, #9b2226` |
| 33 | Red | `#a4161a, #ba181b, #e5383b, #b1a7a6, #d3d3d3` |
| 34 | Retro | `#264653, #2a9d8f, #e9c46a, #f4a261, #e76f51` |
| 35 | Rubber | `#2b2d42, #8d99ae, #edf2f4, #ef233c, #d90429` |
| 36 | Serpentine | `#2a9d8f, #e9c46a, #f4a261, #e76f51, #264653` |
| 37 | Slate | `#495057, #343a40, #212529, #adb5bd, #ced4da` |
| 38 | Tiong Bahru | `#5f6c7b, #fffffe, #3d405b, #e07a5f, #81b29a` |
| 39 | Tundra | `#5f6c7b, #fffffe, #3d405b, #e07a5f, #81b29a` |
| 40 | Warp | `#540d6e, #ee4266, #ffd23f, #3bceac, #0ead69` |
| 41 | Waves | `#264653, #2a9d8f, #e9c46a, #f4a261, #e76f51` |
| 42 | Wb | `#ffffff, #000000` |

Colors are interpolated between adjacent palette entries using `lerpColor`.

## License

MIT
