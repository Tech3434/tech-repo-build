# Mutators Addon

Unofficial extension for [Xepos Mutators](https://thunderstore.io/c/repo/p/Xepos/Mutators/)  
Adds extra mutator events to Mutators.

## Mutators

| Name | Effect |
|------|--------|
| **Watchdog Out!** | Elsa transforms on sight instead of waiting for pets. |
| **MAP-side Down** | The minimap screen is rotated 180 degrees. |
| **Silent Stalkers** | You cannot hear the enemy sounds. Optional extra compatibility with [Wesley's Enemies](https://thunderstore.io/c/repo/p/Magic_Wesley/Wesleys_Enemies/) if installed. |
| **Parents Friends** | Loom and Huntsman are eager to approach you — kind hands and a kind gun. |

### Watchdog Out! — config

| Setting | Default | Notes |
|---------|---------|--------|
| Transform cooldown | 50 | Seconds before Elsa can transform again after leaving |

Supports Mutators **RuntimeOverride** (custom multi-mutator JSON key: `transform-cooldown`).

### Parents Friends — config defaults

| Setting | Default | Notes |
|---------|---------|--------|
| Loom move speed multiplier | 2 | Chase / leave |
| Loom attack speed multiplier | 0.2 | Reach-out & hand-return only |
| Huntsman move speed multiplier | 3 | Roam / investigate / leave |
| Huntsman aim speed multiplier | 0.5 | Aim wait after "ha!" (max 1 = vanilla length) |

Also supports **RuntimeOverride** (keys: `loom-move-speed-mult`, `loom-attack-speed-mult`, `huntsman-move-speed-mult`, `huntsman-aim-speed-mult`).

## Requires

- [BepInEx](https://thunderstore.io/c/repo/p/BepInEx/BepInExPack/)
- [Xepos Mutators](https://thunderstore.io/c/repo/p/Xepos/Mutators/)
- [Zehs REPOLib](https://thunderstore.io/c/repo/p/Zehs/REPOLib/) (enemy spawn / guarantee logic for Watchdog Out! and Parents Friends)

This is an **unofficial add-on**. It does not include or redistribute Mutators source code; it only registers new mutators through the public API Mutators provides for third-party developers.

## Credits

- **[Xepos / Mutators](https://thunderstore.io/c/repo/p/Xepos/Mutators/)** — the mutator framework and public registration API this addon depends on. Huge thanks for making an extensible system; without it this addon wouldn't exist.
- **Watchdog Out!** — the "transform on sight" idea is inspired by the built-in *Duck This* mutator; the implementation is original, Elsa-specific logic written for this addon.
- **GastrodonGroup** — packaging and maintenance.

## Disclaimer

The maintainer is **not an experienced C# developer**. Most of this codebase was written with **AI assistance**. It has been tested in small private lobbies, but please use at your own risk and report issues if you find any.

## Installation

Use a mod manager (r2modman / Gale / Thunderstore Mod Manager) and install alongside Xepos Mutators. All players in a lobby should have the same mod set installed.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Issues / Feedback

Please report bugs or suggestions via GitHub Issues.
