# Changelog

## 1.0.6

- Works on the 0.5 game build.

## 1.0.5

- The song starts from the top on every ring instead of somewhere random in the middle. Same trick the boombox uses.
- If `RobeCalling.bundle` is missing next to the DLL the log says so now, instead of the mod silently doing nothing.
- README says up front that it's client-side (you hear it if you have it, nobody else needs it) and how to install by hand.
- Dropped the leftover prebuild/postbuild PowerShell scripts, the csproj has done all of that since 1.0.4.
- Patch moved out of Plugin.cs into Patches/. No behavior change.

## 1.0.4

- README and manifest now say what the ringtone actually is: "Robe is my wife" from Semiwork's YouTube channel, plus the matching phone screen. Docs only, no code change.

## 1.0.3

- **Updated for R.E.P.O. v0.4:** Rebuilt against the latest game release. 1.0.2 will not load on v0.4. The patched class (`PhoneValuable`) and the `Sound` API used to swap the ringtone are unchanged in v0.4, so a recompile is enough.
- **Removed:** REPOLib dependency. RobeCalling has always loaded its assets from a local AssetBundle and does not call REPOLib at runtime, so dropping the dep means the mod installs cleanly on v0.4 without waiting for REPOLib to catch up.

## 1.0.2

- **Fixed** Dependency list


---------------------

## 1.0.1

- Actually put the repobundle in this time
- **Fixed** Build script


---------------------

## 1.0.0

- The phone got an upgrade
