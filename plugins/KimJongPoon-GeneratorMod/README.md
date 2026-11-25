# GeneratorMod

Adds a **Generator** upgrade to the R.E.P.O. shop. Every level of the Generator slowly recharges the truck's energy bar while you're out on a level, so your gear doesn't depend only on the charging station's current stock.

## Features

* New shop upgrade, **Generator**, that can appear in the upgrade pool on any shop visit
* Each Generator level adds a steady trickle of charge to the truck's energy bar
* Only ticks during active levels (not in the lobby, shop, or menus)
* Stacks with team purchases: levels owned by the players present all contribute
* Fully configurable price, shop chance, purchase limit, and recharge rate

## How it works

1. Visit the shop. The Generator has a chance to show up in the upgrade pool (10% per visit by default).
- Currently the item is set to look identical to the Stamina Upgrade item.
2. Buy it. The default price is $25,000.
3. During a level, the truck's energy bar fills by **3% per minute for each Generator level** by default, up to a full bar.

## Configuration

A config file is created the first time you launch the game with the mod installed, in `BepInEx/config/`. Edit it with a text editor (or r2modman's config editor) and restart the game for changes to apply.

### Shop

|Setting|Default|Description|
|-|-|-|
|`BasePrice`|25000|Price of the Generator upgrade in the shop.|
|`ShopChancePercent`|10|Chance (in percent) that the Generator is added to the upgrade pool for any one shop visit.|
|`MaxPurchases`|1|How many Generator levels the whole team can buy in total.|
|`UseVanillaPriceScaling`|false|If false, the price is always exactly `BasePrice`. If true, the game's normal upgrade price scaling applies on top.|
|`TemplateItemName`|Item Upgrade Player Energy|Name of the vanilla upgrade item whose box model is copied. Leave this alone unless you know why you're changing it.|

### Recharge

|Setting|Default|Description|
|-|-|-|
|`RatePercentPerMinute`|3|Percent of a full truck energy bar restored per minute, per Generator level.|
|`HostOnly`|false|If true, only the host (or singleplayer) applies the recharge. Leave false unless clients double-count in multiplayer.|
|`MaxCharge`|100|Value that counts as a full bar. Vanilla is 100.|

### Debug

|Setting|Default|Description|
|-|-|-|
|`DebugLogging`|false|Logs shop rolls and recharge activity to the BepInEx console. Useful for bug reports.|

## Requirements

* [BepInExPack for R.E.P.O.](https://thunderstore.io/c/repo/)
* [REPOLib](https://thunderstore.io/c/repo/)

Both install automatically if you use r2modman or the Thunderstore Mod Manager.

## Installation

Install through r2modman or the Thunderstore Mod Manager and launch the game from the manager.

Manual install: place `GeneratorMod.dll` in `BepInEx/plugins/GeneratorMod/` alongside REPOLib.

## Multiplayer

The host's settings control the recharge. Upgrade levels are saved and synced through REPOLib.

## Bug reports

Please include your `BepInEx/LogOutput.log` and turn on `DebugLogging` before reproducing the problem.

