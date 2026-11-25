# Changelog

## 1.0.2

- Rebuilt for R.E.P.O. 0.5. The game changed some of the functions the mod
  calls, and the old build would break on the new version.
- Requires Wesleys_Enemies 1.3.8, the version its author updated for
  R.E.P.O. 0.5.
- Log what the player was wearing next to what the droid actually put on.

## 1.0.1

- Try to fix clothes mixing for remote players.

## 1.0.0

First release.

- Vanilla cosmetics of a random living player, on the right spots.
- Colours copied per body part: head, body, hips, arms and legs each take the
  player's own colour instead of one shared tint.
- `MoreHead` and `MoreHeadPlus` decorations, including the ones that float
  around their owner (fireflies and friends).
- Body parts hidden by `MoreHeadUtilities` are hidden on the droid too, so no
  droid ends up with two heads.
- A fake name tag above the droid, behaving exactly like a real player name:
  it sits right over the head, lights up only when you look straight at it,
  fades out when you look away, is not visible through walls or past 15
  metres, and stays off when lobby names are disabled or you are spectating.
- The whole disguise drops the moment the droid starts transforming.
- Config: `Enabled`, `CopyNameTag`, `KeepDisguiseAfterTransform`, `Scale`.
