# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

## Introduction

AzerothCore is an open-source game server application and framework designed for hosting massively multiplayer online role-playing games (MMORPGs). It is based on the popular MMORPG World of Warcraft (WoW) and seeks to recreate the gameplay experience of the original game from patch 3.3.5a.

The original code is based on MaNGOS, TrinityCore, and SunwellCore and has since then had extensive development to improve stability, in-game mechanics, and modularity to the game. AC has also grown into a community-driven project with a significant number of contributors and developers. It is written in C++ and provides a solid foundation for creating private servers that mimic the mechanics and behavior of the official WoW servers.

[NPCBots](https://github.com/trickerer/Trinity-Bots) is an AzerothCore mod from Trickerer.

This fork is a modified version of it.

## What is different?

  1. Customized fixes to some problems that will be successively removed if the original packages get updates

  2. Permanent additions to the core code, namely:
     - Enabling server-side old world flying
       
  3. Pre-Configured Modules in a working state for this version, namely:
     - [Autobalancer](https://github.com/azerothcore/mod-autobalance)
     - [Eluna API](https://github.com/azerothcore/mod-eluna)
     - [Gain Honor from killing Guards](https://github.com/azerothcore/mod-gain-honor-guard)
     - [Guildhouse](https://github.com/azerothcore/mod-guildhouse)
     - [Instance Reset](https://github.com/azerothcore/mod-instance-reset)
     - [PVP Titles](https://github.com/azerothcore/mod-pvp-titles)
     - [Random Enchants](https://github.com/azerothcore/mod-random-enchants)
     - [Reagent Bank (By Character)](https://github.com/ZhengPeiRu21/mod-reagent-bank)
     - [Skip DK Starting Area](https://github.com/azerothcore/mod-skip-dk-starting-area)
     - [Solo LFG](https://github.com/azerothcore/mod-solo-lfg)
     - [Transmog](https://github.com/azerothcore/mod-transmog)
     - [Warlock Pet Rename](https://github.com/silviu20092/mod-warlock-pet-rename)

     Info: Some of those mods need NPCs to be added! So check the FAQs on their site to set them up in a correct way!
       
  4. Some Guides and LUA Scripts, namely:
     - How to make Old World Flying possible in 3.3.5a and before
    
  5. (NOT INCLUDED IN THE REPO) I adapted a multitude of things on my server. If you are interested, then let me know. Many of them include .dbc edits that have to be delivered in a .mpq file to the client. These are:
     - Adding an own faction that allows buying talent points after reaching exalted (with small daily quests, etc.)
     - Changing and adding a range of spells to easen up the life of solo players. They are added & managed by an additional LUA-Script.
        - Everyone gets Aspect of the Uber Cheetah (40% Movespeed, No Daze, Usable with other Aspects if you are a Hunter)
        - Everyone gets stealth with 0 Second Cooldown
        - Everyone gets the Aqua Form of the Druid
        - Everyone gets a special levitation that holds unlimited (until clicked away), only works on themselves and doesn't break with damage or mounting up
        - Everyone gets a self-cast detect invisibility forever. It's unfair if only warlocks can see everything - and be honest - if you are alone there is no other way.
        - Shamans have an adapted Ghost Wolf Form that can be used 'inside' like in buildings, instances, etc.
     - Added a vampiric heal (Spell and LUA Script combination) for classes that are bad at soloing to allow them for more versatility
     - Added commands to summon the Reagent Bank NPC or a Vendor NPC to sell & repair for 1 minute to not having to return to the city every 5 minutes
     - Added a function to Mend Pet (Rank 1) that let's your pet grow until it is de-summoned by mounting up, dismissing it or changing the instance. For more epicness.
     - Changed the Hunters minimum range so there is no dead zone (Melee to Ranged Auto Attack is instantly and skills can be used in melee range)
     - Added an NPC with a custom LUA-script to allow teleporting to all big cities (faction-specific), dungeons or sightseeing points (like old ironforge) for some coinage. Also adds the extra talent points or reset instances (for coin!).
     - More stuff I just forgot - including some balancing fixes.

## Installation

Installation instructions are available [here](http://www.azerothcore.org/wiki/Installation).

NPCBots installation guide is available in the [NPCBots Readme](https://github.com/trickerer/Trinity-Bots#npcbot-mod-installation).


## Support

AzerothCore self-made wiki probably has a lot of answers for you.

For help requests, it is recommended to ask your question on [StackOverflow](https://stackoverflow.com/questions/tagged/azerothcore) and link it in [our chat](https://discordapp.com/channels/217589275766685707/284406375495368704).


## Reporting issues

NPCBots issues can be reported via the [Github issue tracker](https://github.com/trickerer/Trinity-Bots/issues/).

Issues with my specific fork can be reported via [Github issue tracker](https://github.com/ramvaris/AzerothCore-wotlk-with-NPCBots/issues/).

Please take the time to review existing issues before submitting your own to
prevent duplicates.


## Submitting fixes

C++ fixes are submitted as [pull requests](https://github.com/ramvaris/Azerothcore-wotlk-with-NPCBots/pulls).


You can check the [authors](https://github.com/azerothcore/azerothcore-wotlk/blob/master/AUTHORS) file for more details.

## Important Links

- [NPCBots Readme](https://github.com/trickerer/Trinity-Bots/)

- [Website](http://www.azerothcore.org/)
- [AzerothCore catalogue](http://www.azerothcore.org/catalogue.html  "Modules, tools, and other stuff for AzerothCore") (modules, tools, etc...)
- [Our Discord server](https://discord.gg/gkt4y2x)
- [Our wiki](http://www.azerothcore.org/wiki "Easy to use and developed by AzerothCore founder")
- [Our forum](https://github.com/azerothcore/azerothcore-wotlk/discussions/)
- [Our Facebook page](https://www.facebook.com/AzerothCore/)
- [Our LinkedIn page](https://www.linkedin.com/company/azerothcore/)

## License

- The new AzerothCore source components are released under the [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.en.html)
- The old sources based on MaNGOS/TrinityCore are released under the [GNU GPL v2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

It's important to note that AzerothCore is not an official Blizzard Entertainment product, and it is not affiliated with or endorsed by World of Warcraft or Blizzard Entertainment. AzerothCore does not in any case sponsor nor support illegal public servers. If you use this project to run an illegal public server and not for testing and learning it is your own personal choice.

## Special thanks

It's important to note that AzerothCore is not an official Blizzard Entertainment product, and it is not affiliated with or endorsed by World of Warcraft or Blizzard Entertainment. AzerothCore does not in any case sponsor nor support illegal public servers. If you use this project to run an illegal public server and not for testing and learning it is your own personal choice.

[![JetBrains logo.](https://resources.jetbrains.com/storage/products/company/brand/logos/jetbrains.svg)](https://jb.gg/OpenSourceSupport)
