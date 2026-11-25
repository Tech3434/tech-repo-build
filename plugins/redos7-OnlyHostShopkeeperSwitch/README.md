# OnlyHostShopkeeperSwitch

Only the host can press the on/off button on the shopkeeper.

That orange button on the shopkeeper robot, anyone in the lobby can press it. Wakes the thing up, puts it back to sleep. Bad when one friend keeps flipping it the second you're walking out of the truck with a full cart.

This makes only the host's press count. Everyone else can mash it all day, the shopkeeper just sits there.

## Options

Everything lives in `BepInEx/config/com.red.OnlyHostShopkeeperSwitch.cfg`, all on by default:

- **OnlyHostPressesSwitch** - the main thing
- **ShopkeeperOnByDefault** - shopkeeper wakes up on its own when the shop loads, nobody has to walk over and press it
- **HostNeverTargeted** - it never warns, grabs or shoots the host. Everyone else is fair game

## Install

Host only. Friends don't need to install anything.

Get it from Thunderstore (r2modman search) or drop the dll into your `BepInEx/plugins` folder. Needs BepInExPack.

## Notes

Doesn't touch anything else about the shopkeeper. It still gets angry at everyone else, still shoots, still does its thing.

The auto-wake fires once per shop. If the host switches it off after that, it stays off.

When a non-host press gets blocked you get one line in the BepInEx log. Otherwise quiet.

RED
