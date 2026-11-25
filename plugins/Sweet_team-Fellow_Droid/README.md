# Fellow Droid

> **This is an add-on, not a standalone mod.** It adds no new enemy of its own.
> It changes an enemy from [**Wesleys Enemies**](https://thunderstore.io/c/repo/p/Magic_Wesley/Wesleys_Enemies/)
> by Magic_Wesley, which you must have installed. Without that mod this one
> does nothing at all.

The Droid from **Wesleys Enemies** stops being a generic coloured robot and
puts on the appearance of a random player from your own lobby.

> *"I am sure he'll be pleased to see some fellow droids."*

<img src="https://raw.githubusercontent.com/sweetbenefituz/Fellow_Droid/main/media/screen1.png" alt="A droid wearing another player's outfit and name" width="380"> <img src="https://raw.githubusercontent.com/sweetbenefituz/Fellow_Droid/main/media/screen2.png" alt="The disguised droid next to the real thing" width="460">

The disguised droid copies the cosmetics, the per-body-part colours, the
`MoreHead` decorations and even the name tag of a real player in the session. So the little robot standing at the end of the corridor is not
"a monster" any more — it is your teammate. Who is, in fact, somewhere else.

When it starts transforming into its second form, the outfit is gone — but it
keeps the copied colours, so the thing coming at you is still recognisably the
player it was pretending to be.

This mod adds **no new models, textures or sounds**. Everything is taken from
the game and from mods you already have installed.

## How to tell it apart

- It is not on the map. Real players are dots there, the droid is not.
- It talks in robot voice lines. Listen.
- It never answers on voice chat.

## Works with

- `MoreHead`, `MoreHeadPlus` — decorations are copied too, including the ones
  that float around their owner.
- `MoreHeadUtilities` — body parts you hide on yourself are hidden on the
  droid as well.

None of them are required. Without them the droid copies the vanilla outfit.

## Requires

- [Wesleys Enemies](https://thunderstore.io/c/repo/p/Magic_Wesley/Wesleys_Enemies/)
  by Magic_Wesley. Without it this mod does nothing at all.

## Notes

- All players in the lobby see the **same** copied player. The host rolls the
  dice once and tells everybody.
- If the copied player dies or leaves, the droid keeps wearing their outfit.
- A player who joins mid-level will see the droid undisguised. That matches
  how Wesleys Enemies already handles its own colour variants.
- If cosmetics are turned off in the lobby settings, there is nothing to copy
  and the droid stays plain.

## Settings

`BepInEx/config/sweet.fellowdroid.cfg`

| Key | Default | What it does |
| --- | --- | --- |
| `Enabled` | `true` | Master switch. |
| `CopyNameTag` | `true` | Show the stolen player name above the droid. |
| `KeepDisguiseAfterTransform` | `true` | Keep the stolen colours into the second-form fight. |
| `Scale` | `1.0` | Size correction for copied cosmetics. |

MIT licence. Not affiliated with semiwork or with Magic_Wesley.
