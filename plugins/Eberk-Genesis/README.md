# Genesis

This is a mod that adds Genesis the cat with actual voice acting from Genesis herself.



![Genesis the cat](https://i.imgur.com/fdkOpl8.gif)

## Features

### Genesis Item
Genesis spawns naturally in levels as a valuable object. Pick her up and interact with her but careful, she might bite..

### Petting & Healing
Press **[E]** while holding Genesis to pet her. Each pet heals you and those nearby by **10 HP** by default but it will cost some of Genesis' value. Genesis has **3 pets** available per level by default. Both **healing amount** and **pets amount** can be increased with upgrades

### Biting
When Genesis has no pets left, interacting with her will cause her to bite you for **5 damage**. She also hisses. There is also a chance the player will say a warning phrase.

### Spawn Chat Lines
When Genesis spawns, there's a chance a random player says one of many phrases

### Ambient Sounds
Genesis will randomly meow throughout the level, which may attract attention.

[Meow](https://i.imgur.com/74SSlRb.mp4)


## Upgrades

### Genesis Love
Increases the amount Genesis heals per pet and increases bite damage.

- **+5 HP heal per level** 
- **+5 bite damage per level**

### Genesis Patience
Increases the total number of pets available. The bonus stacks across **all players**
- **+1 pet per level, per player**
- **Lowers value decrease** 

![upgrades](https://i.imgur.com/reB1fUg.png)


## Configuration

Config file in Bepinex/config folder to control settings or menu if you have [Menulib](https://thunderstore.io/c/repo/p/nickklmao/MenuLib/) installed
![Menulib menu](https://i.imgur.com/QODn3LT.gif)


| Section | Option | Default | Description |
|---|---|---|---|
| Spawning | Enable Controlled Spawning | `false` | Control Genesis's spawn rate manually |
| Spawning | Spawn Count | `1` | How many Genesis items per level (1-3) |
| Spawning | Spawn Chance | `0.5` | Chance Genesis spawns per level (0-1) |
| Misc | Chat Line Chance | `0.25` | Chance a player says something on Genesis spawn (0-1) |



## Dependencies

- [BepInEx 5.4.21+](https://thunderstore.io/c/repo/p/BepInEx/BepInExPack/)
- [REPOLib](https://thunderstore.io/c/repo/p/Zehs/REPOLib/)
