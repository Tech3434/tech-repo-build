# J.E.L.L.Y

This mod introduces two brand-new enemies into the world of R.E.P.O., completely changing how players approach mission strategy, movement, and item retrieval.
Meet Jelly and Jammy — two massive, hopping gelatinous cubes with a deceptively playful bounce and deadly consequences for the unprepared. 
These strange bio-organic anomalies are as dangerous as they are mysterious and offer unique potentially non-lethal challenges and advantages that demand teamwork and quick thinking.


## Jelly 

A level 2 Monster impervious to external damage and a strength breakpoint of 13. They deal 2 points of damage per second to absorbed players.

<img src="https://raw.githubusercontent.com/CommanderJoJo/R.E.P.O-Jelly/main/images/JellyIntroductionmidquality.gif" width="696" height="392">

## Jammy

Is a level 3 Monster Impervious to external damage and a strength breakpoint of 13 and deals 4 points of damage per second to absorbed players.<br>
When it dies it splits into 2 **Mini-Jammys**: small cubes that can still swallow a singular instance of loot or a single player

<img src="https://raw.githubusercontent.com/CommanderJoJo/R.E.P.O-Jelly/main/images/JammyExplodeExample_midqualitry.gif" width="696" height="392">

Both 
- Hop around the level hunting for valuables and swallows them whole. Can raid your cart
- Pounces on players and absorbs them damaging them over time. **Mash Jump to escape.** (Escape time scales with strength)
- Items inside are safe and can't break (even when blown up from inside!). It drops everything when it dies.
- Players absorbed are shielded from other monsters and damage. They are also muffled heavily so your friends may not hear you well
- Have a fixed capacity for objects it can hold. Won't absorb anymore past this and just knocks you around
- Can Squeeze through small spaces

<img src="https://raw.githubusercontent.com/CommanderJoJo/R.E.P.O-Jelly/main/images/HoldingItemsExample.gif" width="696" height="392">

## Mini-Jammy
Is a Monster Impervious to external damage and a strength breakpoint of 2 and deals 2 points of damage per second to absorbed players.

- Can Hold 1 Tiny or Small Object or 1 player
- Can be Carted, will try to escape after some time or left alone
## Unique Health Mechanic 

Guns, melee, slams and outside damage don't hurt their gelatinous bodies. Only these do:

- An explosion **inside** the cube from Normal or Shockwave Grenades (it will happily swallow a lit grenade, just don't forget to light it)
- The extraction tube slamming down on it. Extraction pads are sticky to these creatures, so lure it there and it should hang about
- Falling/Thrown into a pit

## Multiplayer

Every player needs the mod. Gameplay configs follow the host. 

## Tips & Tricks

<details>
  <summary>Spoiler warning</summary>

 - If in a dire situation the cubes can protect you from damage that may prove to be fatal if you can take the damage inside long enough and escape in time 
 - Cubes have a total value limit of 16, Items go as follow Tiny = 1, Small = 2, Medium Items = 4, Players = 4, Big items = 8. (No overflow allowed)
	- Knowing this you can determine when a cube has been rendered "inert" and will no longer absorb you, only knock you around
	- Mini-Jammys only can take one item or player but also only require 2 strength to drag around, making them the optimal storage entity for a high ticket but small item (like cores!)
 - Mini-Jammys will behave for a random interval of time in the cart but must constantly be checked to make sure they don't jump out, if they do they will try and run. You can tell when it will try to run <br>
 because it will start getting jiggling around in the cart
 - Smart players will use the cubes to their advantage to store high price but fragile valuables and kite the monster back to the extractor to get crushed, just be mindful of the monster around you
 - Keeping grenades on you in case of a Jelly or Jammy in the level is highly recommended as it will make valuable management much easier and less risky than kiting 
 - Gravity drones activated then thrown inside the cube not only protect it but basically give you a walking valuable bank that's safe
</details>

## Credits

- Model, animation, textures, concepts, designs and Audio sounds made by [CommanderJoJo]().
- Code written with help from Claude (Anthropic AI), reviewed and playtested by hand.
- Built with [REPOLib](https://thunderstore.io/c/repo/p/Zehs/REPOLib/) by Zehs.
