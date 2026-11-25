# Changelog

## 0.3.0

### Added
- **New custom box art.** The Generator upgrade box no longer looks like the stamina upgrade. It now has its own purple design with a generator on the front, a spec sheet, a warning label, a battery gauge and barcodes on the sides, plus worn, distressed edges and fold lines
- The box art ships as `generator_box.png`, which sits next to the mod's DLL

### Changed
- The shop box is now a separate retextured copy of the vanilla box, so the vanilla stamina upgrade box is never changed
- If `generator_box.png` is missing, or the game changes the box texture, the mod logs a warning and keeps the vanilla look instead of failing

## 0.2.0

Initial Thunderstore release.

### Added
- **Generator** upgrade in the shop, registered through REPOLib so levels are saved and synced
- Each Generator level slowly recharges the truck's energy bar during active levels
- Configurable shop price, shop chance, purchase limit, and recharge rate
- Optional debug logging

### Changed
- Recharge now runs as a patch on the charging station's own update loop and adds charge smoothly every frame. The game then derives the bar, segments, and network sync from that value.

### Fixed
- Charge added by the Generator no longer snaps back to its starting value, so the energy bar now actually rises during levels
