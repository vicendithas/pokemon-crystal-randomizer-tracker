# EmoTracker pack for Pokémon Crystal Randomizers

Based on the tracker by StormRider, modified by DillonIsMyName and Vicendithas

It's an EmoTracker pack with map for\
[ERC's Pokémon Crystal Item Randomizer](https://github.com/erudnick-cohen/Pokemon-Crystal-Item-Randomizer)

## Requirements
[EmoTracker](https://emotracker.net/)

## Installation

1. Download through the Package Manager in EmoTracker.

OR

1. Download the latest release from the Releases section on GitHub.
2. Place the downloaded zip file in the EmoTracker packs directory (defaults to ``My Documents\EmoTracker\packs``).

OR (for the development version)

1. Clone the repository to your computer
2. Place the downloaded zip file (or directory) in the EmoTracker packs directory (defaults to ``My Documents\EmoTracker\packs``). Note: if you download a zip of the repository, you may need to unzip it first.

## Usage

This tracker has a wide variety of variants to support the options available in ERCs Crystal Item Randomizer, including the following features:

1. A map containing locations of items and badges to acquire.
2. A tracker of items and badges acquired
3. Maps of several caves to help find items or traverse without Flash
4. Settings options for various randomization features
5. Preset buttons to quickly set the options

It is recommended to turn on Fast Tool Tips to see the descriptions of the items and settings options.

### Settings Options

If the option is crossed out, it is disabled and not part of the logic of the tracker. Key Items and Badges are always in the pool.

1. ![Full Item](images/other/full_item.png "Full Item") Adds all visible item balls and most NPC items (see the other modifiers for exception for what is not included in this modifier)
2. ![Hidden Items](images/other/hidden_items.png "Hidden Items") Adds hidden items.
3. ![TMs](images/hms/normal.png "TMs") TMs (and the Map Card) will be shown regardless of mode selected. This is primarily for the KIR+TM modes, but can be used in other modes that don't normally show these items.
4. ![Day and Happiness Items](images/other/clock.png "Day and Happiness Items") Adds items locked by day, time, or happiness (requirements changed to always be available).
5. ![Berry Trees](images/other/berry_tree.png "Berry Trees") Adds berry and Apricorn trees.
6. ![Tin Tower and Ho-oh Chamber](images/other/tin_tower.png "Tin Tower and Ho-oh Chamber") Adds Rainbow Wing (Elite Four), Tin Tower (Defeat Morty or Radio Tower, Clear Bell for 1st Floor, Rainbow Wing for upper floors), and the Ho-oh Treasure Room (Elite Four or Nerf Ho-oh, and Surf).
7. ![Bug Catching Contest](images/pokemon/scyther.png "Bug Catching Contest") Adds the Bug Catching Contest (4 total checks for 1st, 2nd, 3rd, and consolation places).
8. ![Phone Call Trainers](images/items/phone_card.png "Phone Call Trainers") Adds the trainers that will give you their phone number and offer items.
9. ![Pokemon Locked Items](images/pokemon/eevee.png "Pokemon Locked Items") Adds the checks locked by specific Pokemon (Bill's Grandfather, Elm's Everstone, Lake of Rage Biggest Magikarp, and some of the phone call trainers).
10. ![Shopsanity](images/other/mart.png "Shopsanity") Adds marts and other shops (such as vending machines or bargain shops).
11. ![Ilex Cut Tree](images/other/cut_tree.png "Ilex Cut Tree") The tree in Ilex Forest is present, requiring Cut to pass.
12. ![Vanilla Clair](images/other/vanilla_clair.png "Vanilla Clair") Clair forces you to go to Dragon's Den and pass the test before giving you the badge and item (requires Surf and Whirlpool).
13. ![GS Ball](images/items/gs_ball.png "GS Ball") Adds the GS Ball to the pool. Requires Elite Four and is obtained by entering and exiting the Goldenrod Pokemon Center.
14. ![Game Corner](images/other/slot_machine.png "Game Corner") Adds the Game Corners for both Goldenrod and Celadon. Both require Coin Case, and the Goldenrod GC has a soft requirement of defeating Radio Tower.
15. ![Buena's Password](images/items/blue_card.png "Buena's Password") Adds Buena's Password. Requires Blue Card and a soft requirement of defeating Radio Tower.
16. ![Open Mt. Silver](images/other/mountain.png "Open Mt. Silver") Opens Mt. Silver so that the player can access it as soon as the League Gate is accessible.
17. ![Backward Kanto](images/other/backward_kanto.png "Backward Kanto") Going into Western Kanto via the Victory Road gate is in logic (requires Surf, Waterfall, and waking up Snorlax, which requires the PokeGear, Radio Card, and Expansion Card).
18. ![Pointless Checks](images/other/question_mark.png "Pointless Checks") Adds a few less than useful checks into the pool.
19. ![Elite Four Required](images/other/trophy.png "Elite Four Required") Fighting the Elite Four is required for Red to appear.
20. ![Nerf Ho-oh](images/other/nerf_ho-oh.png "Nerf Ho-oh") Ho-oh will always be available (even without beating E4), allowing access to the Ho-oh Treasure Chamber earlier.
21. ![Required Badges for Red](images/badges/boulder_badge.png "Required Badges for Red") Value can be modified to indicate how many badges are required before Professor Oak in Pallet Town will allow access to Mt. Silver/spawn Red (depending on other modifiers).

Notes:
1. With the "Hidden Items" modifier and/or the "Day and Happiness Items", the items underneath Wesley (Lake of Rage) and Frieda (Route 32), are moved to be in front of them.
2. With the "Hidden Items" modifier, Mt. Moon Clefairy Square Moon Stone is not included.
3. However, with "Hidden Items" and "Day and Happiness Items" modifiers, Clefairy Square item is available.

### Settings Presets

Presets have been added under the gear icon at the top right of the item tracker, corresponding with the presets in ERC's Item Randomizer.

1. ![Easy Full Item](images/presets/full_easy.png "Easy Full Item") Easy Full Item randomizer (same as Standard Full Item, but with a few Easy settings, see below).
2. ![Standard Full Item](images/presets/full_standard.png "Standard Full Item") Standard Full Item randomizer.
3. ![Vintage Full Item](images/presets/full_vintage.png "Vintage Full Item") Vintage Full Item randomizer (replicates vanilla Crystal in some ways).
4. ![Tricky Full Item](images/presets/full_tricky.png "Tricky Full Item") Standard Full Item randomizer, but with some extra twists
5. ![Extreme Full Item](images/presets/full_extreme.png "Extreme Full Item") Standard Full Item randomizer, but with some extra twists
6. ![Crazy Full Item](images/presets/full_crazy.png "Crazy Full Item") Crazy Full Item randomizer (same as Extreme, but day and happiness locked items and berry trees are added).
7. ![Maximum Full Item](images/presets/full_maximum.png "Maximum Full Item") Every item in the game (including hidden items) is in the pool.
8. ![Nightmare Full Item](images/presets/full_nightmare.png "Nightmare Full Item") Nightmare Full Item randomizer. Do you like fun? Well, too bad.
9. ![Easy/Classic Key Item](images/presets/key_easy_classic.png "Easy/Classic Key Item") Easy or Classic Key Item randomizer. (see below)
10. ![Tricky/Extreme Key Item](images/presets/key_tricky_extreme.png "Tricky/Extreme Key Item") Tricky or Extreme Key Item randomizer. (see below)

The Tricky variant adds PokeGear, Radio/Expansion Cards, Pokedex, and Tin Tower into the item pool.\
The Extreme variants is the same as Tricky, but it also mixes badges into the item pool.\
The Easy variants guarantee early Fly access (follows early Bicycle logic), Backwards Kanto is never required, and none of the Kanto Gym leaders (except Janine) will be required until access to 7 other badges.

Note: After using these presets, you can further customize your settings options as normal.\
For example, if you want to add Hidden Items to Extreme, you can select the Extreme preset, then add the Hidden Items modifier manually.

## Notes

Leftovers (in Celadon City) are now included in the tracker regardless of the preset/settings.\
The rationale behind this:
1. If the "Derandomize Leftovers" modifier in the Item Randomizer is used, then this item will always be Leftovers, and is probably worth grabbing (it's a good item to have).
2. If the "Shuffle Leftovers" modifier in the Item Randomzier is used, then this location will be part of the item pool, and may contain a required item.
The only time it wouldn't matter is if both of those modifiers are omitted. In that case, it will be a random junk item, but it's easier to just include it on the map regardless.

## Bugs? Suggestions?

Feel free to report them by opening an issue on
[the GitHub repository](https://github.com/Vicendithas/pokemon-crystal-randomizer-tracker).

## Thanks
StormRider for the original tracker\
ZaidusRecon for the detailed maps\
ERC for his work on the Crystal Item Randomizer\
Chaotix on their work adding even more items to the Crystal Item Randomizer\
461weavile for their work on adding Shopsanity to this pack\
Snowbear22 for his work in suggesting the original tracker to StormRider and helping keep this tracker up to date and bug free\
Pret whose combined efforts on Pokemon disassembly have made these kinds of randomizer possible\
Dabomstew for the Universal Pokemon Randomizer and the Crystal Speedchoice projects that make randomization and speedrunning easier\
Pokemon Randomizer community

## TODO (future plans)

1. Update maps to include every route, cave, and building where items are located.
2. Update Post-Rocket Shop in Mahogany to include beating Clair as a possible unlock
