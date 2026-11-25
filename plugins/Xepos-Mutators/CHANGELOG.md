## v1.1.2
- Allow valuables from all levels to spawn during the Amalgam Mutators.
  - On by default, may slightly increase level loading time.

## v1.1.1
- Fix and re-enable the Amalgam mutator.

## v1.1.0
- Fix race condition during the setup of the Firing My Laser Mutator.

## v1.0.7
- Add support for REPO v0.5.0.
  - Temporarily disabled the Amalgam mutator.
- Minor public API improvements.

## v1.0.6
- Attempt to fix Null Signal not hiding active mutator names.
  - (Prevent the MutatorAnnouncement.GetName() method from being inlined by the JIT, temporary band-aid).

## v1.0.5
- Fix cosmetic boxes not respecting the "Apply in cart/extraction" config option for Apollo 11.
- Add "Apply to carts" config option to Apollo 11.
  - Defaults to true. Meaning that by default, there is no behavioural change.

## v1.0.4
- Fix weird formatting on valuable damage numbers (e.g. -$-100) during Less Is More. It should now correctly display +$100.
- Add a configurable enemy respawn-time cap for the Hunting Season Mutator (1–120 seconds, default: 10).
  - When changing the value in-game through REPOConfig, the new value will immediately be used.
  - Additionally, the mutator discription will immediately change to reflect the updated value on all clients.
- Add the name of the current president to Protect The President's description.
  - Player feedback pointed out that the description lacking the name previously was confusing.
- Fix long player names pushing part of the president health UI off-screen.
  - Font size for this UI element now automatically scales down if the president is a player with a long name.
- Bump ScalerCore version from 1.0.2 to 1.0.6.
  - This fixes player voice cut-off during Size Matters. Player voices sound less squeaky as a side-effect.

## v1.0.3
- Fix multi-mutators not respecting excluded-levels override.

## v1.0.2
- Fix Moon Scaling being unable to select any mutator after a certain amount of levels due to unsanitized base-game input.

## v1.0.1
- Fix user-generated multi-mutator descriptions being overwritten by the default ones.

## v1.0.0: Multi-Mutators
- Add headline feature: **multi-mutators**.
  - Multiple mutators can now be active at the same time.
  - Multi-mutators can be automatically generated or user-defined.
    - Chance of generated mutators is configurable.
- Add scaling types for multi-mutators:
  - Moon Scaling: configure the amount of minimum and maximum active mutators per moon level. Plus the chance to use generated multi-mutators.
  - Random Scaling: configure the amount of minimum and maximum active mutators, the amount is randomly selected. Plus the chance to use generated multi-mutators.
  - None Scaling: turn off all multi-mutators. This is effectively how selection worked pre-v1.0.0.
- Add user-defined multi-mutators.
  - It is now possible to configure your own multi-mutators through JSON files.
    - These JSON files are loaded from your profile's `BepInEx\config\Mutators\MultiMutators` folder.
    - [Consult the wiki for more details](https://thunderstore.io/c/repo/p/Xepos/Mutators/wiki).
    - In theory, multi-mutators are synced over the network, meaning clients do not need to have the same multi-mutators configured.
      - However, the do need the same default mutators.
- Add support for the mutator overlay to display multiple mutators.
  - Active mutators' names and descriptions will be cycled through.
- **Add new mutators:**
  - **Size Matters**: players are shrunk. Enemies, valuables (+ items) and carts can optionally be scaled down too.
  - **Null Signal**: the first meta-mutator. Hides all active mutator information, except its own.
    - Cannot appear on its own. By default, it needs at least 2 other mutators for it to appear.
- **Ultra-Violence** and **The Floor Is Lava** are now disabled by default.
  - Can still be enabled in the config.
- Make **Hunting Season** more resistant to errors during the valuable removing process.
- Add "play nice" support for certain mutator combinations:
  - There Can Only Be One + Duck This → All enemies will be replaced with Apex Predators if possible.
  - Volatile Cargo now uses whichever is higher between current valuable value and original value.
- Change "No Mutator" odds from being weighted to being percentage-based.
- Add selection rules and rule files:
  - Two JSON rule files are added under your profile's `BepInEx\config\Mutators` folders.
  - Default rules are automatically provided upon the first launch.
    - These can be disabled and/or edited. You are also free to create your own rules.
    - Rules can, for example, be used to make certain mutators mutually exclusive.
      - Combinations deemed unfair or impossible are provided by default, consult the aforementioned rule files for more details.
- Add ScalerCore as a required dependency.
- Remove BepInEx from the dependency list.
  - It's still required, but it's also a transient dependency of both ScalerCore and RepoLib.
- Optimize mod size: 2MB → approx. 200KB.

## v0.6.6
- Fix the map guiding the player in the wrong direction during Ultra-Violence
- Increase default monster spawnrate on-break from 10 to 65 percent during Sealed Away

## v0.6.5
- Add support for REPO v0.4.0

## v0.6.4
- Add a config option to disable the on-hurt laser activation for the Firing My Laser mutator
- Amalgam now attempts to clean up doors that broke during level generation
- Map/Level exclusion now happens earlier in the mutator setup cycle
  - The goal is to remove the excluded maps/levels from e.g. the MapVote selection
- Fix a bug that could cause levels to be permanently (= until game restart) removed from the available levels

## v0.6.3
- Fix Voiceover mutator incorrectly setting the audio mixer to lobby

## v0.6.2
- Update Mutators to work with R.E.P.O. v0.3.0 and REPOLib v3
- Firing My Laser laser should now have a grace period after reviving during which the accidental fire mode is disabled

## v0.6.1
- Add configurable grace period activated when being revived during The Floor Is Lava
- Fix Less Is More host to client settings not being synced properly
- Fix items breaking when indestructable during Less is More
- Correct Less Is More durability division factors being switched
  - Please consult your config to see if the lower bound (weak) is still lower or equal to the upper bound (strong)

## v0.6.0
- **New Mutators**: Less Is More, Amalgam
- **Less Is More**: Valuables start out with less value but increase in value when taking damage, normal breaking mechanics still apply
- **Amalgam**: The level will consists out of rooms from all available installed levels
- Remove weapons which double as valuables from Hunting Season weapon selection
- Fix Hunting Season from softlocking when there are no eligible weapons
- Add toggle mode to mutator name interface: Toggle with Description
  - When selected, the mutator name will be (unhidden) together with the mutator description
- Rewrite internal metadata system (again)

## v0.5.9
- Fix Out With A Bang mutator being broken
- Add config options for Out With A Bang explosion size and damage
- Add enemy blacklist config option to the Hunting Season mutator

## v0.5.8
- Add minimum player count config option to have Ultra-Violence mutator
- Fix Handle With Care mutator causing low amount of valuable spawns
- Fix mutators with excluded enemies from crashing when removing all enemies for a tier

## v0.5.7
- Fix Firing My Laser laser oneshotting every monster

## v0.5.6
- Add config option to keep the lights on during Ultra-Violence
- Fix issues caused by the new update
  - Fix Firing My Laser laser not firing
  - Fix Special Action UI not showing
  - Fix health not updating right away when consuming a health upgrade during Protect The Weak
  - Remove unlimited **active** orb patch for Hunting Season
    - This is now vanilla behaviour

## v0.5.5
- Fix mutators not being disabled when going to shop on beta
- Add possibility to add excluded enemies for the One Shot, One Kill mutator

## v0.5.3
- Fix Sealed Away causing infinite loading on beta (for real this time)

## v0.5.2
- Add small fix to make Sealed Away and Volatile Cargo not cause infinite loading on beta
  - Beta is still not officially supported, this is more of an anticipation change, since the update is said to release soon
- Change The Floor Is Lava default damage to 1, down from 10.
- Fix Special Action UI spamming errors in console while spectating

## v0.5.1
- Add potential fix for None mutator being selected as a fallback even though there were other eligable mutators available
- Add config option to disable enemy spawns during the The Floor Is Lava Mutator.

## v0.5.0
- Add possibility to turn off manual laser action for the Firing My Laser Mutator
- **New Mutators**: Voiceover, The Floor Is Lava
- **Voiceover**: Player voices are randomly swapped between all players
- **The Floor Is Lava**: Players take damage when touching unpadded surfaces, this happens every second
  - Damage is configurable
  - Optionally, it is possible to choose an amount of players in the config that will be immune to this mutator's damage
- Add lifecycle hooks for developers
- Log a warning in the host's console when using the None mutator as a fallback

## v0.4.4
- Prevent Firing My Laser laser from firing when taking damage from healing another player
- Adjust Laser damage to enemies from 20 to 30 per tick, this is now also configurable
- Add config option to disabled Apollo 11 Anti-Gravity on items that are in cart/extraction

## v0.4.3
- Prevent laser from firing after being revived after self destructing

## v0.4.2
- Prevent Firing My Laser laser from continuing after being revived

## v0.4.1
- Prevent Firing My Laser laser from activating while typing in chat
- Hide Special Action UI while spectating

## v0.4.0
- Prevent 0 damage instances from killing the player during One Shot, One Kill
- Reduce Duck This default cooldown to 60 seconds, from 120 seconds
- New mechanic: Special Action
  - Special Action HUD Y position and keybind can be configured
- **New mutators**: Protect The Weak, Firing My Laser
- **Protect The Weak**
  - One player spawns as the bodyguard, equipped with a tranq gun with infinite ammo and increased health
  - Other players spawn with significantly reduced health
  - The bodyguard dies if they are the last one standing
- **Firing My Laser**
  - Semibots get access to Special Action: Laser
  - Laser special action has a configurable cooldown (60 seconds default)
  - Laser also activates when getting hurt, this ignores the cooldown

## v0.3.1
- Prevent mutator description popping up when other players use their map tool
- Make custom UI elements disappear while in the ESC menu

## v0.3.0
- Improve codebase maturity
- Add mutator descriptions, including a bunch of related configuration
- Add "bad luck protection" on mutator selection logic
- Add singleplayer support (experimental)
- Force the game to be more lenient with maximum allowed of active monster orbs on the level while Hunting Season is active
- Add Sealed Away mutator
  - Breaking valuables has a configurable chance to spawn a monster
  - These are permanent additions to your level, they respawn just like normal monsters
  - Sealed monsters have had their powers siphoned
    - Sealed monsters do not have an orb drop limit
    - Sealed monsters have significantly reduced health and appear smaller than their normal counterparts


## v0.2.3
- Fix ArgumentOutOfRangeException causing infinite loading screen while the There Can Only Be One mutator is active

## v0.2.2
- Fix enemy blacklist for Ultra-Violence and Hunting Season being applied after enemies had already been chosen

## v0.2.1
- Add the option to enable instant revive in truck or active extraction point for the One Shot, One Kill mutator. Disabled by default
- Disable healing friends during One Shot, One Kill. No more accidentally one shotting yourself
- Disable the spawning of monsters that do not drop an orb while the Hunting Season mutator is active
- Increase player grab range as if 3 levels higher while Rusty Servos is active
- Add configurable monster spawn blacklist to Ultra-Violence
- Prevent custom keybinds from triggering while having chat open

## v0.2.0
- Fix issue where the Hunting Season mutator would spawn weapons which had already been used
- Add more bang to the Out with a Bang! mutator, explosion size and damage now scales with enemy difficulty tier
- New mutators: There Can Only Be One, Volatile Cargo
- There Can Only Be One: All enemy spawns are the same monster, e.g. all Robe
- Volatile Cargo: Valuables explode when destroyed, explosion size and damage scales with value

## v0.1.4
- Fix issue that would cause items that spawn other items onDestroy to crash the Hunting Season Mutator setup

## v0.1.3
- Fix issue that would cause client mutators to desync from the host's when returning to lobby after the arena

## v0.1.2
- The Duck Mutator This now always attempts to spawn a duck
- Make current mutator and target (e.g. president) UI elements size configurable
- Add configurable keybind to hide current mutator UI, bound on H by default


## v0.1.1
- Fix enemies getting affected by Apollo 11 Zero-Gravity
- Add configurable keybind for downwards momentum to Apollo 11
- Add configurable Y position for current Mutator overlay

## v0.1.0
- Add the ability to lock mutators between configurable levels
- Add config option to prevent the surplus from being instantly destroyed and having its value multiplied by the `Handle With Care` Mutator

## v0.0.1
- Initial pre-release