# RepoRPG Keep Progress

Add-on for **RepoRPG**. Normally, when everyone dies the game deletes the save and RepoRPG starts every player over at level 1. With this add-on you keep:

- every class's level and XP
- the talents you spent skill points on
- your attribute points
- your selected class

Account progress (mastery, unlocks) already carries over in RepoRPG and still does.

## Install
Every player in the lobby should install it. It restores your own character on your own PC.

## Settings
`BepInEx/config/playw.reporpg.keepprogress.cfg` (created on first launch):

- `Enabled`: turn the add-on on or off.
- `ClassLevels`, `Attributes`: on by default.
- `Gear`, `Perks`: off by default. Turn on to keep items and perks too.
- `ForgetSavedProgress`: set to `true` to delete your kept progress on next launch, for a real fresh start.

Note: brand-new saves also start with your kept levels. RepoRPG handles a new save and a wipe the same way.
