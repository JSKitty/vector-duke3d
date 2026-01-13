# Duke Nukem 3D WebXDC

Classic Duke Nukem 3D (1996) running as a WebXDC mini-app for [Vector](https://vector.im) and other WebXDC-compatible messengers.

## Features

- **Episode 1: L.A. Meltdown** - Full shareware episode (8 levels)
- **Full Audio** - Sound Blaster 16 digitized effects + AdLib/OPL music
- **DOOM-style Controls** - WASD movement with Q/E for fire/use
- **Gamepad Support** - Full controller support with customizable mapping
- **Responsive Canvas** - Scales to fit any screen size while maintaining aspect ratio
- **Clean Boot** - Loading screen hides DOSBox boot sequence

## Controls

### Keyboard (DOOM-style)

| Action | Key |
|--------|-----|
| Move Forward | W / Up Arrow |
| Move Backward | S / Down Arrow |
| Turn Left | Left Arrow |
| Turn Right | Right Arrow |
| Strafe Left | A |
| Strafe Right | D |
| Fire | Q / Left Ctrl |
| Use/Open | E / Space |
| Jump | Space |
| Crouch | C / Z |
| Run | Shift |
| Map | Tab |
| Menu | Escape |
| Weapons | 1-0 |

### Gamepad

| Action | Button |
|--------|--------|
| Move | Left Stick (up/down) |
| Strafe | Left Stick (left/right) |
| Turn | Right Stick (horizontal) / D-Pad |
| Fire | RT / RB |
| Use/Open | A |
| Jump | X |
| Crouch | B |
| Map | Y |
| Menu | Start |
| Confirm | Select |
| Prev/Next Weapon | LB / LT |

## Technical Details

### Architecture

- **DOSBox Emulation**: Uses [js-dos](https://js-dos.com/) v7.4.9 (WebAssembly DOSBox port)
- **Game Data**: Duke Nukem 3D Shareware v1.3 (legally distributable)
- **Bundle Format**: `.jsdos` bundle containing game files + DOSBox configuration

### File Structure

```
duke3d.xdc/
├── index.html          # Main app with game initialization
├── manifest.toml       # WebXDC manifest
├── icon.png            # App icon (Duke)
├── vector.png          # Vector logo for loading screen
├── js-dos.js           # js-dos v7 library
├── js-dos.css          # js-dos styles
├── wdosbox.js          # DOSBox WASM loader
├── wdosbox.wasm        # DOSBox WebAssembly binary
└── duke3d.jsdos        # Game bundle (GRP + config)
```

### DOSBox Configuration

```ini
[sblaster]
sbtype=sb16
sbbase=220
irq=7
dma=1
hdma=5

[cpu]
cycles=max

[autoexec]
SET BLASTER=A220 I7 D1 H5 T6
mount c .
c:
DUKE3D.EXE
```

### Game Configuration (DUKE3D.CFG)

Sound Blaster settings must match DOSBox:
- `BlasterAddress = 0x220`
- `BlasterInterrupt = 7`
- `BlasterDma8 = 1`
- `BlasterDma16 = 5`

## Building

```bash
./build.sh
```

Outputs `duke3d.xdc` (~6.3MB) ready for deployment.

### Prerequisites

- Bash shell
- `zip` command

## Size Breakdown

| Component | Size |
|-----------|------|
| duke3d.jsdos (game) | ~5.6MB |
| wdosbox.wasm | ~500KB |
| js-dos.js | ~200KB |
| Other assets | ~50KB |
| **Total (compressed)** | **~6.3MB** |

## Known Limitations

- **Mouse**: Mouse capture works but DOSBox mouse input is unreliable in WebAssembly
- **Save Games**: Not persistent across sessions (DOSBox limitation)
- **Performance**: May vary on low-end devices due to WASM emulation

## Credits & Attribution

- **[3D Realms / Gearbox](https://www.gearboxsoftware.com/)** - Duke Nukem 3D (1996)
- **[js-dos](https://js-dos.com/)** - DOSBox WebAssembly emulator
- **[DOSBox](https://www.dosbox.com/)** - Original DOS emulator
- **[Vector](https://vector.im)** - WebXDC messenger platform

## License

Duke Nukem 3D shareware is freely distributable but remains copyrighted by 3D Realms/Gearbox Software. The shareware version may be freely distributed but cannot be sold.

js-dos is licensed under GPL-2.0.

---

*Built for Vector*
