# ItemUnstuck

Detects valuables that spawn stuck inside world geometry and relocates them to a free valuable spawn slot. Also applies a short invincibility window after spawn.

## Features

- **Spawn-slot aware relocation**: moves stuck valuables to another recorded `ValuableVolume` slot that isn’t occupied
- **Invincibility window**: makes valuables temporarily indestructible right after spawn (configurable)
- **HUD notification (optional)**: shows a message when valuables were relocated
- **Value diagnostics**: logs baseline total value vs. after-scan totals (helps spot value loss)
- **Mid-game spawn detection**: automatically detects and relocates valuables that spawn during gameplay (e.g., from BlindBox, enemy drops, containers)

## Configuration

Config file:

- `BepInEx\config\Tolga.ItemUnstuck.cfg`

Notable settings:

- `Enable`
- `EnableRelocation`
- `ScanDelaySeconds`
- `HudNotifications`
- `ShowInitialValueOnGrab`
- `InvulnerableUntilGrab`
- `FallThroughRecoveryEnabled`
- `RestoreValueToInitial`
- `EnableMidGameDetection` — detect items spawned after level load
- `MidGameScanDelaySeconds` — delay before checking mid-game spawned items (default: 2.5s)
- `MidGameHudNotifications` — show HUD message when mid-game items are relocated

Advanced tuning settings are grouped under sections like:

- `Advanced.Invulnerability`
- `Advanced.StuckDetection`
- `Advanced.MotionProbe`
- `Advanced.FallThrough`
- `Advanced.DamageFlow`
- `Advanced.Relocation`
- `Advanced.MidGameDetection`

## Installation

### Thunderstore (recommended)

Install with Thunderstore Mod Manager and launch the game.

### Manual

1. Install **BepInEx 5**
2. Copy the DLL to:

- `R.E.P.O.\BepInEx\plugins\ItemUnstuck\ItemUnstuck.dll`

## Dependencies

- `BepInEx-BepInExPack-5.4.2304`

## Multiplayer notes

- Relocation runs on the **master client** to avoid desync.

## Special thanks

- teragos — for helping test the mod!
