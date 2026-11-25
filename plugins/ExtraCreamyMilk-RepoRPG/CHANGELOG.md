# Changelog

## 1.0.100

- HUD: an element with no content (empty text, or a fill or bar with no size) is never drawn, so it can't leave a stray mark.
- Host debug tools: "HUD probe" (Debug > Features) records one HUD frame and outlines every class-coloured or floating element with a number on screen; the report (BepInEx/config/RepoRPG_hud_probe.txt) says which HUD system drew each one, where, and what it is. Debug/HudProbePoint adds a screen point to look under.
- The layout check now also checks the HUD (after the menu closes): any HUD element drawn outside its area (the card, the pop-up column, the notice list) is reported.

## 1.0.99

Class balance pass - every talent rank now does something (no more ranks wasted under a cap), weakness offsets cancel the weakness instead of turning it into a bonus, and a few overly strong abilities are toned down. Settings only move if you still had the old default.

- Juggernaut: Iron Wall can push Shield Wall past its cap (up to 60%).
- Medic: higher caps on aura heal, revive heal and Stabilize; ability heals use all of Ability Power (Survivor too).
- Hauler: Power Lift protects held items up to 95%; carry-drain talents fit the cap; grab strength bonus capped at +150%.
- Phantom: Vanish takes 1s off per dodge (was 4s).
- Appraiser: value bonus cap 50%.
- Warden: Mark tops out at 45% more damage.
- Physicist: Zero-G stuns once a second (monsters get short gaps).
- Cartwright: cart speed talents all count (bonus cap 100%; top speed unchanged).
- Gambler: Let It Ride's multiplier counts (cap 3.8x).
- Restorer: Mend can restore 25% more than Steady Hands' cap; Cart Care reaches 12m.
- Lookout: up to 5 Watchposts; Shepherd: Calm Presence up to 4s, Drowsy up to 80%.
- Scavenger, Gunsmith, Grappler, Ventriloquist, Lookout, Shepherd, Restorer: talent values trimmed so their maximum lands exactly on the cap or the weakness.
- Mimic: a copied Blood Pact drains by the copy's strength.
- Tooltips: Herald Rally Cry, Undertaker Reboot, Scout Unbroken say what they really do.

## 1.0.98

- Scout's Overclock Sprint and Engineer's Overdrive: sprinting really costs no stamina while they last (a cap still charged 40% before).
- Appraiser: an Appraisal Scan with no valuables in range is refused and costs no cooldown.
- Scavenger: Keen Eye now works on lockers and cabinets in a room you just walked into.
- Ventriloquist: an Echo thrown far with Far Voice is no longer refused as "too far".
- Grappler: the heaviest items the Hook offers to yank (12-13 kg) can be yanked.
- Herald: a Loud Voice the host ignores during a level change no longer gives a free ability charge.
- Bloodbound: the HUD shows the hit cost and the throw cost separately (Leech lowers hits only).
- Mimic: Interleave's tooltip says it needs Twin Souls.
- Skill tree totals mark the Medic's ally heal and revive heal when they reach their caps.

## 1.0.97

- Courier: the Drop Pad ring stays visible in busy fights (it no longer takes a second ring every 3 seconds, and other rings can't push it out).
- Ability rings: a ring shown again at the same spot is extended instead of taking a new one, so fewer rings get pushed out.
- Host debug tools: a new Features page - turn the nearest valuable into a research sample, turn the nearest monster into a boss, start a market event, show element particles, get starter items again, master a class, and an Ascension win.

## 1.0.96

- Elemental visuals fixed: monster status puffs and the elemental weapon glow now use their own small particle pool (real coloured particles: fire rises, frost and rot fall). Before, they shared the ability rings' pool and pushed each other out, so mostly nothing showed. Ability rings are no longer pushed out by element effects.
- The weapon glow pulses more often (every 0.35 s).

## 1.0.95

Stabilization sprint, part 1 (core loop): logging for every step of the loop, and a false alarm fixed.

### Changed
- **`[loop]` lines in the log** at each core-loop step - level entered (where, level, players, host or client), a death (and whether the player had a death head), a revive, each extraction, the level cleared or lost, a class level up, skill / attribute points spent, a change the host refused, a new run - so a session can be checked step by step (tools/loop_report.py reads them).
- **Death heads on clients**: the host's heads reach a client once every player has loaded, often 8-12 s into the level, so the 8-second check warned "no death head" on clients every level (8 of 8 levels in the last logs) and then found them all. A client now waits up to 30 s before calling a head missing (the host still checks at 8 s and makes any head the game didn't).

## 1.0.94

Performance, part 1: measuring on your own computer, the first fixes, and a Performance section in Settings. No gameplay, balance or layout changes.

### Added
- **Settings > Performance** (your own, never synced): a preset - **Auto** (measures your first minute in a level and picks: 55+ FPS High, 35-55 Medium, else Low; it says what it picked), **Low**, **Medium** (RepoRPG's normal visuals, the default) and **High** - and the most expensive visuals on their own: reduced effects (also slows the HUD's refresh from 7 to 3 times a second), outlines on scanned loot (the markers stay), light beams (the sample keeps its label), element visuals (Full / Reduced / Off), nameplate range, Medic health bar range, and how many floor rings show at once.
  - Low: reduced effects, no outlines, no light beams, element icons without the weapon glow, nameplates to 12m, health bars over heads to 15m, at most 6 floor rings. High: nameplates to 30m.
- **PerfProbe** (Debug/PerfProbe): once a minute writes `BepInEx/config/RepoRPG_perf.txt` - where you are, players and monsters, host or client, FPS and 1% low, the game's frame time, RepoRPG's own time per frame (average and worst) and allocations per frame, GC collections, memory (Mono heap and Unity total), RepoRPG's network messages per second, the 30 timed sections of the mod ranked by cost (the hot spots), and any of the mod's lists that keep growing (for long sessions). A `[perf]` line goes to the log too. Off: no cost.

### Changed
- Looping over monsters and valuables (40+ places, many every frame) no longer allocates memory each time; same checks, same order.
- The line-of-sight check for third-wave classes uses a reusable buffer instead of allocating per check.
- Element visuals (Elements/Vfx) are now each player's own setting instead of following the host's, since they only change how things look.

## 1.0.93

The Votes tab, reworked: every open vote on one screen, no scrolling at 1920x1080 and above.

### Changed
- **Vote cards in a grid** (two columns when there's room): the vote's title, type icon and deadline ("Closes when the level starts", or the team contract's countdown); its **options as small buttons in one row** - the name and a short risk / reward line ("Elite Patrol · Elites +60% · Reward: Lucky Find"), your vote filled in - or a compact list inside the card when there are many; and **"2/4 voted" with an icon per player** in their class colour.
- **Who voted for what**: each option shows its voters' icons; players who haven't voted yet are outlined after "waiting:". Hover an icon for the name. The host can keep votes private (new host setting **Team/VotesShowWho**): then everyone sees who has voted, not for what.
- **Click an option to vote**, or to change your vote (until the vote closes). A milestone reward still asks to confirm.
- **The detail panel** has the rest for the vote or option selected: every option in full, the tie and no-vote rules, the deadline, who voted for each option and who's still waiting, and a Vote button per option. Click a vote's title to keep it there. On a controller Confirm votes for the selected option.
- **Recent results** at the bottom: one line per vote decided this level or shop visit ("Route: Elite Patrol", "Heat: Hunters (+1)", "Boon: ...", "Team contract: ... accepted"), each with its full text and the final tally in the panel.
- **Fitting**: spacing tightens first, then the options drop their short lines, then one column, and only then does the tab scroll (1280x720 at large text sizes, or many votes at once) - never sideways.
- Empty state: "No votes right now. Votes appear in the shop and between levels."

### Network
- The host now sends each open vote's ballots (who voted for which option) with the vote counts, for the route, heat, boon, End / Endless, crew drill and sponsor votes. Everyone in the lobby needs 1.0.93.

## 1.0.92

The Contracts tab, reworked: everything on one screen, no section buttons and no scrolling at 1920x1080 and above.

### Changed
- **One screen in columns**, beside the shared detail panel:
  - **Board** (left): one compact card per offer - giver badge, title, type and tier, a one-line objective, and the reward (a coin and the Scrap). The reroll button and its cost sit in the column header with the board's state and your slots.
  - **Votes, Active and Chains** (middle): the team contract with its vote count ("Big Haul: 1/3 voted") or its state; a link when other votes wait for you on the Votes tab; active contracts with a progress bar and "2/3" (time left where it applies) and the ones taken for the next level; every chain on one row with "Step 2/4", Done, or what it needs.
  - **Reputation** along the top: one small bar per giver with its tier, and the crew level.
  - **History** in one line at the bottom ("This run: 5 completed · 1 failed · +1,240 Scrap") with **View history** for the full list.
- **Everything else is in the detail panel**: the full objective and bonus objective, the reward, the stakes and requirements, the giver's line, and the actions - **Accept**, **Vote accept / decline**, **Drop**. Givers show their tier, what it unlocks and the next tier; chains show every step, the story so far and the final reward; the crew shows every bonus.
- Pointing at something shows it in the panel; **clicking pins it** there so you can move to its buttons (click again to unpin). On a controller the selected item is shown and Confirm does its main action (Accept, Vote).
- **Fitting**: rows tighten first, then drop to one line, and only then does a column scroll (1280x720 at large text sizes) - never sideways. Each section has its own empty message.
- The reward choice waiting after a contract is a slimmer banner across the top. The crew card is now the crew cell in the reputation row.
- The detail panel's section headings can be named by each tab (Contracts: Objective, Reward, Stakes).
- History entries now remember the Scrap they paid (for the run's total; entries from before this version count 0).

## 1.0.91

Cart doorways, step 2 (first round), from the first doorway report: 4 doorway passes (2 clean, 1 stopped then through, 1 failed) and 134 stops logged, on Military, following, mostly loaded. Most stops weren't in doorways at all - they were the cart's own checks misreading the hallway around it.

### Fixed
- **False "ledge" stops at bends.** The floor checks looked straight ahead - up to 5m at speed - so before a bend the check landed behind the next wall, found no floor and stopped the cart as if at a ledge. They now look ahead along the route itself (round the bend), at most 3m (Carts/GroundProbeMax), and no floor behind a wall counts as a wall, not a drop.
- **Stopping at the same stairs over and over.** Stairs and too-steep slopes stop a cart (on purpose), but the new route was the same route, so it drove back to the same stairs and stopped again (71 stops in one session). Where it has stopped twice it now remembers the spot for 20s (Carts/EdgeMemory) and won't route through it: it waits ("no route") or Overdrive ends with "No safe route (stairs or a steep slope on the way)".
- **Clipping wall corners.** Route corners hugged walls (the navigation mesh only keeps the monsters' radius from them), so a 1.25m-wide cart's side hit corners ("blocked by Collision"). Corners are moved out to the cart's half-width wherever the other side has room, and close to a wall the steering looks a short way ahead so it follows the route instead of cutting the corner.

### Added
- Config (Carts): GroundProbeMax, EdgeMemory.

## 1.0.90

Cart doorways, step 1: measuring (no driving behaviour changed yet), and your class's extra keys on the HUD card.

### Added
- **Extra keys on the HUD card.** Classes with keys besides their ability get a row under the ability: the key or controller button (whichever you're using; a rebind shows straight away), a short label and its state - **Cartwright** Cart follow ON / OFF, **Herald** Hum, **Ventriloquist** Throw voice, **Quartermaster** Hand off, **Mimic** Swap copy (with the other copy's ability). Greyed with the reason when it can't be used now ("levels only", "hold an item", "not learned", "no 2nd copy"). Wraps to a second line only if it must; the compact card shows just the keys (and an on / off dot). Classes without extra keys get no row. Settings > HUD > Class's extra keys hides it (on in Full and Minimal, off in Clean).
- The death head's call-out line now shows the controller button when you're on a controller.
- **Cart doorway report** (host, Debug/CartDoorwayReport): every doorway or narrow walkway a self-driving cart drives into is measured - the opening's width against the cart's (with its load), every stop with its reason (clearance, obstacle, edge check, stuck detection, route failure, waiting for someone), frame grazes and back-ups - and ends as clean, grazed, stopped-then-through or failed. Logged as `[cart doorway]`; totals per level, mode (follow / Overdrive), loaded / empty and clearance band, the narrowest gaps handled and failed, and every passage go to `BepInEx/config/RepoRPG_cart_doorways.txt`. A report from an older version is kept as `RepoRPG_cart_doorways_<version>.txt` for before / after. Routes refused at planning are logged with the measured opening, and flagged when the cart would actually have fit.
- **Cart debug view** (Debug/CartDebugDraw) also draws the lookahead point (magenta), the steering direction (white), the side walls at the cart's nose (blue) and the obstacle check's width (orange), with the cart's numbers top left: speed, width, load, nudge, the opening's width and clearance, what's slowing it and why it stopped.
- **Doorway tuning in the config** (Carts section, host): DoorwayLeadIn, LookaheadTight, LookaheadMin, LookaheadMax, FrameNudge, StuckSeconds. The defaults are exactly what carts use today.

## 1.0.89

Choose exactly what you see: every part of RepoRPG's HUD can be hidden on its own. Your own settings only - the host never changes them - and hiding something only hides it: your ability, scans, contracts and votes all keep working.

### Added
- **Settings > HUD.** A preset row (**Full**, **Minimal**: class, ability, alerts and the important pop-ups; **Clean**: the ability circle and alerts; **Custom** when you change things by hand), a live preview of your card, and **Reset HUD** (every HUD setting back to default; Undo takes it back until you save).
- **The bottom-left card, row by row:** the whole card (Always / Truck & shop / Levels only / Never), class and level, Scrap, XP bar, the ability row with separate switches for its timer and its name, your class's own lines (Always / Truck & shop / Levels only / Never), compact card, and the run status. Hidden rows take no space and the card closes up with no gaps; hide everything and there's no card at all.
- **Status chips, each on its own:** chapter and milestone, streak, run boons, heat, Ascension, crew level, payout tier, map modifier, route, points to spend, synergy and catch-up XP.
- **Pop-ups and alerts:** each kind of pop-up (XP, level ups, loot and upgrades, contracts, perks, Scrap, **research** (new), other), healing pop-ups, and the **Action needed panel**. With the panel hidden the menu's tab badges stay, and a vote with a deadline still comes back once near its end (unless Deadline reminder is off).
- **Settings > In-world:** teammate nameplates, Medic bars and team list, Appraiser scan markers and outlines, monster element icons, Lookout threat labels, the synergy indicator, the boss marker, boss and elite text (top right), and light beams (research samples' beam and light, the cursed-item beam).
- **Settings > Panels & notices:** the contracts panel (Always / Truck & shop / Levels only / Never), lobby class roster, menu key hint, highlights card and run summary card.
- The Guide's HUD topic explains the presets and switches.

### Changed
- The HUD switches that were spread over HUD, Action needed and Notifications are now together under HUD, In-world and Panels & notices (Run status, Ability timer, Run summary card and the pop-up types moved). Your values are kept.
- The Settings category list shrinks its rows on short screens so all 13 categories fit.

### Notes
- New config section `[HUD]` in `rpgmod.semibotrpg.cfg` (with a ConfigVersion for future updates), plus `Notifications/Research`. Nothing there is ever synced.
- There are no rarity beams on gear drops or synergy / boon pop-ups in RepoRPG yet, so those switches cover what exists: the light beams switch covers the sample and cursed-item beams, and synergies and boons are the chips and the synergy indicator.

## 1.0.88

UI redesign, Phase 3 (step 3b): feedback, motion, controller focus and shorter text. No gameplay, values or features changed.

### Added
- **Confirm feedback.** Every confirm action in the menu (equip, buy, upgrade, confirm points, vote, start research, save settings, claim a reward...) already plays the confirm sound. Now a check mark also pops above the action bar, with a short sweep along it.
- **Motion:**
  - The detail panel fades in quickly when what it shows changes.
  - Messages in the menu slide up as they appear.
  - Everything stays still with Reduced motion (or Reduced effects), and nothing runs when idle.

### Changed
- **Controller / keyboard focus:** a tab opens on its first item in the content area (never on the context bar or the tab rows), and each tab still remembers your last selection.
- **Shorter text:**
  - The detail panel's empty messages and the empty lists use plain sentences instead of capitals.
  - Contract cards keep the objective, bonus and reward. The chain's flavour line and how rival contracts work are in the detail panel.
  - Two long notes in Settings are shorter.

## 1.0.87

UI redesign, Phase 3 (step 3a): less text on screen, icons and empty states. No gameplay, values or features changed.

### Changed
- **One line per thing, the full text in the detail panel:**
  - **Perks:** owned and all perks are one row each: rarity edge, tag icons, name, a one-line summary and a status chip (Owned, On offer, Evolved, Off, Banished, Not found). An evolving perk shows its progress along the bottom. The offered picks stay as full cards.
  - **Settings:** one row per setting: name, a one-line summary (from its description) and its control.
    - On / off settings show a switch with ON / OFF beside it. Click, confirm or left / right anywhere on the row flips it.
    - Value settings have their stepper on the right.
    - A changed setting shows a "Changed" chip until you save.
  - **Gear:** inventory cards show the name and one line (rarity, slot, Equipped / Cursed / Unique / Behavior). Every stat line is in the detail panel.
  - **Shop:** item cards show the name, one line and the price.
- **Icons:**
  - The 9 perk tags: Carry, Throw, Stealth, Support, Loot, Monster, Risk, Ability, Mobility.
  - The 11 Settings categories.
  - They're drawn by the mod (no files) and always shown with their name or in the detail panel, never as colour alone.
- **Empty states.** Every empty list says what goes there and how to get some, and has a button to the right place when there is one:
  - No gear yet → Open the shop.
  - Nothing matches → Clear the filters.
  - No perks yet → See all perks.
  - No active contracts → Go to the board.
  - Also: no votes, a sold-out shop, nothing to buy back, research off, a locked shop section, the board closed, no finished contracts.
  - The text wraps instead of shrinking.

## 1.0.86

UI redesign, Phase 2: navigation. No gameplay, values or features changed.

### Changed
- **Grouped tab bar.** Four main tabs, each with an icon:
  - **Character:** Class, Attributes, Perks.
  - **Loot:** Gear, Shop.
  - **Run:** Contracts, Votes, Research.
  - **Options:** Settings, Host, Account, Guide (and Debug with the debug tools).
  - The sub-tabs of the open main tab show in a row under it, with "Run · 2 of 3".
  - A main tab comes back on the sub-tab you left it on.
  - **Badges** (votes and choices waiting, points to spend), the "new" mark and the "not confirmed" dot show on the sub-tab and add up on its main tab.
- **Keys:**
  - **Keyboard:** 1-4 and Tab / Shift+Tab switch the main tabs. Q / E switch the sub-tabs. 5-9 jump straight to Gear, Shop, Votes, Contracts and Settings.
  - **Controller:** LT / RT switch the main tabs (rebindable in Settings > Controller) and LB / RB the sub-tabs.
  - The control prompts show both.
- **Notices and "Go to"** open the right main tab and sub-tab, and say where: "Open [K] RepoRPG → Run › Votes".
- **Shop, Contracts and Research** no longer repeat your Scrap or Data at the top. It's in the context bar on every tab.

### Added
- **Run › Votes.** Every vote and choice in one place:
  - the team contract vote at the start of a level, the boon vote or End or Endless, your milestone reward, the route and heat votes, and the crew drill and sponsor votes;
  - one row each, with its status. Opening one shows its cards to vote on, and the one you point at is in the detail panel;
  - notices for votes open here, on the vote that needs you. The Shop's vote strip stays as a shortcut.

### Fixed
- Rebinding the "Action needed: dismiss" key and controller button in Settings (added in 1.0.81) didn't capture the new key. It does now.

## 1.0.85

### Fixed
- Three compiler warnings (null checks in Trailer Hitch and in the Host tab's detail panel). The build is warning-free again.

## 1.0.84

UI redesign, Phase 1 (step 1b): every player tab is now on the shared layout. No gameplay, values or features changed.

### Changed
- **Every tab uses the layout template**: context bar, content area, the shared detail panel on the right (the same width everywhere) and the action bar. The Debug tab is a test tool and stays wide.
  - **Class:**
    - The detail strip under the trees moved into the detail panel: the talent, ability card, synergy or class you point at, in full. The trees get the full height.
    - Confirm / Reset / Undo moved to the action bar.
  - **Attributes:**
    - The selected attribute is in the detail panel: what it gives now and after confirming, the next point, milestones and pairings, and +1 point / Take one back.
    - The build chart and Total Effects stay beside the list.
    - Confirm / Reset / Undo are in the action bar.
  - **Perks:**
    - The perk you point at (picks, owned, all) is in the detail panel, with Select on a pick.
    - Confirm / Reset / Undo are in the action bar.
  - **Contracts:** the contract you point at is in the detail panel: what it asks, its bonus, its progress and its reward.
  - **Shop:**
    - The item card moved into the detail panel, and the grid uses the whole section.
    - The panel has the item's lines, "if you equip it" as before → after, the price, and Buy / Add to cart / Lock / Haggle.
  - **Account:** the unlock or class mastery you point at is in the detail panel. Mastery has "Open on the Class tab".
  - **Host:** the setting you point at is in the detail panel: what it does, now / pending, default, and where it lives in the config.
  - **Guide:** the topic's summary is in the detail panel, with a button to the tab it's about when there is one.
- Tooltips sit above the action bar.
- The Guide's Controls topic explains the layout and the status shapes.

## 1.0.83

UI redesign, Phase 1 (step 1a): the shared design system and layout template, on the Gear, Research and Settings tabs. The other tabs move over in the next update. No gameplay, values or features changed.

### Added
- **One UI kit for every screen** (UiKit.cs):
  - Five text styles: Title, Section header, Card title, Body, Small.
  - A 4 / 8 / 16 / 24 spacing grid.
  - One card style, one button style with four kinds (primary, secondary, danger, disabled), and one chip style.
  - **Nine status styles**, each with a fixed color and its own shape so they read without color: Available ●, Pending ◐, Selected ◆, Locked (padlock), Maxed ★, Equipped ✓, New ✦, Cursed ▼, In development (hatched square).
- **The layout template.** Every tab, top to bottom:
  1. Tab bar.
  2. **Context bar**: class, level, XP, Scrap, skill points, attribute points, Research Data and "need you". Click any of them to jump to its tab.
  3. Content area, plus a **detail panel** on the right that is the same width on every tab.
  4. **Action bar.**
  5. Control prompts.
- **Shared detail panel.** Whatever you point at or select shows here in one format: name, type and status; what it does now; what changes next ("current → new"); what it needs; its buttons.
  - **Gear:** the item card moved here. "If you equip it" shows as before → after. The upgrade row, sockets and module picker sit under the item's lines.
  - **Research:** the project panel moved here, so the tree gets the tab's full height.
  - **Settings:** the setting you point at: what it does, its value, its default and what you changed.
- **Settings: categories, Save and Undo.**
  - Categories on the left (Lobby, Interface, HUD, Action needed, Accessibility, Audio, Gameplay, Host settings, Notifications, Keyboard, Controller), one at a time.
  - Changes still apply at once, so you can see them. Undo takes back the last one, and Save keeps them.
  - Closing the menu with changes not saved asks first: Confirm All keeps them, Discard undoes them.
  - Reset section and Reset all are in the action bar. Reset all asks first, and Undo can take it back.
- **Automatic layout check** (Debug tab > "Layout check").
  - Draws every tab, invisibly, at 9 screen sizes (720p to 4K, Steam Deck, two ultrawides) and 4 text sizes (75 to 200%).
  - Reports: text overflowing its box, text outside its region, text cut off at the side of a list, text below the readable minimum, and regions overlapping.
  - The report goes to `BepInEx/config/RepoRPG_layout_check.txt` and the log.
  - Nothing is clicked, saved, played or marked as seen while it runs.

### Changed
- Every button uses the new kit style: an outline in the class color. The screen's main action is filled, and destructive actions are red.
- The Gear tab's inventory gets the whole right-hand column. Salvage all and Equip are in the action bar.

## 1.0.82

### Added
- **Gear upgrades, +1 to +5** (design/GEAR_UPGRADES.md; every number is in gear.json `upgrades`).
  - **Where:** on the Gear tab under the item, or in the shop's Services, while the shop is open. Every upgrade succeeds.
  - **+1, +3, +5:** a new line. Pick 1 of 3 offers, all stats the item doesn't have yet. The offers are kept on the item, so reopening doesn't reroll them.
  - **+2, +4:** every random line +15%, never past that stat's maximum. The base stat, Unique effects and cursed lines aren't touched.
  - **+5:** a socket too, up to 1 for Common to Rare and 2 for Epic and Legendary.
  - **Line cap:** an item can take Common 1, Uncommon 1, Rare 2, Epic 2, Legendary 3 new lines. At the cap, a line level strengthens every line instead, and the preview says so.
  - **Cost:**
    - Scrap 15 / 25 / 40 / 60 / 90 by level, × rarity (0.6 / 0.8 / 1 / 1.3 / 1.6), then the shop's price multiplier.
    - Parts: 2 Sinew, 3 Sinew, 2 Sinew + 1 Core Shard, 2 Core Shard, then 1 Core Shard + 1 Prime Essence. A Legendary's +5 takes 1 Prime Essence + 1 Boss Heart instead.
  - **Kept:** the set, sockets and modules, attunement, a Unique's effect and name, a cursed item's benefit and curse, and the base stat. Starter items can't be upgraded.
  - **Rerolls** roll the upgrade lines again and keep the level and the +15% steps. **Rarity up** keeps everything.
  - **Salvage** returns 25% of the Scrap spent on upgrades, so upgrading never turns a profit.
  - **On screen:**
    - The level shows after the name ("Mover's Servos +3") with pips.
    - Lines from upgrades are tagged (+1) / (+3) / (+5), and strengthened lines show their bonus.
    - The card says what the next upgrade does.
    - The confirm step lists every line before → after.

### Changed
- The rarity upgrade button is now **Rarity up**, so it can't be confused with the new upgrades.

### Fixed
- **Crafting no longer drops item fields.** A crafted item's copy lost its cursed and starter state. It's now a full copy.

## 1.0.81

### Added
- **Dismiss Action Needed alerts.**
  - **How to dismiss:**
    - Press **X** (controller **LB+Y**; both can be rebound) to hide the selected alert, the one "next" picked or else the top one.
    - Hold it for 0.6 s to hide them all.
    - With the cursor visible, each alert has a small X button.
    - The panel's prompt shows "[K] open   [O] next   [X] dismiss (hold: all)".
  - **What it does:**
    - Dismissing only hides the alert on screen. The vote stays open, the choice waits, and nothing is voted or chosen for you.
    - The tab badge and the highlighted item in the menu stay, so you can still act later.
    - It's local to you; nobody else is affected.
  - **What comes back:**
    - A dismissed vote comes back once, with the "10 seconds left" reminder, when its deadline is close (Notices/FinalReminder; on by default).
    - A new vote or choice is a new alert and shows normally.
    - Unspent-points reminders stay hidden for the rest of the level.
  - **Settings (yours only):**
    - Deadline reminder.
    - Auto-hide after 10 / 20 / 30 / 60 s (off by default): alerts then only show as the count on the menu hint and the tab badges.
    - Hide votes, Hide choices and Hide reminders from the on-screen list.
  - Dismissals are logged as `[notices] dismissed ...`.

## 1.0.80

### Changed
- **The run status moved to the bottom-left HUD card.** It's no longer a line at the top right, so all of RepoRPG's own info is in one place.
  - The card's first row is now run status chips, each with a small icon:
    - "CH 2/10", "MILESTONE IN 3" (or "MILESTONE LEVEL" / "FINALE"), "STREAK 2 +8%", "BOONS 1", "HEAT 2", "A7", "CREW 3";
    - and, outside compact mode, the payout tier and the map modifier.
  - Chips only show when they apply, and wrap onto a second line instead of widening the card.
  - Interface/RunStatusLine (Settings > Run status: Always, Truck & shop, or Never) now controls the chips.
  - The top right keeps only nearby elites and the held-upgrade preview.
- **Ability row:** when the ability can't be used, the reason is a small grey "Usable in levels" (or "Used this level") next to the greyed-out circle with its X, instead of large "LEVELS ONLY".

### Fixed
- **Stray green box and "+1 HP" on the HUD card.** The healing glow and "+X HP" were placed from the game's health display without the HUD's render-texture scaling, so they landed near the bottom left, on the card's border. They now sit by the game's health display at the top left. A position anywhere else is ignored.

## 1.0.79

### Fixed
- **Research Data was too rare to find.**
  - Research samples only appeared from the third level on, with a 35% chance each level, so most runs gave almost no Data.
  - The milestone bonus was only paid if the milestone boss died.
- **Now:**
  - **Samples on every level:** 1 to 3, deep in the map. The third is more likely deeper in the run and on harder difficulties.
    - Settings: Research/SamplesPerLevel (new, default 1) and Research/SampleChance (now the chance of the second sample; default 50).
    - Samples are picked from valuables already spawned, so Interesting Levels' valuable budget or themed rooms can't crowd them out.
  - **Milestones** pay their 25 Data when the milestone is reached, boss or not.

### Changed
- **Samples are easy to spot:**
  - A brighter teal light and a thin teal beam that moves with the sample.
  - A "RESEARCH SAMPLE" label for everyone within 10 m. With the Sample Scanner, or as an Appraiser, it's 25 m.
- **Scavenger:** 1 Keen Eye find in 10 is a research sample.
- **End of each level:** a line sums up that level's Research Data and any samples left behind.

### Added
- **Debug tab (host):** "+100 Research Data (everyone)".
- The Guide's Research topic lists exactly where Data comes from and how much.
- `[research]` logs the number of samples on every level.

## 1.0.78

### Changed
- **Elements are easy to find now.**
  - All five Coatings are always in the shop's Consumables section while elements are on.
  - One of the two shop modules is always an element module.
  - About a third of module drops (elites, crates, bosses, contracts) are element modules.
- **Everyone sees elemental weapons:** the host sends each player's weapon element, so the coloured glow on a held elemental weapon shows on every screen. Reduced effects no longer hides it; only Elements/Vfx does.
- **Monster effects:** monsters with a status get a small puff of the element's colour twice a second, at most 24 at once (Elements/Vfx Full), on top of the icons.
- **Your element under the crosshair:** "FIRE · Burn" while you hold a supported weapon, or "Fire: not supported on this weapon".

### Added
- **Debug tab (host):** "Element coating", "Element module" and "Element Weapon Module" give one of each element (the button steps through Fire, Shock, Frost, Corrosive and Void).
- **`[elements]` log lines:**
  - the host logs every player's weapon element when it changes, with where it comes from (coating, module or affix);
  - the first hit each level that applies a status;
  - the first hit that didn't carry the element, with what the player held.
- The Guide's Elemental Weapons topic now says where to get each kind.

## 1.0.77

### Fixed
- **Killed bosses stay dead.** The game respawns a monster a few seconds after it dies, on the same object. A boss killed this level (milestone boss, named boss or the finale) now stays dead for the rest of the level. That covers the game's respawn timer and Interesting Levels' Escalating maps and Monster Nest.
- A killed boss is never picked as a boss, elite or escort again that level.
- Boss rewards are paid once per boss, even if the game reports its death twice:
  - the drop, cursed gear roll and boss core Data;
  - the boss Scrap;
  - the "bosses killed" counters and contracts.
- The list of killed bosses resets at every level.

### Added
- **Host settings:**
  - **Bosses/KilledBossRespawn:** StayDead (default), or AsNormalMonster, where it comes back as an ordinary monster with no boss modifiers, name or drops.
  - **Bosses/ElitesStayDead** (off by default): treats killed elites the same way.
- **Debug/BossDebug:** logs every blocked or allowed respawn as `[boss]`. Boss deaths are always logged.

## 1.0.76

### Added: every Research project now works (28 new, 35 of 35)
Nothing shows "Coming soon" any more. Personal tools (Twin Pads, Insulated Cart, Survey Drone, Lab Network borrow) are buttons in the Research tab. The shop's new **Research** section holds Pawn Counter, Futures, Gun Bench, Fusion Forge, Gear Exchange, the Price Board preview and the sponsor's progress.

**Logistics**
- **Trailer Hitch** (lobby): push a cart into another to hitch them, so pushing one tows the other. Yank them apart to unhitch.
- **Twin Pads:** a Courier can place a second Drop Pad anywhere in the level.
- **Insulated Cart:** once per level, mark a cart. Valuables in it lose no value from bumps while it stands still.
- **Dumbwaiter** (lobby): once per extraction point, a valuable left on a point that isn't open is sent to the open extraction.

**Economy**
- **Price Board:** the shop shows next visit's featured deal, and that's the deal you get.
- **Rotation Lock:** lock 3 shop items instead of 2. The first lock each visit is free.
- **The Archivist** (lobby): a new contract giver. Its contracts pay Research Data: Sample Run, Full Catalogue and Specimen Study.
- **Pawn Counter** (lobby): pawn gear for 60% of its salvage value and buy it back for 80% until the run ends.
- **Futures** (lobby): pay now for an item of a chosen rarity, delivered at the next milestone (one order per visit).
- **Sponsors** (lobby): at run start the team votes on a sponsor with a run-long goal. It pays Scrap and Data at the end of the run, or half for reaching half the goal.

**Arsenal**
- **Modules II:**
  - Tracer: monsters you hit are marked for the team for 3 s.
  - Spotter Lens: the valuable you aim at shows its value.
  - Tether: an item you let go floats for 1 s.
- **Consumables II:** Smoke Canister, Decoy Whistle and Flash Charge. Each goes off on its own once per level.
- **Behaviors II:** the affixes Hasty, Momentum, Steady and Second Wind.
- **Gun Bench:** fit a Suppressor (quieter to monsters), Scatter Choke (wider spread, one more pellet) or Stock (less kick) to the guns you hold next level.
- **Fusion Forge:** fuse 3 unequipped items of one slot and rarity into one item a rarity higher.
- **Blueprint Archive:** Uniques you've found before can show up in your shop, one per visit.
- **Prototype Lab:** once per run, a Prototype item with a research-only effect (1 of 6) is in your shop until you buy it.

**Exploration**
- **New Hazards** (lobby): two map modifiers.
  - Blackout: lamps dimmed, monsters a little slower, +10% XP.
  - Supply Drop: a valuable worth extra falls mid-level.
- **Survey Drone:** once per level, marks the valuables up to 22 m ahead for 10 s.
- **Vault Cracking** (lobby): some levels have a locked vault. Hold Interact on it for 6 s (it's loud) for more than double its value, plus Data.
- **Nest Hunting** (lobby): kill a nest's marked guards for a nest core worth Data.
- **Expeditions** (lobby): a new route with 40% more valuables, more monsters and twice the research samples.
- **Anomaly Rooms** (lobby): a low-gravity spot deep in some maps, with an anomaly sample worth a lot of Data.

**Crew**
- **Boons II** (lobby): four run boons join the vote: Quick Study, Data Mine, Stockpile and Deep Pockets.
- **Spectator Uplink:** while dead, the ability key marks the monster or valuable you look at for the team.
- **Synergies II** (lobby): four class pairs: Iron Wall, Quick Patch, Study Group and Side Hustle.
- **Gear Exchange:** trade one item for one with a teammate in the shop. Both of you confirm, and the host moves both items at once.
- **Crew Drills** (lobby): at each crew level the team votes on one of three drills, a small team rule for the rest of the run (8 in all).
- **Lab Network:** once per run, also borrow one personal unlock a teammate has researched.

Vault Cracking, Nest Hunting and Anomaly Rooms use RepoRPG's own vaults, nest guards and low-gravity spots. Interesting Levels' vault rooms and Monster Nests aren't exposed to other mods.

### Fixed
- **Valuable value normalization with Interesting Levels:** it never applied with Interesting Levels installed. RepoRPG read Interesting Levels' valuable catalog in the menus, before that mod has looked up any values, so every vanilla top value was $0 and nothing was normalized. The host now reads the catalog again at each level start, once the values are known.

## 1.0.75

### Changed
- **Research tab layout:** every tier of every branch now fits on screen.
  - Each project is one compact row: tier, name, a scope icon and a status chip. The chip shows cost and levels, IN PROGRESS, DONE, LOCKED or SOON.
  - Lines show which project needs which. A line lights up once the project it starts from is done.
  - Rows shrink their padding and spacing to fit. Only at small sizes (1280x720, 200% text) does the tree scroll, and the selected project is kept in view.
  - The detail panel is now three compact lines plus the button: name, branch and tier, scope; what it unlocks; cost, duration and status.
- **Clearer labels:**
  - "YOU" and "LOBBY" are now "Personal" (one dot) and "Lobby-wide (host decides)" (three dots). Point at the dots for an explanation.
  - Projects still in development are dimmed with a SOON chip and no hover highlight. Their panel says "Coming soon" instead of offering Start.
  - When something can't be started, the reason is shown: "Needs 80 Data", "Requires Cart Winch" or "Lab slot in use".

## 1.0.74

### Changed
- **Class tab on one page.** The Talents / Overview switch is gone.
  - **Left column:**
    - The class name, complexity and role.
    - Level, XP, skill points (with how many are pending), build and Scrap.
    - The two passives and the active as cards. Descriptions are cut to the lines that fit; point at a card for the full text.
    - Synergy chips, one per partner class.
    - Effects / Compare, Respec or Play as, the alternate passive (mastery), and the prestige switch when needed.
  - **Right:** every talent tree with every tier, or Total Effects in their place (Effects button, or the view key V / R3).
  - **Detail strip** under the trees: the full text of the talent, card or chip you point at or select, with its requirements and pending ranks. It keeps showing the last one; with nothing picked yet, it shows the trees' themes. When the text is too big for it (200% text), the floating tooltip shows as well.
  - **Small screens** (720p / 800p with big text): the left column folds into a compact header and one row of ability chips above the trees.
  - The layout is worked out once per class, size and text scale, not every frame. WASD / arrows / controller move through the cards, chips, buttons and talents.
  - Interface/ClassTabOpensOn now picks what the right side opens on (Overview = Total Effects).
- The game's map tool is put away while the menu is open (in toggle mode it used to stay up behind the menu).

## 1.0.73

### Added
- **Class starter items:** every class gets a small starter gear piece once per run.
  - It's a Common with the slot's base stat and one small class effect, worn right away if that slot is empty.
  - Only its class can equip it. It salvages for 0 Scrap and can't be rerolled, upgraded or crafted.
  - A class switch swaps it for the new class's piece.
  - Shown as "Starter" in green on the Gear tab, with its effect and rules.
- **Starter tools:** at their first level of the run, a few seconds in, the host spawns a real shop item next to:
  - Medic: a small health pack.
  - Trickster: a rubber duck.
  - Demolitionist: 2 explosive grenades.
  - Gunsmith: a handgun.
  - If the game doesn't have the item, that player gets 25 Scrap instead, and a line goes in the log.
- Host Settings group **Class Starters** (Starters/Gear, Starters/Tools; both on by default).
- Guide topic **Class Starters** with every class's piece.

### Fixed
- Build error in the ability ring timer (1.0.68): a variable was declared twice.

## 1.0.72

### Added
- **Elemental weapons:** Fire, Shock, Frost, Corrosive and Void.
  - **Statuses:**
    - **Burn:** 3 damage/s per stack, up to 3. The first burn panics a monster.
    - **Static:** a short stun, sometimes jumping to a second monster.
    - **Chill:** up to -40% speed; 5 hits in 4 s freeze the monster.
    - **Rot:** up to +20% damage taken from everything.
    - **Weaken:** the monster deals up to 24% less damage.
    - Every status ends on its own and is cleared when the monster dies or the level ends.
  - **Combos:** Shatter, Overload, Meltdown and Short Circuit.
  - **Elites and bosses:** some elites resist or are weak to an element, and every boss has one of each. It's shown with their modifiers.
  - **Where elements come from:**
    - Five new Weapon Module behavior affixes (Incendiary, Voltaic, Glacial, Caustic, Hollowing).
    - Five element modules.
    - Five shop Coatings (30 Scrap, one level each).
    - One element at a time: a Coating beats a module, a module beats an affix.
  - **Supported weapons:** guns, launchers (their blasts), melee weapons and the modded weapons Overclock supports. Never thrown objects, valuables or teammates.
  - **Visuals:** small status icons above monsters, each with its own colour and shape, plus the stack count. A soft glow on your elemental weapon. Reduced effects (or Elements/Vfx) turns the glow off.
  - **Gear tooltips** show the element.
  - **Guide:** a new Elemental Weapons page.
  - **Host settings:** [Elements] Enabled, Strength and Vfx.

## 1.0.71

### Added
- **Ascension:** win a run, then replay at higher Ascension levels.
  - **Winning:** clear the last chapter (level 50 on Standard) and defeat the finale boss, **The Liquidator**. It has fixed modifiers (Armored, Enraged, Warlord) and a second phase at half health. The finale's extractions stay sealed until it falls.
  - **Victory vote:** End, Keep going (Endless, no further Ascension credit), or **Ascend** (the next run starts one Ascension higher).
  - **Levels:** a win at Ascension N opens N+1, up to 20. The host picks the level before the run starts, under the difficulty selector on the Settings tab: up to their best win + 1, or anyone's with Ascension/Source = Anyone. Everyone sees it.
  - **20 stacking modifiers:**
    - A1-A5: more elites; shop +10%; one fewer death save on boss levels; more fragile valuables; bosses +1 modifier.
    - A6-A10: 2 boon choices instead of 3; monsters +10% damage; half starting Scrap; heat Skip needs a majority; monsters hear 15% farther.
    - A11-A15: smaller shop; monsters +15% health; revived players come back with 25% less health; boss escorts; contract targets +15%.
    - A16-A20: haul goals +10%; 30% fewer parts; elites +1 modifier; the Marked Earner; the finale's third phase.
    - Each is described in the Guide and on Account > Ascension.
  - **Rewards during the run, per level:** +4% XP, +5% Scrap, +5% Research Data, and +1 gear luck every 4 levels. These sit outside the personal caps.
  - **Rewards for a first win at each level:**
    - Research Data: 100 + 25 per level.
    - Titles: Ascended, Ascendant, Exalted, Transcendent and Apex.
    - An "A7"-style rank by your name.
    - Per-class records.
    - The Unique **Crown of Ascent** (A10: your heat vote counts twice) and the cursed **Apex Brand** (A20: +40% damage to bosses; bosses deal you 20% more) join your drops.
  - **Account > Ascension:** your best win, all 20 modifiers (locked ones as teasers), rewards and class records.
  - **Run line:** shows "A7"; the run details list the level and its rewards.
  - **Host settings:** [Ascension] Enabled, Source, XpPerLevel, ScrapPerLevel and DataPerLevel.
  - **Kept with your account:** never reset by a run.

## 1.0.70

### Added
- **Research:** a new Research tab and long-term goal across runs. It's kept with your account and never reset by a run.
  - **Research Data:**
    - **Research samples:** from the third level, 0-2 of the deepest valuables per map glow teal and are labelled on the Appraiser's scan. Each pays everyone 15 Data when extracted.
    - **Boss cores:** every boss pays 60 Data (milestone boss 80, finale 150).
    - **Milestones:** +25 Data.
    - **Contracts:** 1 in 4 contracts pay 5-15 Data.
    - **Difficulty:** amounts scale with it (Relaxed 0.5x up to Brutal 1.75x).
  - **The tree:**
    - **Branches:** five (Logistics, Economy, Arsenal, Exploration, Crew), 35 projects.
    - **Tiers:** T1-T5 cost 80/150/250/350/600 Data and finish after 2/2/3/4/5 levels cleared, in any run.
    - **Projects:** one runs at a time, two with Parallel Lab and three with Lab Network. Starting asks first; cancelling gives half the Data back.
    - **States:** locked, available, in progress, done and in development.
  - **Working now:**
    - **Cart Winch:** look at a cart 3-10 m away and hold Interact to reel it in.
    - **Extraction Drill:** an extraction counts down twice as fast with everyone in the zone (lobby-wide).
    - **Recall Beacon:** once per level, call an empty cart to you (button on the Research tab).
    - **Haggling:** once per shop visit, 50% chance of 25% off, else 10% more.
    - **Sample Scanner:** samples within 25 m are pinged.
    - **Parallel Lab and Lab Network:** extra lab slots.
  - **Still in development:** the other projects show as "In development" and can't be started yet. They come in later updates.
  - **Lobby-wide vs personal:** lobby-wide unlocks use the host's research, or anyone's with Research/LobbyRule = Anyone. Personal ones use your own.
  - **Notices:** when research finishes and when you have enough Data to start a project.
  - **Guide:** a new Research page lists every project.
  - **Host settings:** [Research] Enabled, LobbyRule, DataMultiplier (set by the difficulty presets), CostScale and SampleChance.

## 1.0.69

### Added
- **A living economy.**
  - **Categories:** every valuable (vanilla and modded) is in one of eight categories: Art, Antiques, Electronics, Tech, Fragile, Heavy, Curiosities or Junk. Each category has a price.
  - **Supply and demand:** what the team extracts gets cheaper, what nobody brings back gets dearer, and prices drift back toward normal.
  - **Limits:** prices stay within 0.6x-1.6x, and a typical map stays worth about what it would without the market.
  - **When prices change:** between levels only, so a level's haul goal never moves while you play it.
  - **Market report:** at every shop visit, with the biggest movers ("Art +28% · Electronics -18%"), any event and what's in demand.
  - **Shop tab > Market:** every category's price, its change and its trend.
  - **Appraiser's scan:** labels show each valuable's category and price change.
  - **Shop demand:** items the team buys a lot cost more (up to +30%), items nobody buys go on sale (up to -25%), and both drift back. Salvage still never pays more than an item's price.
  - **Market requests:** each level a contract giver wants one category. Extract 3 and everyone gets Scrap, more when that category is in high demand.
  - **10 market events,** announced at the shop a level ahead: Boom, Crash, Shortage, Collector Frenzy, Recession, Clearance Sale, Fragile Premium, Scrap Drive, Tech Rush and Stimulus. Each is described in the Guide.
  - **Host settings:** [Market] Enabled, Volatility (set by the difficulty presets), MinMultiplier, MaxMultiplier, EventChance, RecoverySpeed and RequestScrap.
  - **Logging:** market changes per level go to the log and to BepInEx/config/RepoRPG/tuning-log.txt.
  - **Run scope:** the market resets with the run.

## 1.0.68

### Changed
- **Ability circle on the HUD card:**
  - The middle shows the time left: the cooldown, the next charge, or the effect running out (Overclock, Blood Pact...). It shows one decimal under 3 s ("2.4"), and the text gets smaller for 3-digit cooldowns ("120").
  - Ready shows a check mark. Can't be used shows a grey X in the middle (no timer).
  - Charges keep their ready count as a small badge on the circle's edge.
  - The timer is on by default. Turn it off with Settings > Action needed > "Ability timer" (Interface/AbilityRingTimer). The old off-by-default AbilityRingSeconds setting is no longer used.
  - The ability key (or controller button) is in a small box right of the circle, with the ability name after it (hidden in compact mode). It follows rebinding and switching between keyboard and controller.
  - The timer text is only rebuilt when the shown number changes.

## 1.0.67

### Added
- **Cursed gear:** 14 powerful items with a real drawback, shown in deep red. Only bosses drop them.
  - Weapon Modules: Hungering Edge, Feedback Coil, Overkill Relay. Plating: Bloodpact Plating, Thornshell, Martyr's Mail, Hollow Plating. Servos: Overdrive Servos, Rift Striders, Hangman's Springs. Cores: Greed Core, Echo Core, Hourglass Heart, Parasite Core. Each one's benefit and curse is in the Guide (Cursed Gear).
  - A boss has a chance to drop one for each player, on top of its normal drop: 3% Relaxed, 4% Easy, 8% Normal, 12% Hard, 16% Brutal, +2% per chapter reached (up to +10%). Never from crates, contracts or the shop. Host settings: Bosses/CursedGear, CursedDropChance, CursedMilestoneBonus, CursedMilestoneBonusMax.
  - Red everywhere: name, card, frame, tooltip and paper-doll slot, with the curse on its own "[!] CURSE" line. A red light beam marks where the boss fell, with a "CURSED" banner.
  - Equipping asks first and shows the benefit and the curse. Only one cursed item can be worn at a time (equipping another takes the first off). Unequipping is always free.
  - Attunement weakens most curses: 15% at Tempered, 30% at Soulbound. Rift Striders, Hangman's Springs and Hourglass Heart stay as they are.
  - Rerolls change only the normal affixes. Sockets, modules, compare and loadouts work as usual. Salvage pays 1.5x a Legendary's Scrap, with a confirmation. New Gear tab filter: Cursed. The benefits count toward the global caps.
  - Debug tab: "Spawn cursed item".

### Fixed
- **The game's cursor went underneath RepoRPG's panels** (the lobby class roster, the menu hint, notices, pop-ups). RepoRPG draws with IMGUI, which Unity always draws after every UI canvas, so no sort order could fix it. The game's cursor is now drawn again on top whenever it's over a RepoRPG panel. The panels never block clicks to the game's lobby buttons underneath.

## 1.0.66

### Changed
- **Gunsmith's Field Charger is now something you do, not a hidden effect.** Before, it ran by itself once a second, said nothing, and only worked with a battery-powered item (a drone, a flashlight) already in a cart - and vanilla R.E.P.O. has no plain "battery" item, so it looked broken.
  - Hold a gun near a cart with a battery item in it: **"[Hold E] Recharge from cart"** shows under the crosshair (E is the game's Interact key, whatever you've bound it to).
  - Hold it until the bar fills (1.6 s at base, faster with the talent's upgrades and Bench Tuning). Let go early and nothing happens.
  - The gun fills as far as the batteries in the cart allow. They lose what the gun gains (moved, never created). **"Gun recharged from cart (+40%)"** confirms it.
  - When it can't: **"Gun is full"**, **"No battery in cart"**, "No cart close enough" or "Hold a gun to recharge it".
  - Carts with batteries in them show a small battery icon with a count, to Gunsmiths with the talent only.
  - A battery is anything with a battery that isn't a weapon or a cart: drones, flashlights, modded battery packs. Other guns in the cart are never drained. The game's guns and modded weapons can both be recharged.
  - The host checks every recharge (class, talent, gun in hand and not full, cart within reach, a battery in it, not faster than the hold) and the game syncs both batteries to everyone. A Mimic doesn't get it (it's a talent, not an ability).
  - New Guide page "Gunsmith's Field Charger"; talent, Bench Tuning and wiki text updated. `[charger]` log lines on the host.

## 1.0.65

### Changed
- **The ability on the HUD card is a cooldown circle** instead of status text: a round icon with your key (or controller button) in the middle and a ring around it.
  - **Cooldown:** the ring fills clockwise from empty to full.
  - **Ready:** a full ring in your class colour with a soft glow, and a short pulse the moment it's ready.
  - **Duration** (Overclock, Blood Pact...): the ring, brighter, drains as the effect runs out.
  - **Charges:** the ring splits into one segment per charge. The next segment refills like a cooldown, and a badge shows how many are ready.
  - **Can't be used now** (truck or shop, or this level's uses spent): a grey icon with an X badge and a short reason ("LEVELS ONLY", "USED THIS LEVEL").
  - **Mimic:** a badge shows the initial of the class it copied.
  - The ability name sits next to the circle. A controller chord too long for the circle shows before the name.
  - States differ in shape as well as colour (full ring + glow / partial ring / grey + X). Reduced motion: no pulse or glow, just a full bright ring.
  - Optional (Settings > Action needed, both off by default): the seconds left inside the circle, and a quiet sound when the ability or a charge is ready.
  - The ring is pre-drawn textures (cached), so drawing it costs a texture or two per frame.

## 1.0.64

### Fixed
- **A team wipe didn't reset everyone's run progress.**
  - **Cause:** RepoRPG only started a fresh run when the save's name changed. When a wipe started the next run under the same save name (seen in a client log: the same save from level 8 back to level 1), nothing was cleared. Every player, host included, kept every class's levels, talents, gear and Scrap.
  - **Runs now have a run id**, set by the host for each save. Every player's progress is stamped with it and comes only from the host. A run ends when the game deletes the save, or when levels completed go back to 0 in the same save while playing.
  - **When a run ends**, the host sends the recap and starts a new run id: every player's progress and Scrap in the save is cleared. Every machine with progress from the old run resets it all: every class's level, XP and talents (prestige too), attributes, perks, contracts, boons and class-switch state, and all gear: inventory, equipped items, loadouts, slotted and loose modules, attunement, crafting parts, shop stock, locks, buyback, the wishlist and reputation. Each client's own cached copy is deleted too.
  - Everyone sees "New run started".
  - **Old copies are refused:** a client pushing progress from an old run is refused and logged. A client's own copy is only used if it's from the current run, so a late joiner starts fresh (with the host's catch-up).
  - **Kept:** account progress (unlocks, mastery, alternate passives and prestige as unlocks, run history, records). It lives in its own file, which has no gear in it. An unlocked Starter Kit, Field Kit or Seed Money is given fresh in the new run's first level.
  - **The host needs this version** for the reset to happen.
- **Double or Nothing: the timer is a hard limit.**
  - **Cause:** at 0 seconds, a marked valuable sitting in an extraction zone was never expired. Its multiplier kept climbing toward the cap while the HUD showed 0s.
  - **Now:** at 0 the mark expires wherever the valuable is. The bonus is lost, the valuable returns to its own value, and the marker and HUD timer go away, with "Double or Nothing expired". No Scrap is taken; breaking it still costs Scrap.
  - The multiplier grows only while the mark is active, and never past its cap. The Mimic's copy works the same way.
  - The log has `[bet]` lines every second while a mark is active, and one when it expires.

## 1.0.63

### Changed
- **The run status no longer covers the screen.**
  - **No more bar:** the long two-line bar at the bottom of the truck and shop is gone. It still shows in the pre-game lobby, where the host sets up the game.
  - **One line, top right, is the only always-on run status.** It shows chapter, next milestone, streak, boons, heat and crew. Settings > Action needed > Run line: Always, Truck & shop, or Never.
  - **The HUD card no longer repeats it:** the chapter, streak, boons and heat chips are gone. Scrap stays in the card's name row.
  - **Full details:** the team panel (hold the team panel key) and the top of Account > Runs list everything: difficulty, chapter and milestone, streak, boon names, heat, crew, players, levels cleared, threat rating, and the next level's route or modifiers and multipliers.
  - **Optional run summary card** (off by default, Settings > Action needed): when you reach the truck or shop, it shows what changed (a new chapter, threat rating up, a new boon, more heat, crew level), then fades.
- The ability line outside levels reads "AVAILABLE IN LEVELS", and charges show as "2/2".

---

Older versions: see CHANGELOG_ARCHIVE.md in the source.
