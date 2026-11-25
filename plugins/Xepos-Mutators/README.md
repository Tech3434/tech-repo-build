# R.E.P.O. Mutators
Inject some chaos (and possibly despair) into your R.E.P.O. runs with Mutators! Random level modifiers will be chosen to alter your current level in some way.\
**NOTE**: Everyone needs this mod for it to work.  Singleplayer currently experimental.

# Major update V1.0.0: Multi-mutators

---
Multi-mutators are now available! Multi-mutators allow the possibility of multiple mutators being active at the same time.

The scaling type can be adjusted in the mod's config:

| Scaling Type | Description |
|--------------| --- |
| `Moon`       | Default configuration. The amount of active mutators scales with the game's moon phases.
| `Random`     | The amount of active mutators is randomly chosen between a configurable minimum and maximum.
| `None`       | The maximum amount of active mutators is always 1. This is the old behavior.

Additionally, a rules file is now provided to allow for more fine-grained control over mutator selection.\
Don't like a particular combination? Just set a mutual exclusion rule in the rules file.

Really like a particular combination? Consider creating a custom multi-mutator!

---

## Current Mutators
| Mutator               | Effect                                                                                                                        | Notes                                               |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| Apollo 11             | All players and items have zero gravity.                                                                                      |                                                     |
| Rusty Servos          | Players can't jump but gain increased grab range.                                                                             |                                                     |
| Ultra-Violence        | Immediately activates the final extraction phase.                                                                             | Disabled by default.                                |
| Handle with Care      | All valuables are worth double, but they break instantly on any damage.                                                       |                                                     |
| One Shot, One Kill    | Any damage taken by a player is lethal.                                                                                       |                                                     |
| Duck This             | Ducks aggro on sight instead of on interaction.                                                                               |                                                     |
| Out With a Bang       | Enemies explode upon death.                                                                                                   |                                                     |
| Hunting Season        | No valuables spawn; weapons spawn instead. Enemy respawn time is reduced to 10 seconds, and the orb drop cap is removed.      |                                                     |
| Protect the President | A random player becomes the "President." If they die, everyone else self-destructs.                                           |                                                     |
| There Can Only Be One | All enemy spawns are the same monster (e.g. all Robe.)                                                                        |                                                     |
| Volatile Cargo        | Valuables explode when destroyed, explosion size and damage scales with value.                                                |                                                     |
| Sealed Away           | Valuables have a chance to spawn weakened monsters when destroyed.                                                            |                                                     |
| Protect The Weak      | A random player becomes the "Bodyguard." They die if they are the last person standing.                                       |                                                     |
| Firing My Laser       | Unlocks Special Action: Laser. Semibots may fire a laser on a configurable cooldown, they fire this laser when taking damage. |                                                     |
| Voiceover             | Player voices are randomly swapped between all players.                                                                       |                                                     |
| The Floor Is Lava     | Every second, players take damage when touching unpadded surfaces.                                                            | Disabled by default.                                |
| Less Is More          | Valuables start out with less value but increase in value when taking damage, normal breaking mechanics still apply.          |                                                     |
| Amalgam               | The level consists of rooms from all available installed levels.                                                              |                                                     |
| Size Matters          | Players are shrunk. Configurably, enemies, valuables and carts can be too.                                                    |                                                     |
| Null Signal           | All other mutator information is hidden.                                                                                      | By default, this mutator cannot show up on its own. |

## Configuration
Mutators are selected via a **weighted random** system. The weight of each mutator can be adjusted in the config. Each mutator has the following configurable properties:

| Property | Description |
| --- | --- |
| `Weight` | The weight of the mutator.
| `Minimum level` | The level on which this mutator can start showing up.
| `Maximum level` | The level on which this mutator will stop showing up.

You can also configure the chance of no mutators showing up at all. This uses a percentage, not a weight.\
Additionally, most mutators have additional configuration options.\
The **host's config** always takes precedence. If this does not appear to be the case, please submit a bug report.

## Upcoming features
* More mutators
* General improvements to mutators and internal systems

## Suggestions and issues
Suggestions can be made in the dedicated thread in the R.E.P.O. Modding Server on Discord or though Github issues.\
Any issues found may also be reported though these channels, although creating a Github issue is preferred.

## Incompatibilities
* Any mod that allows people to join during a level.

## For developers
Interested in contributing or registering mutators with your own mod? Check out the [GitHub repository](https://github.com/Justin-dr/REPO-Mutators).
