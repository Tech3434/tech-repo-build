# Changelog

All notable changes to this mod will be documented in this file.

## [0.3.0] - 2026-07-26

### Added

- **Parents Friends** — Loom and Huntsman move faster; Loom reaches / retracts slowly; Huntsman holds aim longer and shoots at the "ha!" lock point. Optional spawn guarantees when the level allows (they never replace each other). Configurable move / attack / aim multipliers with RuntimeOverride support.

### Changed

- Thunderstore dependency: Xepos Mutators **1.0.2 → 1.0.3**.

## [0.2.0] - 2026-07-05

### Fixed

- **Watchdog Out!** — `Transform cooldown` was bound to its own config section, separate from the mutator's Weight/Minimum level/Maximum level. It now shares the same section, and the value can be overridden by custom multi-mutators (via Mutators' `RuntimeOverride` mechanism), matching how the base game's mutators (e.g. Duck This) work.

## [0.1.0] - 2026-07-04

### Added

- **Watchdog Out!** — Elsa transforms on sight instead of waiting for pets; at least one Elsa spawns per run; leaves after raging. Configurable `Transform cooldown` (default 50s).
- **MAP-side Down** — flips the Tab minimap screen 180° (client-side visual only).
- **Silent Stalkers** — mutes enemy sounds on your own client; encounter/ambience sounds are unaffected. Optional extra compatibility with Wesley's Enemies.

### Notes

- First public release. Tested small private lobbies.
