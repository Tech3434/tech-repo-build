# Changelog

## [1.0.3] - 2026-02-09

### Changed
- Initial value show is configurable now, default is `false` (previously always `true`).

### Fixed
- Resolved nullable reference warnings in StuckValuableRelocator.

## [1.0.2] - 2026-02-08

### Added

- Spawn-slot aware relocation: move stuck valuables to a free `ValuableVolume` slot.
- Mid-game spawn detection for items that spawn during gameplay (e.g. BlindBox, enemy drops, containers).
