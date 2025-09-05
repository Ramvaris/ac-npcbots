<div align="center">
  <h1>ac-npcbots</h1>
  <p>Fork with integrated <strong>NPCBots</strong>, curated modules and custom solo-friendly enhancements.</p>
  <sub>
    Last sync with NPCBots parent: <strong>2025-09-05</strong><br/>
    Last module refresh: <strong>2025-09-05</strong> (Autobalancer, Eluna)<br/>
    Last successful compile: <strong>Windows 11 Pro x64</strong>
  </sub>
</div>

---

## 🚀 Overview

Minimal, opinionated fork of AzerothCore (WotLK 3.3.5a) focused on: 
* Integrated NPCBots (Trickerer) for solo/group simulation
* Pre-configured quality modules
* Solo-play QoL tweaks & experimental gameplay adjustments

References:
* AzerothCore: https://github.com/azerothcore/azerothcore-wotlk
* NPCBots (original mod): https://github.com/trickerer/Trinity-Bots

---

## 🔧 Differences & Additions

1. Temporary custom fixes (removed when upstreamed)  
2. Core addition: Old world flying (server-side enable)  
   > If players don't have a way to mount, nothing changes. Safe to ignore if unwanted.
3. Bundled & enabled modules:
   - Autobalancer
   - Eluna API
   - Gain Honor from killing Guards
   - Guildhouse
   - Instance Reset
   - PVP Titles
   - Random Enchants
   - Reagent Bank (By Character)
   - Skip DK Starting Area
   - Solo LFG
   - Transmog
   - Warlock Pet Rename
   Info:
   - Some require extra NPCs (see each module's docs)
   - Don't want them? Delete before compiling
5. Guides & scripts (external repo paths retained):
   - Old World Flying guide (3.3.5a and earlier)
6. Not included but implemented privately (ask if interested; many require client DBC/MPQ changes):
   - Faster crafting/gathering (0.5s)
   - Reputation-based extra talent vendor & dailies
   - Solo-centric spell tweaks (mobility, utility, invisibility, levitation, indoor ghost wolf)
   - Vampiric sustain ability for weak solo specs
   - Temporary summon: reagent bank / repair vendor
   - Growing pet via Mend Pet Rank 1
   - No dead zone for ranged auto & abilities
   - Teleporter NPC (cities, dungeons, curiosities) + instance reset + talent service
   - Additional balancing adjustments (uncatalogued)

👁️ Screenshots: See `FEATURES.md`.

---

## 📥 Installation

Follow the standard AzerothCore installation flow:  
http://www.azerothcore.org/wiki/Installation

NPCBots setup specifics:  
https://github.com/trickerer/Trinity-Bots#npcbot-mod-installation

After cloning: remove unwanted modules before building if necessary.

---

## 🐞 Issues & Contributions

NPCBots issues: https://github.com/trickerer/Trinity-Bots/issues/  
Fork-specific issues: https://github.com/ramvaris/AzerothCore-wotlk-with-NPCBots/issues/  
PRs (C++/scripts): https://github.com/ramvaris/Azerothcore-wotlk-with-NPCBots/pulls

Check existing reports first to avoid duplicates.

---

## 📚 References

* AzerothCore upstream: azerothcore/azerothcore-wotlk
* NPCBots: trickerer/Trinity-Bots
* Modules: see links in each module's own repository

---

## 📄 License

See `LICENSE`. Upstream components retain their original licenses (AGPLv3 / GPLv2 lineage where applicable).

---

## ⚠️ Notice

Not affiliated with or endorsed by Blizzard Entertainment. Educational/research use recommended.

---

## 🙈 Screens & Extras

See `FEATURES.md` for unsorted screenshots of non-included optional tweaks.
