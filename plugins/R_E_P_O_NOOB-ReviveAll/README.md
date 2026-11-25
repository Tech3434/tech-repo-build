# ReviveAll

Instead of the usual game over when **every player is dead**, the screen fades to black and you are asked whether the whole team should be revived. Revived players wake up in the **truck**, not where they died.

You can also **buy extra revives and extra revive health in the shop**.

## Features

- **Revive prompt on game over.** When all players are dead, the host sees `Revive everyone?` with `[Y] Yes` and `[N] No`.
- **Limited revives per run.** You start with 3 (configurable). Every revive that is used is counted.
- **Revive at the truck.** Every player is brought back to the exact spot the game gave them at the start of the level, so nobody wakes up next to the monster that killed them.
- **Configurable health.** Players come back with a set amount of health (default 50, capped at their max health).
- **HUD counter.** The remaining revives are shown in the HUD (top right in levels, next to the level number in the shop). The number turns red at 0.
- **Savegame support.** Used and bought revives and the bonus health are stored with your run and restored when you load a save.
- **Two shop items.** Both are only used up on purchase and are not delivered to the truck:
  - **Revive**: adds one revive for the whole team.
  - **Revive Start Health**: adds 10 HP to the health players get when they are revived. Every purchase stacks (+10 HP each), up to the player's max health.
- **Arena friendly.** When all revives are used up, the normal game over (and the arena mini game) happens. If everyone dies in the arena, or after it, you are **not** asked to revive again. The prompt is back at the start of the next run.

## How to play

1. Everyone dies.
2. The screen turns black and the question appears.
3. Press **Y** to revive everyone, or **N** to end the run as normal.
   - On a German keyboard the Y key (labelled Y) works as well as the key labelled Z.
4. After the last revive is used, the normal game over happens.

Only the **host** (or the single player) makes the decision.

## Configuration

The config file is created after the first start: `BepInEx/config/reviveall.cfg`

| Section | Setting | Default | Description |
|---|---|---|---|
| General | `MaxRevives` | `3` | Revives at the start of a run. |
| General | `ReviveHealth` | `50` | Health after being revived (1-1000, capped at max health). Bought "Revive Start Health" is added on top. |
| Shop | `ShopPrice` | `1` | Price of the **Revive** item, in thousands (4 = $4K). |
| Shop | `ShopPrice2` | `1` | Price of the **Revive Start Health** item, in thousands (4 = $4K). |
| Shop | `TemplateItem` | `Item Upgrade Player Grab Range` | Advanced: existing item that is copied to create the shop items. |
| Shop | `ItemColor` | `#4DFF80` | Colour of the **Revive** item (hex) when no `revive.png` is present. Leave empty to keep the original look. |

## Custom look (optional)

The mod ships with card images for both shop items. They are loaded from the folder next to the mod DLL:

- `revive.png`: card image of the **Revive** item
- `revivestarthealth.png`: card image of the **Revive Start Health** item

You can replace them with your own images. If a file is missing, the item is simply tinted instead (green for Revive, blue for Revive Start Health).

## Multiplayer

- **Every player needs the mod** (and REPOLib), otherwise the revive counter in the HUD and the shop items will not work for them.
- The host decides and buys. The counter is synced to the other players about once per second.

## Requirements

- BepInEx
- REPOLib

Tested with R.E.P.O. v0.5.1 and REPOLib 4.3.0.

## Troubleshooting

- The mod uses internal game methods. After a big game update something may stop working. The mod then tries fallbacks and writes details to `BepInEx/LogOutput.log` (look for lines starting with `[Revive All]`). Please attach that log when you report an issue.
- In the log you can see how the teleport worked: `Verwende die vom Spiel erfassten Spawn-Positionen (Truck)` means the spawn positions recorded from the game were used. If you see `Keine erfasste Spawn-Position ...` instead, a fallback search was used (for example when the mod was installed in the middle of a level).
- Debug keys (in game):
  - **F9** writes diagnostic info to `BepInEx/ReviveAll_dump.txt`.
  - **F10** exports the textures of the template item to `BepInEx/ReviveAll_textures`.

## Known issues

- Mainly tested solo. Feedback from multiplayer sessions is very welcome.
- The shop items appear randomly like other shop items, so they may not be in every shop.
- Other mods that change the same HUD texts may change the order of the lines.
- A revive in a level that was already running before the mod was installed uses a fallback spawn search, because the game's spawn position was not recorded.

## Changelog

### 1.6.1
- Fixed: players were revived but not teleported to the truck after the latest R.E.P.O. updates. The mod now records the spawn position the game assigns to each player at the start of a level and uses exactly that. Fallbacks are still in place if the game changes its internals again.
- Fixed: after the arena mini game the revive prompt appeared again, and choosing "No" restarted the arena. The prompt no longer appears once the run is over.
- New shop item: **Revive Start Health** (+10 HP revive health per purchase).
- Separate price settings for both shop items (`ShopPrice`, `ShopPrice2`).
- Card images for both shop items.
- Player names instead of object names in the log, plus more detailed log output for easier troubleshooting.
- Requires REPOLib 4.3.0.

### 1.0.0
- First release.
