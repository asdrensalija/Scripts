-- foosAIO.lua
-- Version: beta.0.97.14b
-- Author: foo0oo
-- Release Date: 2017/05/03
-- Last Update: 2017/09/21

local fooAllInOne = {}
-- Menu Items
	-- general Menu
fooAllInOne.versionNumber = Menu.AddOption({ "Utility","foos AllInOne" }, "0. Version Number: beta.0.97.14b", "Release date: 2017/09/21", 0, 0, 0)
Menu.SetValueName(fooAllInOne.versionNumber, 0, '')

fooAllInOne.optionEnable = Menu.AddOption({ "Utility","foos AllInOne" }, "1. Overall enabled {{overall}}", "Helpers helper")
fooAllInOne.optionComboKey = Menu.AddKeyOption({ "Utility","foos AllInOne" }, "1.1 overall combo key", Enum.ButtonCode.KEY_SPACE)
fooAllInOne.optionMoveToCursor = Menu.AddOption({ "Utility","foos AllInOne" }, "1.3 Move to Cursor Pos {{overall}}", "if no enemy in range, your hero will move to cursor pos (only works in conjunction with target lock mode!)")
fooAllInOne.optionLockTarget = Menu.AddOption({ "Utility","foos AllInOne" }, "1.2 Target locking {{overall}}", "when combo button is pressed, nearest target to cursor is locked; lock is lifted if target is dead, out of range or goes into fog/invis")
fooAllInOne.optionLockTargetIndicator = Menu.AddOption({ "Utility","foos AllInOne" }, "1.4 Draw locked target indicator {{overall}}", "draws some particle indicator", 0, 1, 1)
fooAllInOne.optionLockTargetParticle = Menu.AddOption({ "Utility","foos AllInOne" }, "1.5 Indicator style {{overall}}", "", 0, 1, 1)
fooAllInOne.optionWardAwareness = Menu.AddOption({ "Utility","foos AllInOne", "1.6 Ward awareness" }, "1. Draw indicator for enemy wards {{overall}}", "will show a ward symbol of the specific enemy ward that was planted with timers")
fooAllInOne.optionWardAwarenessRemove = Menu.AddOption({ "Utility","foos AllInOne", "1.6 Ward awareness" }, "2. Auto remove indicator {{overall}}", "will remove indicator if a ward is killed near the indicated location")
fooAllInOne.optionWardAwarenessClickRemove = Menu.AddOption({ "Utility","foos AllInOne", "1.6 Ward awareness" }, "3. Click remove indicator {{overall}}", "will remove indicator if double-clicking on indicator")
fooAllInOne.optionDebugEnable = Menu.AddOption({ "Utility","foos AllInOne" }, "99. ***Debug***", "should be off, just for developers")
fooAllInOne.optionOrbwalkEnable = Menu.AddOption({ "Utility","foos AllInOne", "8. Orbwalker" }, "Enabled {{orbwalker}}", "if enabled, you will use orbwalker module instead of regular right clicks")
fooAllInOne.optionOrbwalkDistance = Menu.AddOption({ "Utility","foos AllInOne", "8. Orbwalker" }, "Minimum distance", "ranged heroes will not go nearer then minimum range to target - values are percentage of your attack range - recommended: 50%- 70%", 30, 80, 10)
fooAllInOne.optionOrbwalkOffset = Menu.AddOption({ "Utility","foos AllInOne", "8. Orbwalker" }, "Orbwalker offset", "set the offset - the higher the value, the less the distance your hero will move in-between attacks - if value = 0, you go full distance possible in backswing - recommended value: 10-20 because of ping, pathing, blocked pathing etc.", 0, 50, 5)
fooAllInOne.optionOrbwalkKiting = Menu.AddOption({ "Utility","foos AllInOne", "8. Orbwalker" }, "kiting {{orbwalker}}", "if enabled, your ranged hero tries to hit and run away if enemy is to close (only if turning-running-turning is faster then attack animation)")
fooAllInOne.optionWorldToMinimapOffsetX = Menu.AddOption({ "Utility","foos AllInOne", "7. WorldToMinimap" }, "X-Offset {{minimap}}", "Adjustment variable for World-to-minimap renderer", -30, 30, 1)
fooAllInOne.optionWorldToMinimapOffsetY = Menu.AddOption({ "Utility","foos AllInOne", "7. WorldToMinimap" }, "Y-Offset {{minimap}}", "Adjustment variable for World-to-minimap renderer", -30, 30, 1)
fooAllInOne.optionDodgeItEnable = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt" }, "0. Enable {{dodgeit}}", "experimental manta dodger")
fooAllInOne.optionLastHitEnable = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter" }, "0. Enable {{lasthit}}", "experimental last hitter")
fooAllInOne.optionLastHitKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter" }, "1. Activation key {{lasthit}}", Enum.ButtonCode.MOUSE_LEFT)
fooAllInOne.optionLastHitStyle = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter" }, "2. Targeting style {{lasthit}}", "", 0, 2, 1)
fooAllInOne.optionLastHitOffset = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter" }, "3. Offset {{lasthit}}", "", 0, 5, 1)
fooAllInOne.optionLastHitDrawCreepEnable = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter", "4. Drawings" }, "1. Enable creep drawings {{lasthit}}", "will draw some usefull information on creeps")
fooAllInOne.optionLastHitDrawRange = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter", "4. Drawings" }, "0. Draw attack range {{lasthit}}", "draws own attack range if ranged")
fooAllInOne.optionLastHitDrawStyle = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter", "4. Drawings" }, "2. creep info style {{lasthit}}", "", 0, 1, 1)
fooAllInOne.optionLastHitDrawCreepAttack = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter", "4. Drawings" }, "3. Draw attacker count {{lasthit}}", "")
fooAllInOne.optionLastHitDrawCreepTimer = Menu.AddOption({ "Utility","foos AllInOne", "97. <ALPHA> Last Hitter", "4. Drawings" }, "4. Draw last hit indicator {{lasthit}}", "")

	-- killsteal Menu
fooAllInOne.optionKillStealEnable = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal" }, "Enabled {{killsteal}}", "uses skill nukes to kill enemy (only nukes, no disable abilities)")
fooAllInOne.optionKillStealInvoker = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "1. Auto Sunstrike KillSteal", "tries to kill steal with sun strike")
fooAllInOne.optionKillStealInvokerTurn = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "5.2 Turn check adjustment", "amount of game ticks enemy must run in a straight line (30 ticks ~ 1 sec)", 10, 60, 5)
fooAllInOne.optionKillStealAutoInvoke = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "5.1 Auto Invoke Sunstrike", "will auto invoke SS if not in slot and enemy killable")
fooAllInOne.optionKillStealInvokerTPpartice = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "3. Killsteal on TPing enemies", "will kill tp'ing enemies if enemy HP is below DMG treshold")
fooAllInOne.optionKillStealInvokerImmobil = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "2. Killsteal on immobilized enemies", "will kill immobilized enemies if enemy HP is below DMG treshold")
fooAllInOne.optionKillStealInvokerTreshold = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "5.3 HP Treshold adjust", "will start casting sunstrike before HP is below sunstrike dmg (for incoming attacks e.g. from team) (in % of sunstrike dmg)", 0, 25, 5)
fooAllInOne.optionKillStealInvokerRunning = Menu.AddOption({ "Utility","foos AllInOne", "9. Auto Kill Steal", "Invoker" }, "4. Killsteal on moving targets", "will try to kill moving enemies if enemy HP is below DMG treshold")

	-- Items Menu
fooAllInOne.optionItemEnable = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage" }, "Enabled {{off items}}", "Helpers helper")
fooAllInOne.optionItemStyle = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage" }, "Choose activation style", "", 0, 2, 1)
fooAllInOne.optionItemSoulring = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Soulring", "Use Soulring before using spells")
fooAllInOne.optionItemVeil = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Veil Of Discord", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemHex = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Scythe Of Vyse", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemBlood = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Bloodthorn ", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemeBlade = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Ethereal Blade", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemOrchid = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Orchid Malevolence", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemAtos = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Rod Of Atos", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemAbyssal = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Abyssal Blade", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemHalberd = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Heavens Halbert", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemShivas = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Shivas Guard", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemDagon = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Dagon", "cast order - highest number will be cast first", -1, 10, 1)
fooAllInOne.optionItemUrn = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Urn of shadows", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemManta = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Manta Style", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemMjollnir = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Mjollnir", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemMedallion = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Medallion of Courage", "cast order - highest number will be cast first", 0, 10, 1)
fooAllInOne.optionItemCrest = Menu.AddOption({ "Utility","foos AllInOne", "2. Auto Item Usage", "Items" }, "Use Item Solar Crest", "cast order - highest number will be cast first", 0, 10, 1)

	-- Linkens Menu
fooAllInOne.optionLinkensEnable = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "0. Enabled {{linkens}}", "Helpers helper")
fooAllInOne.optionLinkensManual = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "1. Pop linkens when manually casting", "will also pop linkens, if you cast a targeted spell manually (not only in combo mode)")
fooAllInOne.optionLinkensForce = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Force Staff", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensEul = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Eul", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensHalberd = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Halberd", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensHex = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Hex", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensBlood = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Bloodthorn", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensOrchid = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Orchid", "to break Linkens - highest number will be prioritized", 0, 6, 1)
fooAllInOne.optionLinkensPike = Menu.AddOption({ "Utility","foos AllInOne", "3. Auto Break Linkens" }, "Use Pike", "to break Linkens - highest number will be prioritized", 0, 6, 1)

	-- Utility Items Menu
fooAllInOne.optionUtilityEnable = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Enabled {{util}}", "Helpers helper")
fooAllInOne.optionUtilityMidas = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items", "Midas" }, "Auto Use Midas", "use midas on creeps automatically")
fooAllInOne.optionUtilityMidasXP = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items", "Midas" }, "Min XP threshold", "", 0, 1, 1)
fooAllInOne.optionUtilityStick = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Auto Use Stick/Wand/Cheese/Faerie", "will auto use items if hp below hp threshold")
fooAllInOne.optionUtilityHealth = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Treshold Hero Health", "Threshold for auto use stick, wand, mek, greaves", 5, 75, 5)
fooAllInOne.optionUtilityMek = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Auto Use Mekansm", "will use mek when you or teammate in range is below hp threshold")
fooAllInOne.optionUtilityGreaves = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Auto Use Greaves", "same as mek")
fooAllInOne.optionUtilityTalon = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Auto Use Talon", "will use talon on highest hp creep (only neutrals)")
fooAllInOne.optionUtilityArcane = Menu.AddOption({ "Utility","foos AllInOne", "4. Auto Use Utility Items" }, "Auto Use Arcane Boots", "will use arcanes if you are mana missing or teammate in range is below 40% mana")

	-- Defensive Items Menu
fooAllInOne.optionDefensiveItems = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "0. Enabled {{deff}}", "will pop defensive items when in danger (self or ally)")
fooAllInOne.optionDefensiveItemsGlimmer = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "3. Glimmer Cape", "will be cast on self/ally if in danger or channelling ability or tping outside of base")
fooAllInOne.optionDefensiveItemslotusOrb = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "4. Lotus Orb", "on self/ally when in danger")
fooAllInOne.optionDefensiveItemsCrimson = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "5. Crimson Guard", "self/ally when in danger")
fooAllInOne.optionDefensiveItemsCrest = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "6. Solar Crest", "on ally when in danger")
fooAllInOne.optionDefensiveItemsPipe = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "7. Pipe", "self/ally when in danger")
fooAllInOne.optionDefensiveItemsBKB = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items", "2. BKB" }, "0. Enabled {{bkb}}", "will trigger BKB if one of the abilities below is around and ready and if there are at least #min. enemies around (set option)")
fooAllInOne.optionDefensiveItemsBKBEnemies = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items", "2. BKB" }, "1. Min. enemies around", "", 1, 5, 1)
fooAllInOne.optionDefensiveItemsBKBRadius = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items", "2. BKB" }, "2. Search radius", "radius to search for enemies and abilities", 500, 1000, 100)
fooAllInOne.optionDefensiveItemsSatanic = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "8. Satanic", "logic tbd")
fooAllInOne.optionDefensiveItemsThreshold = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "1. HP Threshold {{deff}}", "below this treshold, npc is always treated as in danger (regardless of stun, root, ...) (in life %)", 10, 50, 5)
fooAllInOne.optionDefensiveItemsMedallion = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "9. Medallion of Courage", "on self/ally when in danger")
fooAllInOne.optionDefensiveItemsGhost = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items" }, "10. Ghost scepter", "on self when in danger")
	-- Hero Menu
fooAllInOne.optionHeroAxe = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Axe" }, "Axe Combo", "basic axe script, will focus nearest hero to cursor")
fooAllInOne.optionHeroAxeCulling = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Axe" }, "Auto culling blade", "ults everything that is in range and below hp threshold")
fooAllInOne.optionHeroAxeJump = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Axe" }, "Axe Jump Style", "blink to nearest enemy to cursor or blink to best position if multiple enemies could be called", 0, 1, 1)
fooAllInOne.optionHeroAxeForceBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Axe" }, "Force blink", "hero will blink when combo button is pressed, even if no enemy is around (e.g. for blinking in FoW) or cursor is not in range of enemy (adjust the range below!)")
fooAllInOne.optionHeroAxeForceBlinkRange = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Axe" }, "Force Blink Check Range", "if force blink is activated, hero will blink to mouse cursor instead of enemy, if mouse cursor is outside of force blink check range", 150, 750, 50)
fooAllInOne.optionHeroCentaur = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Centaur" }, "0. Centaur combo", "basic centaur script, will focus nearest hero to cursor")
fooAllInOne.optionHeroCentaurJump = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Centaur" }, "1. Centaur jump style", "blink to nearest enemy to cursor or blink to best position if multiple enemies could be stomped", 0, 1, 1)
fooAllInOne.optionHeroCentaurForceBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Centaur" }, "2. Force blink {{centaur}}", "hero will blink when combo button is pressed, even if no enemy is around (e.g. for blinking in FoW) or cursor is not in range of enemy (adjust the range below!)")
fooAllInOne.optionHeroCentaurForceBlinkRange = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Centaur" }, "2.1 Force blink check range {{centaur}}", "if force blink is activated, hero will blink to mouse cursor instead of enemy, if mouse cursor is outside of force blink check range", 150, 750, 50)
fooAllInOne.optionHeroMagnus = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0. Magnus combo", "basic magnus combo")
fooAllInOne.optionHeroMagnusAutoUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur", "1. Auto reverse polarity" }, "0. Enable {{magnus polarity}}", "will auto ult enemies if prerequisits are fulfilled")
fooAllInOne.optionHeroMagnusAutoUltSkewer = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur", "1. Auto reverse polarity" }, "1. Use skewer to initiate {{magnus polarity}}", "if no blink or blink on cd, skewer will be used to close the gap")
fooAllInOne.optionHeroMagnusAutoUltCount = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur", "1. Auto reverse polarity" }, "2. Min. enemies to hit {{magnus polarity}}", "", 1, 5, 1)
fooAllInOne.optionHeroMagnusAutoUltRefresher = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur", "1. Auto reverse polarity" }, "3. Use refresher {{magnus polarity}}", "will use refresher after first RP if enemies survive first RP")
fooAllInOne.optionHeroMagnusAutoEmpower = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "2. Auto empower", "casts empower when about to attack a target")
fooAllInOne.optionHeroMagnusSkewerCombo = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur", "3. Skewer combo" }, "0. Enable {{magnus skewer combo}}", "when button is pressed, hero will blink to target, turn and skewer enemy back to blink start pos")
fooAllInOne.optionHeroMagnusSkewerComboKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur", "3. Skewer combo" }, "1. Skewer combo key {{magnus skewer combo}}", Enum.ButtonCode.KEY_P) 
fooAllInOne.optionHeroMagnusJump = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0.1 Jump style {{magnus combo}}", "", 0, 1, 1)
fooAllInOne.optionHeroMagnusInitiateSkewer = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0.2 Initiate with skewer {{magnus combo}}", "if no blink, then skewer will we used to close the gap")
fooAllInOne.optionHeroMagnuscomboKeyAltSkewer = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0.4 Alt key for skewer combo {{magnus combo}}", Enum.ButtonCode.KEY_LALT)
fooAllInOne.optionHeroMagnuscomboKeyAltRP = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0.5 Alt key for full RP combo {{magnus combo}}", Enum.ButtonCode.KEY_LCONTROL)
fooAllInOne.optionHeroMagnusReturn = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0.3 Skewer direction {{magnus combo}}", "origin is where combo started (eg your position right before blinking), cursor is cursor", 0, 1, 1)
fooAllInOne.optionHeroMagnusComboRefresher = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Magnataur" }, "0.6 Use refresher in RP combo {{magnus combo}}", "")
fooAllInOne.optionHeroClock = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Clockwerk" }, "0. Clockwerk combo", "full combo with hookshot prediction (will check for collision with npcs)")
fooAllInOne.optionHeroClockDrawIndicator = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Clockwerk" }, "1. Draw hookshot indicator", "if enemy is in hookshot range and no npcs are blocking the hookshot path, an indicator is drawn")
fooAllInOne.optionHeroHuskar = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "0. Huskar Combo", "basic huskar combo")
fooAllInOne.optionHeroHuskarHarassKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "0.1 harass key {{huskar}}", Enum.ButtonCode.KEY_P) 
fooAllInOne.optionHeroHuskarInnerVit = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "1. Inner vitality usage", "", 0, 2, 1)
fooAllInOne.optionHeroHuskarUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "2. Use life break in combo", "")
fooAllInOne.optionHeroHuskarAutoVit = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "3. Auto inner vitality", "will auto use inner vitality if hp below threshold")
fooAllInOne.optionHeroHuskarAutoVitAlly = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "3.1 Inner vitality on allies", "will auto use inner vitality if ally is in danger")
fooAllInOne.optionHeroHuskarHPThreshold = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "3.2 Inner vitality hp treshold", "in life %", 10, 70, 5)
fooAllInOne.optionHeroHuskarArmletOff = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Huskar" }, "4. Auto toggle off armlet {{huskar}}", "will auto toggle off armlet after combo if no enemies are around and hero hp is high enough")
fooAllInOne.optionHeroSky = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Skywrath Mage" }, "0. Enable {{sky}}", "full combo")
fooAllInOne.optionHeroSkyDrawDMG = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Skywrath Mage" }, "1. draw dmg indicators {{sky}}", "")
fooAllInOne.optionHeroSkyHarass = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Skywrath Mage" }, "2. use bolt to harass {{sky}}", "")
fooAllInOne.optionHeroSkyHarassKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Skywrath Mage" }, "2.1 harass key {{sky}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroSkyStyle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Skywrath Mage" }, "3. combo style {{sky}}", "if mana saving is selcted, uöt will only be casted if needed", 0, 1, 1)
fooAllInOne.optionHeroNecro = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos" }, "0. Enable {{necro}}", "full combo")
fooAllInOne.optionHeroNecroComboScythe = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos" }, "0.1 use ult in combo {{necro}}", "", 0, 2, 1)
fooAllInOne.optionHeroNecroBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos" }, "0.2 use blink in combo {{necro}}", "")
fooAllInOne.optionHeroNecroBlinkRange = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos" }, "0.3 blink distance to enemy {{necro}}", "will keep distance from enemy when blinking in", 200, 600, 50)
fooAllInOne.optionHeroNecroDrawDMG = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos" }, "1. draw dmg indicators {{necro}}", "")
fooAllInOne.optionHeroNecroScythe = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos" }, "2. auto scythe {{necro}}", "")
fooAllInOne.optionHeroNecroPulse = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse" }, "0. enabled {{pulse}}", "")
fooAllInOne.optionHeroNecroPulseCreeps = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "1. enabled {{pulse}}", "will farm creeps with death pulse")
fooAllInOne.optionHeroNecroPulseCreepsMana = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "1.1 mana treshold {{pulse}}", "", 10, 90, 5)
fooAllInOne.optionHeroNecroPulseCreepsCount = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "1.2 creep count {{pulse}}", "", 1, 5, 1)
fooAllInOne.optionHeroNecroShroudFarm = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "2. auto shroud regen {{pulse}}", "will auto use ghost shroud if conditions are met")
fooAllInOne.optionHeroNecroShroudFarmCount = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "2.1 stack count {{pulse}}", "min. number of death pulse regen stacks", 1, 15, 1)
fooAllInOne.optionHeroNecroShroudFarmSave = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "2.2 save activation {{pulse}}", "will not auto use if enemy heroes are nearby")
fooAllInOne.optionHeroNecroShroudFarmTreshold = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "1. pulse farm" }, "2.3 treshold {{pulse}}", "will only us if hp or mana is below treshold", 5, 75, 5)
fooAllInOne.optionHeroNecroPulseHeroes = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "2. pulse harass" }, "1. enabled {{pulse harass}}", "will auto harass enemies in range with pulse if mana above treshold")
fooAllInOne.optionHeroNecroPulseHeroesMana = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "3. auto pulse", "2. pulse harass" }, "2. mana treshold {{pulse harass}}", "dont harass if mana below %", 5, 85, 5)
fooAllInOne.optionHeroNecroShroudPanic = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "4. panic mode" }, "0. enabled {{necro panic}}", "will auto use shroud and death pulse if HP below treshold")
fooAllInOne.optionHeroNecroShroudPanicHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Necrophos", "4. panic mode" }, "1. HP treshold {{necro panic}}", "hp treshold in %", 5, 75, 5)
fooAllInOne.optionHeroOD = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer" }, "0. Enable {{OD}}", "full combo")
fooAllInOne.optionHeroODBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer" }, "1. Use blink in combo {{OD}}", "")
fooAllInOne.optionHeroODBlinkRange = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer" }, "1.1 Blink range to enemy {{OD}}", "will keep distance to enemy", 200, 600, 50)
fooAllInOne.optionHeroODKillsteal = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "2. Kill steal" }, "0. Enable {{OD kill}}", "")
fooAllInOne.optionHeroODKillstealOrb = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "2. Kill steal" }, "1. Use arcane orb to KS {{OD kill}}", "")
fooAllInOne.optionHeroODKillstealPrison = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "2. Kill steal" }, "2. Use astral prison to KS {{OD kill}}", "")
fooAllInOne.optionHeroODKillstealEclipse = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "2. Kill steal" }, "3. Use sanitys eclipse to KS {{OD kill}}", "")
fooAllInOne.optionHeroODKillstealEclipseHittable = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "2. Kill steal" }, "3.1 Min. enemies to hit {{OD kill}}", "", 1, 5, 1)
fooAllInOne.optionHeroODKillstealEclipseKillable = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "2. Kill steal" }, "3.2 Min. enemies to kill {{OD kill}}", "", 1, 5, 1)
fooAllInOne.optionHeroODAutoPrisonDefend = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer" }, "3. Auto disable with prison {{OD}}", "auto disable with astral imprisonment if enemy jumps you")
fooAllInOne.optionHeroODHurricane = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "4. Hurricane pike usage" }, "0. Auto use hurricane pike {{OD}}", "auto uses hurricane pike if enemy is close and your HP below treshold; will auto toggle arcane orb")
fooAllInOne.optionHeroODHurricaneHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "4. Hurricane pike usage" }, "1. HP treshold {{OD hurricane}}", "HP treshold in %", 5, 75, 5)
fooAllInOne.optionHeroODAutoPrisonSave = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "5. Auto save with prison" }, "0. enable {{OD prison save}}", "will save self and ally with prison")
fooAllInOne.optionHeroODAutoPrisonSaveSelf = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "5. Auto save with prison" }, "1. Self save {{OD prison save}}", "will save self if HP below treshold")
fooAllInOne.optionHeroODAutoPrisonSaveAlly = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "5. Auto save with prison" }, "2. Ally save {{OD prison save}}", "will save ally if HP below treshold or in danger (like stunned etc)")
fooAllInOne.optionHeroODAutoPrisonHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Outworld Devourer", "5. Auto save with prison" }, "3. HP treshold {{OD prison save}}", "", 5, 30, 5)
fooAllInOne.optionHeroSF = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "0. Enable {{SF}}", "full combo")
fooAllInOne.optionHeroSFEulCombo = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "1. Eul-Requiem-Combo key {{SF}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroSFDrawReqDMG = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "1.1 Draw ult damage {{SF}}", "draws damage of a full ult hit")
fooAllInOne.optionHeroSFBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "2. Use blink in combo {{SF}}", "")
fooAllInOne.optionHeroSFBlinkRange = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "2.1 Blink range to enemy {{SF}}", "will keep distance to enemy", 200, 600, 50)
fooAllInOne.optionHeroSFHurricane = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend", "3. Hurricane pike usage" }, "0. Auto use hurricane pike {{SF}}", "auto uses hurricane pike if enemy is close and your HP below treshold")
fooAllInOne.optionHeroSFHurricaneHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend", "3. Hurricane pike usage" }, "1. HP treshold  {{SF hurricane}}", "HP treshold in %", 5, 75, 5)
fooAllInOne.optionHeroSFComboRaze = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "4. Use raze in combo {{SF}}", "")
fooAllInOne.optionHeroSFDrawRazeCircle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Shadow Fiend" }, "5. Draw raze AoEs {{SF}}", "with particle engine")
fooAllInOne.optionHeroDazzle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle" }, "0. Enable {{dazzle}}", "dazzle helper")
fooAllInOne.optionHeroDazzleAutoGrave = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle", "1. Auto grave" }, "0. Auto use grave {{dazzle}}", "on self and ally")
fooAllInOne.optionHeroDazzleHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle", "1. Auto grave" }, "1. HP treshold {{dazzle}}", "", 5, 50, 5)
fooAllInOne.optionHeroDazzleAutoWeave = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle", "2. Auto weave" }, "0. Auto use weave {{dazzle}}", "on enemies")
fooAllInOne.optionHeroDazzleAutoWeaveCount = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle", "2. Auto weave" }, "1. Min. enemies to hit {{dazzle}}", "", 1, 5, 1)
fooAllInOne.optionHeroDazzleAutoHeal = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle", "3. Auto heal" }, "0. Auto use heal {{dazzle}}", "on self and allies")
fooAllInOne.optionHeroDazzleAutoHealHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle", "3. Auto heal" }, "1. HP threshold {{dazzle}}", "", 5, 75, 5)
fooAllInOne.optionHeroDazzleHealKS = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Dazzle" }, "4. Shadow wave kill steal {{dazzle}}", "")

fooAllInOne.optionHeroTiny = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts" }, "Tiny", "full combo")
fooAllInOne.optionHeroWindrunner = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "0. Enable {{windrunner}}", "basic windrunner combo")
fooAllInOne.optionHeroWindrunnerPredict = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "1. Use prediction for shackleshot", "if activated, script will use predicted position instead of the current position for calculating shackleshot and blink position")
fooAllInOne.optionHeroWindrunnerUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "3. Auto use ultimate {{windrunner}}", "if shackleshot was successful, hero will auto activate ult on shackle target")
fooAllInOne.optionHeroWindrunnerWind = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "4. Auto use windrun", "will trigger windrun, if enough enemies around (radius 600) (set enemy count here)", 0, 5, 1)
fooAllInOne.optionHeroWindrunnerBlinkShackle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "2. Use Blink dagger {{windrunner}}", "if enabled, script will search for best position to shackle and use blink")
fooAllInOne.optionWindrunnerDrawIndicator = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "5. Draw shackle indicator {{windrunner}}", "will show if enemy can be shackled with tree or other npc")
fooAllInOne.optionHeroWindrunnerBranchShackle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Windrunner" }, "6. Branch-blink-shackle {{windrunner}}", "if enabled, script will blink-branch shackle enemy if enemy cannot be shackle with tree or npc (blink and branch in inv are required)")
fooAllInOne.optionHeroTimber = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "0. Enable {{timber}}", "meh, cant target trees.. timberchain to cursor, if enemys are hit, full combo with chakram prediction")
fooAllInOne.optionHeroTimberPredict = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "1. Use prediction for timberchain", "")
fooAllInOne.optionHeroTimberWhirling = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "2. Auto use whirling death", "", 0, 2, 1)
fooAllInOne.optionHeroTimberUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "3. Use chakram", "will use chakram in combo")
fooAllInOne.optionHeroTimberUltTiming = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "3.1 Chakram callback timing", "set time, when shakram should be called back, if enemy is still within chakram range; if enemy isnt within chakram, chakram is callback asap", 1, 10, 1)
fooAllInOne.optionHeroTimberBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "4. Use blink {{timber}}", "will use blink in combo to find best chain position")
fooAllInOne.optionHeroTimberPanicKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "5. Panic Key {{timber}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroTimberPanicDir = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "6. panic direction {{timber}}", "will find furthest tree away", 0, 2, 1)
fooAllInOne.optionHeroTimberFastMoveKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Timbersaw" }, "7. Fast Move Key", Enum.ButtonCode.KEY_I)
fooAllInOne.optionHeroEmber = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Ember" }, "Ember Combo", "hold combo key -> full combo with remnant, release key after ~ 1 sec -> fist+chains")
fooAllInOne.optionHeroEmberUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Ember" }, "Ember Ult Usage in Combo", "", 0, 1, 1)
fooAllInOne.optionHeroUrsa = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Ursa" }, "0. Ursa Combo", "full combo")
fooAllInOne.optionHeroUrsaEnrage = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Ursa" }, "1. Auto use enrage", "will use enrage if requirements below are fullfilled")
fooAllInOne.optionHeroUrsaEnrageHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Ursa" }, "2. Enrage hp treshold", "will only use enrage if hero HP is below threshold", 5, 75, 5)
fooAllInOne.optionHeroUrsaEnrageEnemies = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Ursa" }, "3. Min. enemies around", "will only use enrage if enemiy heroes are around", 1, 5, 1)
fooAllInOne.optionHeroTA = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Templar Assassin" }, "0. TA Combo", "full combo")
fooAllInOne.optionHeroTABlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Templar Assassin" }, "1. Use blink in Combo {{TA}}", "")
fooAllInOne.optionHeroTAHarassKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Templar Assassin" }, "4. psi blades harass key {{TA}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroTAHarass = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Templar Assassin" }, "2. Harass with psi blades {{TA}}", "if harass key is pressed, hero will try to harass with spill damage")
fooAllInOne.optionHeroTAHarassRange = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Templar Assassin" }, "3. Harass search range {{TA}}", "range how far your hero will max. walk to harass",50,500,50)
fooAllInOne.optionHeroLegion = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Legion Commander" }, "0. Legion Commander combo", "full combo")
fooAllInOne.optionHeroLegionArmletOff = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Legion Commander" }, "1. Auto armlet off", "will auto toggle off armlet after duel is over or enemy is dead, if herp HP is not too low and no other enemies are around")
fooAllInOne.optionHeroLegionAutoSave = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Legion Commander" }, "2. Auto save allies {{legion}}", "will auto cast W on allies in range if in danger")
fooAllInOne.optionHeroSlardar = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Slardar" }, "Slardar Combo", "full combo")
fooAllInOne.optionHeroSlardarStyle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Slardar" }, "Slardar Jump Style", "blink to nearest enemy to cursor or blink to best position if multiple enemies could be crushed", 0, 1, 1)
fooAllInOne.optionHeroClinkz = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Clinkz" }, "0. Clinkz Combo", "")
fooAllInOne.optionHeroClinkzUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Clinkz" }, "1. Auto Ultimate  {{clinkz}}", "auto ult on enemy creeps or neutrals when ready")
fooAllInOne.optionHeroClinkzHarass = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Clinkz" }, "2. Harass with searing", "will auto harass enemies in range with searing arrows if harass key is pressed")
fooAllInOne.optionHeroClinkzHarassKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Clinkz" }, "2.1 Harass key {{clinkz}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroQoP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Queen of Pain" }, "Queen of Pain Combo", "full combo; only uses ult if you have agahnims and ult can kill enemy")
fooAllInOne.optionHeroQoPblink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Queen of Pain" }, "Use blink in combo {{QoP}}", "")
fooAllInOne.optionHeroQoPAutoUlt = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Queen of Pain" }, "Auto Cast Ult {{QoP}}", "will kill steal on targets in range", 0, 2, 1)
fooAllInOne.optionHeroSven = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts" }, "Sven", "full combo, MoM after everything is used")
fooAllInOne.optionHeroVisage = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "0. Visage Combo", "full combo with Familiars")
fooAllInOne.optionHeroVisageDMGStacks = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "1. Familiar DMG stacks", "number of remaining familiar damage stacks when starting stun chain", 1, 6, 1)
fooAllInOne.optionHeroVisageInstStunKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "2. Instant stun key", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroVisageKS = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "3. Soul assumption kill steal", "")
fooAllInOne.optionHeroVisageFamiliarSave = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "4. Auto save familiars", "will use stoneform to save familiars")
fooAllInOne.optionHeroVisageFamiliarCancel = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "5. Auto cancel channelling", "will use stoneform to cancel dangerous enemy channelling abilities or tping enemies in range")
fooAllInOne.optionHeroVisagePanicKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Visage" }, "6. Panic key", Enum.ButtonCode.KEY_O)
fooAllInOne.optionHeroArcWarden = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "1.0 Arc Warden Combo", "full combo with double")
fooAllInOne.optionHeroArcWardenMagnetic = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "1.1 Use magnetic field", "cast magnetic field with main hero in combo (double always uses magnetic field)")
fooAllInOne.optionHeroArcWardenSpark = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "1.2 Use spark", "cast spark with main hero and double")
fooAllInOne.optionHeroArcWardenFlux = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "1.3 Use flux", "cast flux with main hero and double")
fooAllInOne.optionHeroArcWardenPush = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "3.0 Arc Warden TP Push Mode", "push mode with double, if you have BoTs")
fooAllInOne.optionHeroArcWardenTempest = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "2.0 Tempest double combo", "will only combo with your double, not with main. BUTTON NEEDS TO BE PRESSED DOWN! will target first enemies nearest mouse, then enemies in range, then creeps in range, if nothing in range, it will push (fountain or cursor)")
fooAllInOne.optionArcWardenPushKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "3.1TP Push Key", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroArcWardenPushTPStyle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "3.2 TP targeting style", "", 0, 1, 1)
fooAllInOne.optionHeroArcWardenPushTPSelect = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "3.3 Auto line selector", "", 0, 1, 1)
fooAllInOne.optionArcWardenTempestKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "2.1 Tempest double combo/push key", Enum.ButtonCode.KEY_O)
fooAllInOne.optionHeroArcWardenTempestTarget = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden" }, "2.2 Tempest direction", "if tempest double combo/push key is pressed, push in the direction of cursor or enemy fountain", 0, 1, 1)
fooAllInOne.optionHeroArcWardenDraw = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden", "Drawings" }, "Draw Item Cooldowns on Double", "will shot the cooldown of BoTs, midas, necronomicon")
--fooAllInOne.optionHeroArcWardenFont = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden", "Drawings" }, "Font size", "", 10, 50, 5)
fooAllInOne.optionHeroArcWardenXPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden", "Drawings" }, "X-position {{arc}}", "", -500, 500, 10)
fooAllInOne.optionHeroArcWardenYPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Arc Warden", "Drawings" }, "Y-position {{arc}}", "", -500, 500, 10)
fooAllInOne.optionHeroMorphling = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling" }, "0. Morphling Combo", "full shotgun combo")
fooAllInOne.optionHeroMorphlingKill = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling" }, "1. Draw kill indicator {{morph}}", "draws shotgun dmg")
fooAllInOne.optionHeroMorphHPBalance = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling" }, "2. Balance HP {{morph}}", "will morph in agi/str in order to balance your HP")
fooAllInOne.optionHeroMorphHPBalanceDeviation = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling" }, "2.1 Balance deviation {{morph}}", "allowed deviation from selected HP treshold", 50, 500, 25)
fooAllInOne.optionHeroMorphDrawBoard = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling", "3. Balance Board" }, "0. Draw balace board {{morph}}", "draws a board to selected the target HP for balancing")
fooAllInOne.optionHeroMorphBoardToggleKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling", "3. Balance Board" }, "1. Toggle Key for balance board", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroMorphDrawBoardXPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling", "3. Balance Board" }, "2. X-Pos adjustment {{morph}}", "", -500, 500, 10)
fooAllInOne.optionHeroMorphDrawBoardYPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling", "3. Balance Board" }, "3. Y-Pos adjustment {{morph}}", "", -500, 500, 10)
fooAllInOne.optionHeroMorphlingEscape = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling" }, "4. auto escape to replicate", "")
fooAllInOne.optionHeroMorphlingEscapeHP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Morphling" }, "4.1 escape HP treshold", "", 5, 50, 5)


fooAllInOne.optionHeroPuck = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "1. Puck Combo", "basic puck script")
fooAllInOne.optionHeroPuckJump = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "1.1 Puck Jump Style", "blink to nearest enemy to cursor or blink to best position if multiple enemies could be hit", 0, 1, 1)
fooAllInOne.optionHeroPuckPanic = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "2. Puck Panic", "basic defensive actions when panic button is pressed")
fooAllInOne.optionHeroPuckPanicKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "2.3 Puck Panic Key", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroPuckPanicDirection = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "2.1 Puck Panic Direction", "the direction in which blink or orb is casted", 0, 1, 1)
fooAllInOne.optionHeroPuckComboAltKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "1.3 Puck Alt Key", Enum.ButtonCode.KEY_LCONTROL)
fooAllInOne.optionHeroPuckDefend = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "2.2 Auto defend {{puck}}", "auto use waning rift when enemy jumps you")
fooAllInOne.optionHeroPuckOrbInit = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Puck" }, "1.2 Orb Initiation {{puck}}", "will initiate with orb, if no blink dagger; will jaunt to orb, if target is hit")
fooAllInOne.optionHeroProphet = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Natures Prophet" }, "Prophet Helper", "Lane Pusher with Treants")
fooAllInOne.optionHeroProphetToggleKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Natures Prophet" }, "Toggle Key {{prophet}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionProphetDrawToggle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Natures Prophet", "Drawings" }, "1. Draw Toggle Notification {{prophet}}", "")
fooAllInOne.optionProphetDrawKS = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Natures Prophet", "Drawings" }, "2. Draw KS Notification {{prophet}}", "will show you, if an enemy is below 20% hp")
fooAllInOne.optionProphetDrawKSminimap = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Natures Prophet", "Drawings" }, "3. Draw KS Target on Minimap {{prophet}}", "draws a notification where an enemy below 20% HP is on minimap")
fooAllInOne.optionHeroInvoker = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1. Invoker Combo", "basic Invoker combos")
fooAllInOne.optionHeroInvokerBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.0 Use blink in combo", "")
fooAllInOne.optionHeroInvokerSwitch = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.2 Auto switch dynamic mode", "auto switches to dynamic mode after combo is fully executed")
fooAllInOne.optionHeroInvokerAltKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.3 Invoker Alt Key", Enum.ButtonCode.KEY_LCONTROL)
fooAllInOne.optionHeroInvokerCustom1Key = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.9 Select custom combo 1", Enum.ButtonCode.KEY_8)
fooAllInOne.optionHeroInvokerCustom2Key = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "2.1 Select custom combo 2", Enum.ButtonCode.KEY_9)
fooAllInOne.optionHeroInvokerCustom3Key = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "2.2 Select custom combo 3", Enum.ButtonCode.KEY_0)
fooAllInOne.optionHeroInvokerToggleKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel" }, "Panel toggle key {{invoker}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroInvokerSkillshotStyle = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.1 Skillshot Style {{invoker}}", "use build-in prediction or use cursor position for tornado targeting", 0, 1, 1)
fooAllInOne.optionHeroInvokerTornadoItems = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.7 Activate items before tornado", "will cast items even if enemies are going to be tornado'ed")
fooAllInOne.optionHeroInvokerDisableBuildIn = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "1. General" }, "1.8 Disable hake build-in invo features", "hake build-in invoker helper is disabled while pressing combo button; you can now easily use script and build-in features at the same time")
fooAllInOne.optionHeroInvokerDisableBuildInGetOption = Menu.GetOption({ "Hero Specific", "Invoker" }, "Euls/Tornado Combo Helper")
fooAllInOne.optionHeroInvokerAutoInvoke = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel" }, "4. Auto Invoke", "hero will auto invoke required skills after selecting the combo")
fooAllInOne.optionHeroInvokerPanelCD = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel" }, "3. Show skill cooldowns {{invoker}}", "", 0, 2, 1)
fooAllInOne.optionHeroInvokerPanelXPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel" }, "1. X-position {{invoker}}", "", -200, 500, 10)
fooAllInOne.optionHeroInvokerPanelYPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel" }, "2. Y-position {{invoker}}", "", -500, 500, 10)
fooAllInOne.invokerPanelSizeOption = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel" }, "0. Panel Size {{invoker}}", "", 20, 40, 2)
fooAllInOne.optionHeroInvokerPanelShort = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel", "5. Custom indicator" }, "Enable {{invoker custom}}", "if you have selected custom combo or dynamic mode, a small indicator will be shown what combo is selected if the panel is not open")
fooAllInOne.optionHeroInvokerPanelShortXPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel", "5. Custom indicator" }, "X-position short {{invoker custom}}", "", -700, 700, 20)
fooAllInOne.optionHeroInvokerPanelShortYPos = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "2. Panel", "5. Custom indicator" }, "Y-position short {{invoker custom}}", "", -700, 700, 20)
fooAllInOne.optionHeroInvokerIcewallEnable = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "3. Fast Skills" }, "Fast ice wall {{invoker ice}}", "fast icewall (invoke icewall if not invoked)")
fooAllInOne.optionHeroInvokerIcewallKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "3. Fast Skills" }, "Fast ice wall key {{invoker ice}}", Enum.ButtonCode.KEY_O)
fooAllInOne.optionHeroInvokerAlacrityEnable = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "3. Fast Skills" }, "Fast alacrity {{invoker ala}}", "fast self alacrity (invoke alacrity if not invoked)")
fooAllInOne.optionHeroInvokerAlacrityKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "3. Fast Skills" }, "Fast alacrity key {{invoker ala}}", Enum.ButtonCode.KEY_I)
fooAllInOne.optionHeroInvokerCancelEnable = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "4. Cancel Channelling abilities" }, "0. Enable {{invoker chanel}}", "")
fooAllInOne.optionHeroInvokerCancelTPFog = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "4. Cancel Channelling abilities" }, "2. Auto cancel TP in Fog", "will auto use tornado to cancel enemy tping in FoW")
fooAllInOne.optionHeroInvokerCancelBara = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "4. Cancel Channelling abilities" }, "3. Auto cancel bara charge", "will auto use snap or tornado or blast to cancel bara charge")
fooAllInOne.optionHeroInvokerCancelChannelling = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "4. Cancel Channelling abilities" }, "1. Auto cancel channelling spells", "will auto use snap or tornado to cancel enemy channelling spells (only important ones (black hole, shadow shaman ult, ...)")
fooAllInOne.optionHeroInvokerInstanceHelper = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "5. Instance helper" }, "auto instance switch", "QQQ if hp missing, WWW if running, EEE if attacking")
fooAllInOne.optionHeroInvokerInstanceDelay = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "5. Instance helper" }, "delay between instance switch", "", 1, 12, 1)
fooAllInOne.optionHeroInvokerCombo1Skill1 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 1" }, "C1 Skill 1", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo1Skill2 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 1" }, "C1 Skill 2", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo1Skill3 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 1" }, "C1 Skill 3", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo1Skill4 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 1" }, "C1 Skill 4", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo1Skill5 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 1" }, "C1 Skill 5", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo1Skill6 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 1" }, "C1 Skill 6", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo2Skill1 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 2" }, "C2 Skill 1", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo2Skill2 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 2" }, "C2 Skill 2", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo2Skill3 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 2" }, "C2 Skill 3", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo2Skill4 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 2" }, "C2 Skill 4", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo2Skill5 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 2" }, "C2 Skill 5", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo2Skill6 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 2" }, "C2 Skill 6", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo3Skill1 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 3" }, "C3 Skill 1", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo3Skill2 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 3" }, "C3 Skill 2", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo3Skill3 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 3" }, "C3 Skill 3", "select skill", 0, 11, 1)
fooAllInOne.optionHeroInvokerCombo3Skill4 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 3" }, "C3 Skill 4", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo3Skill5 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 3" }, "C3 Skill 5", "select skill", 0, 12, 1)
fooAllInOne.optionHeroInvokerCombo3Skill6 = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "6. Custom Combo", "Combo 3" }, "C3 Skill 6", "select skill", 0, 12, 1)
fooAllInOne.optionHeroAntiMage = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Anti-Mage" }, "1. Anti-Mage Combo", "basic Anti-Mage combo")
fooAllInOne.optionHeroAntiMageBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Anti-Mage" }, "2. Use Anti-Mage blink in combo", "")
fooAllInOne.optionHeroAntiMageVoid = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Anti-Mage" }, "3. Auto use mana void if target killable", "will select target with most mana missing and tries to kill as many enemies as possible")
fooAllInOne.optionHeroPA = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Phantom Assassin" }, "1. PA Combo", "basic PA combo")
fooAllInOne.optionHeroPADagger = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Phantom Assassin", "2. Auto dagger" }, "1. Auto use dagger", "will always dagger the lowest hp target in dagger range")
fooAllInOne.optionHeroPADaggerThreshold = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Phantom Assassin", "2. Auto dagger" }, "4. Mana treshold {{PA}}", "will stop auto casting dagger below treshold", 20, 80, 10)
fooAllInOne.optionHeroPADaggerToggleKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Phantom Assassin", "2. Auto dagger" }, "2. Toggle Key {{PA}}", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroPADaggerDraw = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Phantom Assassin", "2. Auto dagger" }, "3. draw toggle state {{PA}}", "")
fooAllInOne.optionHeroInvokerDynCS = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "1. invoker_cold_snap {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynFS = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "2. invoker_forge_spirit {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynAL = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "3. invoker_alacrity {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynIW = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "4. invoker_ice_wall {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynTO = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "5. invoker_tornado {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynEMP = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "6. invoker_emp {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynSS = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "7. invoker_sun_strike {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynCM = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "8. invoker_chaos_meteor {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynDB = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "9. invoker_deafening_blast {{invoker dyn}}", "", 0, 9, 1)
fooAllInOne.optionHeroInvokerDynOrder = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "7. Dynamic Combo", }, "0. USE CUSTOM PRIORITIES {{invoker dyn}}", "if enabled, you can set the priority order of spells used in dynamic mode, TEST your order before playing an actual game!")	
fooAllInOne.invokerDisplayOption = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "8. Invoker Spell Panel" }, "Enable {{invoker spell panel}}", "draw the invoker skill panel with cooldowns")
fooAllInOne.invokerDisplaySizeOption = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "8. Invoker Spell Panel" }, "Cooldown Display Size", "", 21, 200, 5)
fooAllInOne.invokerDisplayY = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "8. Invoker Spell Panel" }, "Y position", "Vertical position on screen {{invoker spell panel}}", -500, 500, 10)
fooAllInOne.invokerDisplayX = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "8. Invoker Spell Panel" }, "X position", "Horizontal position on screen {{invoker spell panel}}", -200, 200, 10)
fooAllInOne.invokerDisplaySortAbilitiesOption = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Invoker", "8. Invoker Spell Panel" }, "Sort Abilities by Name {{invoker spell panel}}", "")
fooAllInOne.optionHeroZuus = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "1. Zuus Combo", "basic zuus combo")
fooAllInOne.optionHeroZuusFarmKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "2. arc farm key", Enum.ButtonCode.KEY_P)
fooAllInOne.optionHeroZuusHarassKey = Menu.AddKeyOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "3. arc harass key", Enum.ButtonCode.KEY_O)
fooAllInOne.optionHeroZuusHarassMana = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "3.1 harass arc mana threshold", "stop harassing below threshold", 10, 90, 10)
fooAllInOne.optionHeroZuusKillsteal = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "4. killsteal", "killstealing with bolt, arc, wrath (also combinations, eg bolt + arc)")
fooAllInOne.optionHeroZuusUltCount = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "4.1 wrath kill count", "minimum targets killed by ult", 1, 5, 1)
fooAllInOne.optionHeroZuusUltCountRefresher = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "4.2 refresher wrath kill count", "minimum targets killed by ult-refresher-ult combo", 1, 5, 1)
fooAllInOne.optionHeroZuusBlink = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "5. use blink in combo {{zuus}}", "")
fooAllInOne.optionHeroZuusRightClick = Menu.AddOption({ "Utility","foos AllInOne", "6. Hero Scripts", "Zuus" }, "6. use right click attacks in combo {{zuus}}", "zuus will go in attack range")

	-- Menu set values
Menu.SetValueName(fooAllInOne.optionItemVeil, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemHex, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemBlood, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemeBlade, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemOrchid, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemAtos, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemAbyssal, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemHalberd, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemShivas, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemUrn, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemDagon, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemDagon, -1, 'only if killable')
Menu.SetValueName(fooAllInOne.optionItemManta, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemMjollnir, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemMedallion, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionItemCrest, 0, 'OFF')

Menu.SetValueName(fooAllInOne.optionItemVeil, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemHex, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemBlood, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemeBlade, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemOrchid, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemAtos, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemAbyssal, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemHalberd, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemShivas, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemUrn, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemDagon, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemManta, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemMjollnir, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemMedallion, 1, 'ON')
Menu.SetValueName(fooAllInOne.optionItemCrest, 1, 'ON')

Menu.SetValueName(fooAllInOne.optionItemStyle, 0, 'max speed, no order')
Menu.SetValueName(fooAllInOne.optionItemStyle, 1, 'ordered')
Menu.SetValueName(fooAllInOne.optionItemStyle, 2, 'smart ordered')

Menu.SetValueName(fooAllInOne.optionLastHitStyle, 0, 'last hit + deny')
Menu.SetValueName(fooAllInOne.optionLastHitStyle, 1, 'only last hit')
Menu.SetValueName(fooAllInOne.optionLastHitStyle, 2, 'only deny')
Menu.SetValueName(fooAllInOne.optionLastHitOffset, 0, '0.00s')
Menu.SetValueName(fooAllInOne.optionLastHitOffset, 1, '0.05s')
Menu.SetValueName(fooAllInOne.optionLastHitOffset, 2, '0.10s')
Menu.SetValueName(fooAllInOne.optionLastHitOffset, 3, '0.15s')
Menu.SetValueName(fooAllInOne.optionLastHitOffset, 4, '0.20s')
Menu.SetValueName(fooAllInOne.optionLastHitOffset, 5, '0.25s')
Menu.SetValueName(fooAllInOne.optionLastHitDrawStyle, 0, 'enemy+ally creeps')
Menu.SetValueName(fooAllInOne.optionLastHitDrawStyle, 1, 'enemy creeps only')


Menu.SetValueName(fooAllInOne.optionLinkensForce, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensEul, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensHalberd, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensHex, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensBlood, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensOrchid, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionLinkensPike, 0, 'OFF')

Menu.SetValueName(fooAllInOne.optionUtilityMidasXP, 0, 'melee creep')
Menu.SetValueName(fooAllInOne.optionUtilityMidasXP, 1, 'range creep')

Menu.SetValueName(fooAllInOne.optionHeroEmberUlt, 0, 'use all charges')
Menu.SetValueName(fooAllInOne.optionHeroEmberUlt, 1, 'use one charge')
Menu.SetValueName(fooAllInOne.optionHeroWindrunnerWind, 0, 'Off')
Menu.SetValueName(fooAllInOne.optionHeroTimberPanicDir, 0, 'fountain')
Menu.SetValueName(fooAllInOne.optionHeroTimberPanicDir, 1, 'furthest away')
Menu.SetValueName(fooAllInOne.optionHeroTimberPanicDir, 2, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroTimberWhirling, 0, 'Off')
Menu.SetValueName(fooAllInOne.optionHeroTimberWhirling, 1, 'only in combo')
Menu.SetValueName(fooAllInOne.optionHeroTimberWhirling, 2, 'always')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 1, '0.5 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 2, '1.0 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 3, '1.5 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 4, '2.0 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 5, '2.5 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 6, '3.0 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 7, '3.5 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 8, '4.0 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 9, '4.5 sec')
Menu.SetValueName(fooAllInOne.optionHeroTimberUltTiming, 10, '5.0 sec')

Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPStyle, 0, 'auto select lane')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPStyle, 1, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPSelect, 0, 'furthest pushed')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenPushTPSelect, 1, 'least pushed')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenTempestTarget, 0, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroArcWardenTempestTarget, 1, 'fountain')
Menu.SetValueName(fooAllInOne.optionHeroAxeJump, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroAxeJump, 1, 'blink best position')
Menu.SetValueName(fooAllInOne.optionHeroCentaurJump, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroCentaurJump, 1, 'blink best position')
Menu.SetValueName(fooAllInOne.optionHeroMagnusJump, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroMagnusJump, 1, 'blink best position')
Menu.SetValueName(fooAllInOne.optionHeroMagnusReturn, 0, 'origin')
Menu.SetValueName(fooAllInOne.optionHeroMagnusReturn, 1, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroHuskarInnerVit, 0, 'Off')
Menu.SetValueName(fooAllInOne.optionHeroHuskarInnerVit, 1, 'always in combo')
Menu.SetValueName(fooAllInOne.optionHeroHuskarInnerVit, 2, 'below hp treshold')
Menu.SetValueName(fooAllInOne.optionHeroSlardarStyle, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroSlardarStyle, 1, 'blink best position')
Menu.SetValueName(fooAllInOne.optionHeroSkyStyle, 0, 'max damage')
Menu.SetValueName(fooAllInOne.optionHeroSkyStyle, 1, 'mana saving')
Menu.SetValueName(fooAllInOne.optionHeroNecroComboScythe, 0, 'Off')
Menu.SetValueName(fooAllInOne.optionHeroNecroComboScythe, 1, 'always w/o HP check')
Menu.SetValueName(fooAllInOne.optionHeroNecroComboScythe, 2, 'only if killable')
Menu.SetValueName(fooAllInOne.optionHeroPuckJump, 0, 'blink target')
Menu.SetValueName(fooAllInOne.optionHeroPuckJump, 1, 'blink best position')
Menu.SetValueName(fooAllInOne.optionHeroPuckPanicDirection, 0, 'fountain')
Menu.SetValueName(fooAllInOne.optionHeroPuckPanicDirection, 1, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerSkillshotStyle, 0, 'prediction')
Menu.SetValueName(fooAllInOne.optionHeroInvokerSkillshotStyle, 1, 'cursor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerPanelCD, 0, 'dont show')
Menu.SetValueName(fooAllInOne.optionHeroInvokerPanelCD, 1, 'only longest')
Menu.SetValueName(fooAllInOne.optionHeroInvokerPanelCD, 2, 'all cooldowns')
Menu.SetValueName(fooAllInOne.optionLockTargetParticle, 0, 'blinding light')
Menu.SetValueName(fooAllInOne.optionLockTargetParticle, 1, 'blood bath')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 1, '0.25')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 2, '0.50')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 3, '0.75')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 4, '1.00')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 5, '1.25')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 6, '1.50')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 7, '1.75')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 8, '2.00')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 9, '2.25')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 10, '2.50')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 11, '2.75')
Menu.SetValueName(fooAllInOne.optionHeroInvokerInstanceDelay, 12, '3.00')
Menu.SetValueName(fooAllInOne.optionHeroQoPAutoUlt, 0, 'OFF')
Menu.SetValueName(fooAllInOne.optionHeroQoPAutoUlt, 1, 'only with aghanims')
Menu.SetValueName(fooAllInOne.optionHeroQoPAutoUlt, 2, 'ALWAYS')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill1, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill2, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill3, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill4, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill5, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo1Skill6, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerDynCS, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynFS, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynAL, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynIW, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynTO, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynEMP, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynSS, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynCM, 0, 'will not be invoked')
Menu.SetValueName(fooAllInOne.optionHeroInvokerDynDB, 0, 'will not be invoked')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill1, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill2, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill3, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill4, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill5, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo2Skill6, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill1, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill2, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill3, 11, 'atos')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill4, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill5, 12, 'refresher')

Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 0, 'none')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 1, 'tornado')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 2, 'emp')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 3, 'chaos_meteor')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 4, 'deafening_blast')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 5, 'sun_strike')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 6, 'ice_wall')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 7, 'cold_snap')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 8, 'forge_spirit')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 9, 'alacrity')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 10, 'euls')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 11, 'atos')
Menu.SetValueName(fooAllInOne.optionHeroInvokerCombo3Skill6, 12, 'refresher')

	-- global Variables
fooAllInOne.IconPath = "resource/flash3/images/small_boost_icons/"
fooAllInOne.font = Renderer.LoadFont("Tahoma", 22, Enum.FontWeight.EXTRABOLD)
fooAllInOne.invokerDisplayspellIconPath = "resource/flash3/images/spellicons/"
fooAllInOne.skywrathFont = Renderer.LoadFont("Tahoma", 12, Enum.FontWeight.EXTRABOLD)

fooAllInOne.LockedTarget = nil
fooAllInOne.lastCastTime = 0
fooAllInOne.lastCastTime2 = 0
fooAllInOne.lastCastTime3 = 0
fooAllInOne.lastTick = 0
fooAllInOne.delay = 0
fooAllInOne.itemDelay = 0
fooAllInOne.lastItemCast = 0
fooAllInOne.lastDefItemPop = 0
fooAllInOne.lastItemTick = 0
fooAllInOne.ItemCastStop = false
fooAllInOne.ControlledUnitCastTime = 0
fooAllInOne.ControlledUnitPauseTime = 0
fooAllInOne.lastAttackTime = 0
fooAllInOne.lastAttackTime2 = 0
fooAllInOne.LastTarget = nil
fooAllInOne.LastTickManta1 = 0
fooAllInOne.LastTickManta2 = 0
fooAllInOne.ArcWardenEntity = nil
fooAllInOne.GenericUpValue = false
fooAllInOne.lastPosition = Vector(0, 0, 0)
fooAllInOne.PuckOrbCastTime = 0
fooAllInOne.Toggler = false
fooAllInOne.TogglerTime = 0
fooAllInOne.PreInvoke = false
fooAllInOne.InvokerComboSelector = 0
fooAllInOne.InvokerLastCastedSkill = nil
fooAllInOne.InvokerLastCastedSkillTime = 0
fooAllInOne.InvokerLastChangedInstance = 0
fooAllInOne.InvokerCaptureManualInstances = 0
fooAllInOne.getInvokerGhostWalkKey = nil
fooAllInOne.invokerChannellingKillstealTimer = 0
fooAllInOne.invokerCaptureGhostwalkActivation = 0
fooAllInOne.invokerDisplayNeedsInit = true
fooAllInOne.invokerPanelNeedsInit = true
fooAllInOne.getInvokerSettings = nil
fooAllInOne.AttackProjectileCreate = 0
fooAllInOne.AttackAnimationCreate = 0
fooAllInOne.AttackParticleCreate = 0
fooAllInOne.InAttackBackswing = false
fooAllInOne.OrbwalkerDelay = 0
fooAllInOne.TPParticleIndex = nil
fooAllInOne.TPParticleTime = 0
fooAllInOne.TPParticleUnit = nil
fooAllInOne.TPParticlePosition = Vector()
fooAllInOne.GlimpseParticleIndex = nil
fooAllInOne.GlimpseParticleTime = 0
fooAllInOne.GlimpseParticleUnit = nil
fooAllInOne.GlimpseParticlePosition = Vector()
fooAllInOne.GlimpseParticleIndexStart = nil
fooAllInOne.GlimpseParticlePositionStart = Vector()
fooAllInOne.particleNextTime = 0
fooAllInOne.currentParticle = nil
fooAllInOne.skywrathDMGwithoutUlt = 0
fooAllInOne.skywrathDMGwithUlt = 0
fooAllInOne.skywrathComboSelect = false
fooAllInOne.clockwerkHookUpValue = false
fooAllInOne.enemyCanBeShackled = false
fooAllInOne.dodgeTiming = 0
fooAllInOne.VisageInstStunLockTarget = nil
fooAllInOne.VisagePanicTarget = nil
fooAllInOne.morphlingComboSelect = false
fooAllInOne.morphlingTotalDMG = 0
fooAllInOne.morphlingTotalDMGwoWave = 0
fooAllInOne.MorphBalaceTimer = 0
fooAllInOne.MorphBalanceSelectedHP = 0
fooAllInOne.MorphBalanceSelected = 0
fooAllInOne.MorphAutoReplicateControl = false
fooAllInOne.wardCaptureTiming = 0
fooAllInOne.sentryImageHandle = nil
fooAllInOne.obsImageHandle = nil
fooAllInOne.wardDrawingRemove = 0
fooAllInOne.necroDMGwithoutUlt = 0
fooAllInOne.necroDMGwithUlt = 0
fooAllInOne.necroComboSelect = false
fooAllInOne.magnusLastPos = Vector()
fooAllInOne.SFcurrentParticle1 = 0
fooAllInOne.SFcurrentParticle2 = 0
fooAllInOne.SFcurrentParticle3 = 0
fooAllInOne.lastHitterDelay = 0
fooAllInOne.lastHitterManualTarget = nil
fooAllInOne.lastHitcurrentParticle = 0
fooAllInOne.lastHitterKillableImage = nil

	-- global Tables
fooAllInOne.LinkensBreakerItemOrder = {}
fooAllInOne.ItemCastOrder = {}
fooAllInOne.rotationTable = {}
fooAllInOne.PuckOrbHitSim = {}
fooAllInOne.enemyHeroTable = {}
fooAllInOne.InvokerKSparticleProcess = {{nil, nil, 0, nil, Vector()}}
fooAllInOne.PreInvokeSkills = {}
fooAllInOne.preemptiveBKB = {}
fooAllInOne.invokerCachedIcons = {}
fooAllInOne.dodgeItTable = {}
fooAllInOne.dodgeItReadyTable = {}
fooAllInOne.dodgeItSkillReady = {}
fooAllInOne.wardDispenserCount = {}
fooAllInOne.wardProcessingTable = {}
fooAllInOne.lastHitterTimingMap = {}
fooAllInOne.lastHitterPredictedDieTime = {}

fooAllInOne.dodgeItItems = { 
	{"item_manta", 1, "no target", 0.1}, 
	{"item_blink", 0, "position", 0.1}, 
	{"item_cyclone", 0, "target", 0.1},
	{"item_lotus_orb", 1, "target", 0.1},
	{"item_black_king_bar", 2, "no target", 0.1},
	{"item_blade_mail", 0, "no target", 0.1},
	{"item_glimmer_cape", 0, "target", 0.7}
		}

fooAllInOne.dodgeItSkills = {
	{"storm_spirit_ball_lightning", 0, "position", 0.4},
	{"puck_phase_shift", 0, "no target", 0.1},
	{"phantom_lancer_doppelwalk", 0, "position", 0.2},
	{"juggernaut_blade_fury", 2, "no target", 0.1},
	{"omniknight_repel", 2, "no target", 0.45},
	{"nyx_assassin_spiked_carapace", 0, "no target", 0.1},
	{"slark_dark_pact", 0, "no target", 0.1},
	{"morphling_waveform", 0, "position", 0.4},
	{"shadow_demon_disruption", 0, "target", 0.4},
	{"obsidian_destroyer_astral_imprisonment", 0, "target", 0.35},
	{"abaddon_aphotic_shield", 1, "target", 0.5},
	{"life_stealer_rage", 2, "no target", 0.1},
	{"sandking_sand_storm", 1, "no target", 0.1},
	{"faceless_void_time_walk", 0, "position", 0.4},
	{"ember_spirit_sleight_of_fist", 1, "position", 0.1},
	{"templar_assassin_refraction", 1, "no target", 0.1},
	{"templar_assassin_meld", 1, "no target", 0.1},
	{"riki_tricks_of_the_trade", 0, "no target", 0.35}
		}

fooAllInOne.preemptiveBKBtable = {
	"alchemist_unstable_concoction_throw",
	"beastmaster_primal_roar",
	"centaur_hoof_stomp",
	"chaos_knight_chaos_bolt",
	"crystal_maiden_frostbite",
	"death_prophet_silence",
	"dragon_knight_dragon_tail",
	"drow_ranger_wave_of_silence",
	"earth_spirit_boulder_smash",
	"earthshaker_fissure",
	"ember_spirit_searing_chains",
	"invoker_tornado",
	"jakiro_ice_path",
	"lion_impale",
	"lion_voodoo",
	"naga_siren_ensnare",
	"nyx_assassin_impale",
	"puck_dream_coil",
	"rubick_telekinesis",
	"sandking_burrowstrike",
	"shadow_shaman_shackles",
	"shadow_shaman_voodoo",
	"skeleton_king_hellfire_blast",
	"slardar_slithereen_crush",
	"storm_spirit_electric_vortex",
	"sven_storm_bolt",
	"tidehunter_ravage",
	"tiny_avalanche",
	"vengefulspirit_magic_missile",
	"warlock_rain_of_chaos",
	"windrunner_shackleshot",
	"slark_pounce",
	"ogre_magi_fireblast",
	"meepo_poof" }

fooAllInOne.dodgeEnemySkillsTable = {
	"antimage_mana_void",
	"alchemist_unstable_concoction_throw",
	"axe_berserkers_call",
	"bane_fiends_grip",
	"batrider_flaming_lasso",
	"bloodseeker_rupture",
	"centaur_hoof_stomp",
	"chaos_knight_chaos_bolt",
	"crystal_maiden_frostbite",
	"death_prophet_silence",
	"doom_bringer_doom",
	"drow_ranger_wave_of_silence",
	"earthshaker_fissure",
	"earthshaker_enchant_totem",
	"enigma_black_hole",
	"faceless_void_chronosphere",
	"juggernaut_omni_slash",
	"legion_commander_duel",
	"lich_chain_frost",
	"lina_laguna_blade",
	"lion_impale",
	"lion_finger_of_death",
	"luna_lucent_beam",
	"magnataur_reverse_polarity",
	"necrolyte_reapers_scythe",
	"night_stalker_crippling_fear",
	"nyx_assassin_impale",
	"ogre_magi_fireblast",
	"obsidian_destroyer_astral_imprisonment",
	"obsidian_destroyer_sanity_eclipse",
	"puck_waning_rift",
	"pudge_dismember",
	"queenofpain_sonic_wave",
	"rubick_telekinesis",
	"sandking_burrowstrike",
	"shadow_demon_disruption",
	"shadow_shaman_shackles",
	"silencer_global_silence",
	"skywrath_mage_ancient_seal",
	"slardar_slithereen_crush",
	"sniper_assassinate",
	"storm_spirit_electric_vortex",
	"sven_storm_bolt",
	"terrorblade_sunder",
	"tidehunter_ravage",
	"tinker_laser",
	"vengefulspirit_magic_missile",
	"warlock_rain_of_chaos",
	"windrunner_shackleshot",
	"skeleton_king_hellfire_blast",
	"zuus_lightning_bolt",
	"zuus_thundergods_wrath"
		}

fooAllInOne.invokerInvokeOrder = {
	invoker_sun_strike = { 2, 2, 2 },
	invoker_emp = { 1, 1, 1 },
	invoker_tornado = { 0, 1, 1 },
	invoker_alacrity = { 1, 1, 2 },
	invoker_ghost_walk = { 0, 0, 1 },
	invoker_deafening_blast = { 0, 1, 2 },
	invoker_chaos_meteor = { 1, 2, 2 },
	invoker_cold_snap = { 0, 0, 0 },
	invoker_ice_wall = { 0, 0, 2 },
	invoker_forge_spirit = { 0, 2, 2 } }

fooAllInOne.invokerTornadoLiftDuration = { 0.8, 1.1, 1.4, 1.7, 2.0, 2.3, 2.6, 2.9 }

fooAllInOne.orbAttackTable = {
	npc_dota_hero_clinkz = "clinkz_searing_arrows",
	npc_dota_hero_drow_ranger = "drow_ranger_frost_arrows",
	npc_dota_hero_enchantress = "enchantress_impetus",
	npc_dota_hero_huskar = "huskar_burning_spear",
	npc_dota_hero_obsidian_destroyer = "obsidian_destroyer_arcane_orb",
	npc_dota_hero_silencer = "silencer_glaives_of_wisdom",
	npc_dota_hero_viper = "viper_poison_attack"
			}

fooAllInOne.attackPointTable = {
	npc_dota_hero_abaddon = { 0.56, 0.41, 0 },
	npc_dota_hero_alchemist = { 0.35, 0.65, 0 },
	npc_dota_hero_antimage = { 0.45, 0.3, 1250 },
	npc_dota_hero_ancient_apparition = { 0.3, 0.6, 0 },
	npc_dota_hero_arc_warden = { 0.3, 0.7, 800 },
	npc_dota_hero_axe = { 0.5, 0.5, 0 },
	npc_dota_hero_bane = { 0.3, 0.7, 900 },
	npc_dota_hero_batrider = { 0.3, 0.54, 900 },
	npc_dota_hero_beastmaster = { 0.3, 0.7, 0 },
	npc_dota_hero_bloodseeker = { 0.43, 0.74, 0 },
	npc_dota_hero_bounty_hunter = { 0.59, 0.59, 0 },
	npc_dota_hero_brewmaster = { 0.35, 0.65, 0 },
	npc_dota_hero_bristleback = { 0.3, 0.3, 0 },
	npc_dota_hero_broodmother = { 0.4, 0.5, 0 },
	npc_dota_hero_centaur = { 0.3, 0.3, 0 },
	npc_dota_hero_chaos_knight = { 0.5, 0.5, 0 },
	npc_dota_hero_chen = { 0.5, 0.5, 1100 },
	npc_dota_hero_clinkz = { 0.7, 0.3, 900 },
	npc_dota_hero_rattletrap = { 0.33, 0.64, 0 },
	npc_dota_hero_crystal_maiden = { 0.55, 0, 900 },
	npc_dota_hero_dark_seer = { 0.59, 0.58, 0 },
	npc_dota_hero_dazzle = { 0.3, 0.3, 1200 },
	npc_dota_hero_death_prophet = { 0.56, 0.51, 1000 },
	npc_dota_hero_disruptor = { 0.4, 0.5, 1200 },
	npc_dota_hero_doom_bringer = { 0.5, 0.7, 0 },
	npc_dota_hero_dragon_knight = { 0.5, 0.5, 0 },
	npc_dota_hero_drow_ranger = { 0.7, 0.3, 1250 },
	npc_dota_hero_earth_spirit = { 0.35, 0.65, 0 },
	npc_dota_hero_earthshaker = { 0.467, 0.863, 0 },
	npc_dota_hero_elder_titan = { 0.35, 0.97, 0 },
	npc_dota_hero_ember_spirit = { 0.4, 0.3, 0 },
	npc_dota_hero_enchantress = { 0.3, 0.7, 900 },
	npc_dota_hero_enigma = { 0.4, 0.77, 900 },
	npc_dota_hero_faceless_void = { 0.5, 0.56, 0 },
	npc_dota_hero_gyrocopter = { 0.2, 0.97, 3000 },
	npc_dota_hero_huskar = { 0.4, 0.5, 1400 },
	npc_dota_hero_invoker = { 0.4, 0.7, 900 },
	npc_dota_hero_wisp = { 0.15, 0.4, 1200 },
	npc_dota_hero_jakiro = { 0.4, 0.5, 1100 },
	npc_dota_hero_juggernaut = { 0.33, 0.84, 0 },
	npc_dota_hero_keeper_of_the_light = { 0.3, 0.85, 900 },
	npc_dota_hero_kunkka = { 0.4, 0.3, 0 },
	npc_dota_hero_legion_commander = { 0.46, 0.64, 0 },
	npc_dota_hero_leshrac = { 0.4, 0.77, 900 },
	npc_dota_hero_lich = { 0.46, 0.54, 900 },
	npc_dota_hero_life_stealer = { 0.39, 0.44, 0 },
	npc_dota_hero_lina = { 0.75, 0.78, 1000 },
	npc_dota_hero_lion = { 0.43, 0.74, 1000 },
	npc_dota_hero_lone_druid = { 0.33, 0.53, 900 },
	npc_dota_hero_luna = { 0.46, 0.54, 900 },
	npc_dota_hero_lycan = { 0.55, 0.55, 0 },
	npc_dota_hero_magnataur = { 0.5, 0.84, 0 },
	npc_dota_hero_medusa = { 0.5, 0.6, 1200 },
	npc_dota_hero_meepo = { 0.38, 0.6, 0 },
	npc_dota_hero_mirana = { 0.3, 0.7, 900 },
	npc_dota_hero_morphling = { 0.45, 0.2, 0 },
	npc_dota_hero_monkey_king = { 0.5, 0.5, 1300 },
	npc_dota_hero_naga_siren = { 0.5, 0.5, 0 },
	npc_dota_hero_furion = { 0.4, 0.77, 1125 },
	npc_dota_hero_necrolyte = { 0.53, 0.47, 900 },
	npc_dota_hero_night_stalker = { 0.55, 0.55, 0 },
	npc_dota_hero_nyx_assassin = { 0.46, 0.54, 0 },
	npc_dota_hero_ogre_magi = { 0.3, 0.3, 0 },
	npc_dota_hero_omniknight = { 0.433, 0.567, 0 },
	npc_dota_hero_oracle = { 0.3, 0.7, 900 },
	npc_dota_hero_obsidian_destroyer = { 0.46, 0.54, 900 },
	npc_dota_hero_phantom_assassin = { 0.3, 0.7, 0 },
	npc_dota_hero_phantom_lancer = { 0.5, 0.5, 0 },
	npc_dota_hero_phoenix = { 0.35, 0.633, 1100 },
	npc_dota_hero_puck = { 0.5, 0.8, 900 },
	npc_dota_hero_pudge = { 0.5, 1.17, 0 },
	npc_dota_hero_pugna = { 0.5, 0.5, 900 },
	npc_dota_hero_queenofpain = { 0.56, 0.41, 1500 },
	npc_dota_hero_razor = { 0.3, 0.7, 2000 },
	npc_dota_hero_riki = { 0.3, 0.3, 0 },
	npc_dota_hero_rubick = { 0.4, 0.77, 1125 },
	npc_dota_hero_sand_king = { 0.53, 0.47, 0 },
	npc_dota_hero_shadow_demon = { 0.35, 0.5, 900 },
	npc_dota_hero_nevermore = { 0.5, 0.54, 1200 },
	npc_dota_hero_shadow_shaman = { 0.3, 0.5, 900 },
	npc_dota_hero_silencer = { 0.5, 0.5, 1000 },
	npc_dota_hero_skywrath_mage = { 0.4, 0.78, 1000 },
	npc_dota_hero_slardar = { 0.36, 0.64, 0 },
	npc_dota_hero_slark = { 0.5, 0.3, 0 },
	npc_dota_hero_sniper = { 0.17, 0.7, 3000 },
	npc_dota_hero_spectre = { 0.3, 0.7, 0 },
	npc_dota_hero_spirit_breaker = { 0.6, 0.3, 0 },
	npc_dota_hero_storm_spirit = { 0.5, 0.3, 1100 },
	npc_dota_hero_sven = { 0.4, 0.3, 0 },
	npc_dota_hero_techies = { 0.5, 0.5, 900 },
	npc_dota_hero_templar_assassin = { 0.3, 0.5, 900 },
	npc_dota_hero_terrorblade = { 0.3, 0.6, 0 },
	npc_dota_hero_tidehunter = { 0.6, 0.56, 0 },
	npc_dota_hero_shredder = { 0.36, 0.64, 0 },
	npc_dota_hero_tinker = { 0.35, 0.65, 900 },
	npc_dota_hero_tiny = { 0.49, 1, 0 },
	npc_dota_hero_treant = { 0.6, 0.4, 0 },
	npc_dota_hero_troll_warlord = { 0.3, 0.3, 1200 },
	npc_dota_hero_tusk = { 0.36, 0.64, 0 },
	npc_dota_hero_abyssal_underlord = { 0.45, 0.7, 0 },
	npc_dota_hero_undying = { 0.3, 0.3, 0 },
	npc_dota_hero_ursa = { 0.3, 0.3, 0 },
	npc_dota_hero_vengefulspirit = { 0.33, 0.64, 1500 },
	npc_dota_hero_venomancer = { 0.3, 0.7, 900 },
	npc_dota_hero_viper = { 0.33, 1, 1200 },
	npc_dota_hero_visage = { 0.46, 0.54, 900 },
	npc_dota_hero_warlock = { 0.3, 0.3, 1200 },
	npc_dota_hero_weaver = { 0.64, 0.36, 900 },
	npc_dota_hero_windrunner = { 0.4, 0.3, 1250 },
	npc_dota_hero_winter_wyvern = { 0.25, 0.8, 700 },
	npc_dota_hero_witch_doctor = { 0.4, 0.5, 1200 },
	npc_dota_hero_skeleton_king = { 0.56, 0.44, 0 },
	npc_dota_hero_zuus = { 0.633, 0.366, 1100 } }

fooAllInOne.AbilityList = {
	{ "npc_dota_hero_abaddon", "abaddon_death_coil", "nuke", "target" , "target_damage" },
	{ "npc_dota_hero_abaddon", "abaddon_frostmourne", "utility", "0" , "0" },
	{ "npc_dota_hero_abaddon", "abaddon_aphotic_shield", "utility", "0" , "0" },
	{ "npc_dota_hero_abaddon", "abaddon_borrowed_time", "utility", "0" , "0" },
	{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_pit_of_malice", "disable", "position" , "0" },
	{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_firestorm", "nuke", "position" , "0" },
	{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_atrophy_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_abyssal_underlord", "abyssal_underlord_dark_rift", "utility", "0" , "0" },
	{ "npc_dota_hero_alchemist", "alchemist_unstable_concoction", "disable", "target" , "0" },
	{ "npc_dota_hero_alchemist", "alchemist_unstable_concoction_throw", "disable", "target" , "0" },
	{ "npc_dota_hero_alchemist", "alchemist_acid_spray", "utility", "0" , "0" },
	{ "npc_dota_hero_alchemist", "alchemist_chemical_rage", "utility", "0" , "0" },
	{ "npc_dota_hero_alchemist", "alchemist_goblins_greed", "utility", "0" , "0" },
	{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_blast", "nuke", "position" , "0" },
	{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_blast_release", "nuke", "position" , "0" },
	{ "npc_dota_hero_ancient_apparition", "ancient_apparition_chilling_touch", "utility", "0" , "0" },
	{ "npc_dota_hero_ancient_apparition", "ancient_apparition_cold_feet", "utility", "0" , "0" },
	{ "npc_dota_hero_ancient_apparition", "ancient_apparition_ice_vortex", "utility", "0" , "0" },
	{ "npc_dota_hero_antimage", "antimage_mana_void"    , "nuke", "target" , "0" },
	{ "npc_dota_hero_antimage", "antimage_blink", "utility", "0" , "0" },
	{ "npc_dota_hero_antimage", "antimage_mana_break", "utility", "0" , "0" },
	{ "npc_dota_hero_antimage", "antimage_spell_shield", "utility", "0" , "0" },
	{ "npc_dota_hero_arcwarden", "arc_warden_flux", "utility", "0" , "0" },
	{ "npc_dota_hero_arcwarden", "arc_warden_magnetic_field", "utility", "0" , "0" },
	{ "npc_dota_hero_arcwarden", "arc_warden_spark_wraith", "utility", "0" , "0" },
	{ "npc_dota_hero_arcwarden", "arc_warden_tempest_double", "utility", "0" , "0" },
	{ "npc_dota_hero_axe", "axe_berserkers_call", "disable", "no target" , "0" },
	{ "npc_dota_hero_axe", "axe_culling_blade", "nuke", "target" , "0" },
	{ "npc_dota_hero_axe", "axe_battle_hunger", "utility", "0" , "0" },
	{ "npc_dota_hero_axe", "axe_counter_helix", "utility", "0" , "0" },
	{ "npc_dota_hero_bane", "bane_brain_sap", "pure", "target" , "brain_sap_damage" },
	{ "npc_dota_hero_bane", "bane_fiends_grip", "nuke", "target" , "0" },
	{ "npc_dota_hero_bane", "bane_enfeeble", "utility", "0" , "0" },
	{ "npc_dota_hero_bane", "bane_nightmare", "utility", "0" , "0" },
	{ "npc_dota_hero_bane", "bane_nightmare_end", "utility", "0" , "0" },
	{ "npc_dota_hero_batrider", "batrider_firefly", "utility", "0" , "0" },
	{ "npc_dota_hero_batrider", "batrider_flamebreak", "utility", "0" , "0" },
	{ "npc_dota_hero_batrider", "batrider_flaming_lasso", "utility", "0" , "0" },
	{ "npc_dota_hero_batrider", "batrider_sticky_napalm", "utility", "0" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_wild_axes", "nuke", "position" , "axe_damage" },
	{ "npc_dota_hero_beastmaster", "beastmaster_primal_roar", "disable", "no target" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_boar_poison", "utility", "0" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_call_of_the_wild", "utility", "0" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_call_of_the_wild_boar", "utility", "0" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_greater_boar_poison", "utility", "0" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_hawk_invisibility", "utility", "0" , "0" },
	{ "npc_dota_hero_beastmaster", "beastmaster_inner_beast", "utility", "0" , "0" },
	{ "npc_dota_hero_bloodseeker", "bloodseeker_blood_bath", "nuke", "position" , "damage" },
	{ "npc_dota_hero_bloodseeker", "bloodseeker_rupture", "utility", "0" , "0" },
	{ "npc_dota_hero_bloodseeker", "bloodseeker_thirst", "utility", "0" , "0" },
	{ "npc_dota_hero_bounty_hunter", "bounty_hunter_shuriken_toss", "nuke", "target" , "bonus_damage" },
	{ "npc_dota_hero_bounty_hunter", "bounty_hunter_jinada", "utility", "0" , "0" },
	{ "npc_dota_hero_bounty_hunter", "bounty_hunter_track", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_thunder_clap", "nuke", "no target" , "damage" },
	{ "npc_dota_hero_brewmaster", "brewmaster_earth_hurl_boulder", "disable", "target" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_drunken_brawler", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_drunken_haze", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_earth_pulverize", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_earth_spell_immunity", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_fire_permanent_immolation", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_primal_split", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_storm_cyclone", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_storm_dispel_magic", "utility", "0" , "0" },
	{ "npc_dota_hero_brewmaster", "brewmaster_storm_wind_walk", "utility", "0" , "0" },
	{ "npc_dota_hero_bristleback", "bristleback_quill_spray", "nuke", "no target" , "quill_base_damage" },
	{ "npc_dota_hero_bristleback", "bristleback_bristleback", "utility", "0" , "0" },
	{ "npc_dota_hero_bristleback", "bristleback_viscous_nasal_goo", "utility", "0" , "0" },
	{ "npc_dota_hero_bristleback", "bristleback_warpath", "utility", "0" , "0" },
	{ "npc_dota_hero_broodmother", "broodmother_spawn_spiderlings", "nuke", "target" , "damage" },
	{ "npc_dota_hero_broodmother", "broodmother_incapacitating_bite", "utility", "0" , "0" },
	{ "npc_dota_hero_broodmother", "broodmother_insatiable_hunger", "utility", "0" , "0" },
	{ "npc_dota_hero_broodmother", "broodmother_poison_sting", "utility", "0" , "0" },
	{ "npc_dota_hero_broodmother", "broodmother_spawn_spiderite", "utility", "0" , "0" },
	{ "npc_dota_hero_broodmother", "broodmother_spin_web", "utility", "0" , "0" },
	{ "npc_dota_hero_broodmother", "broodmother_spin_web_destroy"  , "utility", "0" , "0" },
	{ "npc_dota_hero_centaur", "centaur_double_edge", "nuke", "no target" , "edge_damage" },
	{ "npc_dota_hero_centaur", "centaur_hoof_stomp", "disable", "no target" , "0" },
	{ "npc_dota_hero_centaur", "centaur_return", "utility", "0" , "0" },
	{ "npc_dota_hero_centaur", "centaur_stampede", "utility", "0" , "0" },
	{ "npc_dota_hero_chaos_knight", "chaos_knight_chaos_bolt", "disable", "target" , "0" },
	{ "npc_dota_hero_chaos_knight", "chaos_knight_chaos_strike", "utility", "0" , "0" },
	{ "npc_dota_hero_chaos_knight", "chaos_knight_phantasm", "utility", "0" , "0" },
	{ "npc_dota_hero_chaos_knight", "chaos_knight_reality_rift", "utility", "0" , "0" },
	{ "npc_dota_hero_chen", "chen_test_of_faith", "pure", "target" , "damage_min" },
	{ "npc_dota_hero_chen", "chen_hand_of_god", "utility", "0" , "0" },
	{ "npc_dota_hero_chen", "chen_holy_persuasion", "utility", "0" , "0" },
	{ "npc_dota_hero_chen", "chen_penitence", "utility", "0" , "0" },
	{ "npc_dota_hero_chen", "chen_test_of_faith_teleport", "utility", "0" , "0" },
	{ "npc_dota_hero_clinkz", "clinkz_death_pact", "utility", "0" , "0" },
	{ "npc_dota_hero_clinkz", "clinkz_searing_arrows", "utility", "0" , "0" },
	{ "npc_dota_hero_clinkz", "clinkz_strafe", "utility", "0" , "0" },
	{ "npc_dota_hero_clinkz", "clinkz_wind_walk", "utility", "0" , "0" },
	{ "npc_dota_hero_crystal_maiden", "crystal_maiden_crystal_nova", "nuke", "position" , "nova_damage" },
	{ "npc_dota_hero_crystal_maiden", "crystal_maiden_frostbite", "disable", "target" , "0" },
	{ "npc_dota_hero_crystal_maiden", "crystal_maiden_freezing_field", "nuke", "no target" , "0" },
	{ "npc_dota_hero_crystal_maiden", "crystal_maiden_brilliance_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_dark_seer", "dark_seer_ion_shell", "utility", "0" , "0" },
	{ "npc_dota_hero_dark_seer", "dark_seer_surge", "utility", "0" , "0" },
	{ "npc_dota_hero_dark_seer", "dark_seer_vacuum", "utility", "0" , "0" },
	{ "npc_dota_hero_dark_seer", "dark_seer_wall_of_replica", "utility", "0" , "0" },
	{ "npc_dota_hero_dazzle", "dazzle_poison_touch", "nuke", "target" , "0" },
	{ "npc_dota_hero_dazzle", "dazzle_shadow_wave", "utility", "0" , "0" },
	{ "npc_dota_hero_dazzle", "dazzle_shallow_grave", "utility", "0" , "0" },
	{ "npc_dota_hero_dazzle", "dazzle_weave", "utility", "0" , "0" },
	{ "npc_dota_hero_death_prophet", "death_prophet_silence", "disable", "position" , "0" },
	{ "npc_dota_hero_death_prophet", "death_prophet_carrion_swarm", "nuke", "position" , "0" },
	{ "npc_dota_hero_death_prophet", "death_prophet_exorcism", "utility", "0" , "0" },
	{ "npc_dota_hero_death_prophet", "death_prophet_spirit_siphon", "utility", "0" , "0" },
	{ "npc_dota_hero_death_prophet", "death_prophet_witchcraft", "utility", "0" , "0" },
	{ "npc_dota_hero_disruptor", "disruptor_thunder_strike", "nuke", "target" , "0" },
	{ "npc_dota_hero_disruptor", "disruptor_glimpse", "utility", "0" , "0" },
	{ "npc_dota_hero_disruptor", "disruptor_kinetic_field", "utility", "0" , "0" },
	{ "npc_dota_hero_disruptor", "disruptor_static_storm", "utility", "0" , "0" },
	{ "npc_dota_hero_doom_bringer", "doom_bringer_devour", "utility", "0" , "0" },
	{ "npc_dota_hero_doom_bringer", "doom_bringer_doom", "utility", "0" , "0" },
	{ "npc_dota_hero_doom_bringer", "doom_bringer_empty1", "utility", "0" , "0" },
	{ "npc_dota_hero_doom_bringer", "doom_bringer_empty2", "utility", "0" , "0" },
	{ "npc_dota_hero_doom_bringer", "doom_bringer_infernal_blade", "utility", "0" , "0" },
	{ "npc_dota_hero_doom_bringer", "doom_bringer_scorched_earth", "utility", "0" , "0" },
	{ "npc_dota_hero_dragon_knight", "dragon_knight_dragon_tail", "disable", "target" , "0" },
	{ "npc_dota_hero_dragon_knight", "dragon_knight_breathe_fire", "nuke", "position" , "0" },
	{ "npc_dota_hero_dragon_knight", "dragon_knight_dragon_blood", "utility", "0" , "0" },
	{ "npc_dota_hero_dragon_knight", "dragon_knight_elder_dragon_form", "utility", "0" , "0" },
	{ "npc_dota_hero_dragon_knight", "dragon_knight_frost_breath", "utility", "0" , "0" },
	{ "npc_dota_hero_drow_ranger", "drow_ranger_silence", "disable", "position" , "0" },
	{ "npc_dota_hero_drow_ranger", "drow_ranger_wave_of_silence", "disable", "position" , "0" },
	{ "npc_dota_hero_drow_ranger", "drow_ranger_frost_arrows", "utility", "0" , "0" },
	{ "npc_dota_hero_drow_ranger", "drow_ranger_marksmanship", "utility", "0" , "0" },
	{ "npc_dota_hero_drow_ranger", "drow_ranger_trueshot", "utility", "0" , "0" },
	{ "npc_dota_hero_earth_spirit", "earth_spirit_boulder_smash", "disable", "position" , "0" },
	{ "npc_dota_hero_earth_spirit", "earth_spirit_geomagnetic_grip", "disable", "position" , "0" },
	{ "npc_dota_hero_earth_spirit", "earth_spirit_magnetize", "utility", "0" , "0" },
	{ "npc_dota_hero_earth_spirit", "earth_spirit_petrify", "utility", "0" , "0" },
	{ "npc_dota_hero_earth_spirit", "earth_spirit_rolling_boulder", "utility", "0" , "0" },
	{ "npc_dota_hero_earth_spirit", "earth_spirit_stone_caller", "utility", "0" , "0" },
	{ "npc_dota_hero_earthshaker", "earthshaker_aftershock", "disable", "no target" , "0" },
	{ "npc_dota_hero_earthshaker", "earthshaker_fissure", "disable", "position" , "0" },
	{ "npc_dota_hero_earthshaker", "earthshaker_echo_slam", "nuke", "no target" , "0" },
	{ "npc_dota_hero_earthshaker", "earthshaker_enchant_totem", "utility", "0" , "0" },
	{ "npc_dota_hero_elder_titan", "elder_titan_ancestral_spirit", "nuke", "position" , "pass_damage" },
	{ "npc_dota_hero_elder_titan", "elder_titan_echo_stomp_spirit", "disable", "no target" , "0" },
	{ "npc_dota_hero_elder_titan", "elder_titan_earth_splitter", "nuke", "position" , "0" },
	{ "npc_dota_hero_elder_titan", "elder_titan_natural_order", "utility", "0" , "0" },
	{ "npc_dota_hero_elder_titan", "elder_titan_echo_stomp", "utility", "0" , "0" },
	{ "npc_dota_hero_elder_titan", "elder_titan_natural_order_spirit", "utility", "0" , "0" },
	{ "npc_dota_hero_elder_titan", "elder_titan_return_spirit", "utility", "0" , "0" },
	{ "npc_dota_hero_ember_spirit", "ember_spirit_searing_chains", "disable", "no target" , "0" },
	{ "npc_dota_hero_ember_spirit", "ember_spirit_activate_fire_remnant", "utility", "0" , "0" },
	{ "npc_dota_hero_ember_spirit", "ember_spirit_fire_remnant", "utility", "0" , "0" },
	{ "npc_dota_hero_ember_spirit", "ember_spirit_flame_guard", "utility", "0" , "0" },
	{ "npc_dota_hero_ember_spirit", "ember_spirit_sleight_of_fist", "utility", "0" , "0" },
	{ "npc_dota_hero_enchantress", "enchantress_impetus", "nuke", "target" , "0" },
	{ "npc_dota_hero_enchantress", "enchantress_enchant", "utility", "0" , "0" },
	{ "npc_dota_hero_enchantress", "enchantress_natures_attendants", "utility", "0" , "0" },
	{ "npc_dota_hero_enchantress", "enchantress_untouchable", "utility", "0" , "0" },
	{ "npc_dota_hero_enigma", "enigma_black_hole", "disable", "position" , "0" },
	{ "npc_dota_hero_enigma", "enigma_demonic_conversion", "utility", "0" , "0" },
	{ "npc_dota_hero_enigma", "enigma_malefice", "utility", "0" , "0" },
	{ "npc_dota_hero_enigma", "enigma_midnight_pulse", "utility", "0" , "0" },
	{ "npc_dota_hero_faceless_void", "faceless_void_chronosphere", "disable", "position" , "0" },
	{ "npc_dota_hero_faceless_void", "faceless_void_backtrack", "utility", "0" , "0" },
	{ "npc_dota_hero_faceless_void", "faceless_void_time_dilation", "utility", "0" , "0" },
	{ "npc_dota_hero_faceless_void", "faceless_void_time_lock", "utility", "0" , "0" },
	{ "npc_dota_hero_faceless_void", "faceless_void_time_walk", "utility", "0" , "0" },
	{ "npc_dota_hero_furion", "furion_force_of_nature", "utility", "0" , "0" },
	{ "npc_dota_hero_furion", "furion_sprout", "utility", "0" , "0" },
	{ "npc_dota_hero_furion", "furion_teleportation", "utility", "0" , "0" },
	{ "npc_dota_hero_furion", "furion_wrath_of_nature", "utility", "0" , "0" },
	{ "npc_dota_hero_gyrocopter", "gyrocopter_call_down", "nuke", "position" , "damage_first" },
	{ "npc_dota_hero_gyrocopter", "gyrocopter_homing_missile", "disable", "target" , "0" },
	{ "npc_dota_hero_gyrocopter", "gyrocopter_rocket_barrage", "nuke", "no target" , "0" },
	{ "npc_dota_hero_gyrocopter", "gyrocopter_flak_cannon", "utility", "0" , "0" },
	{ "npc_dota_hero_huskar", "huskar_berserkers_blood", "utility", "0" , "0" },
	{ "npc_dota_hero_huskar", "huskar_burning_spear", "utility", "0" , "0" },
	{ "npc_dota_hero_huskar", "huskar_inner_vitality", "utility", "0" , "0" },
	{ "npc_dota_hero_huskar", "huskar_life_break", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_cold_snap", "disable", "no target" , "0" },
	{ "npc_dota_hero_invoker", "invoker_tornado", "disable", "position" , "0" },
	{ "npc_dota_hero_invoker", "invoker_alacrity", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_attribute_bonus", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_chaos_meteor", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_deafening_blast", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_emp", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_empty1", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_empty2", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_exort", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_forge_spirit", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_ghost_walk", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_ice_wall", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_invoke", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_quas", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_sun_strike", "utility", "0" , "0" },
	{ "npc_dota_hero_invoker", "invoker_wex", "utility", "0" , "0" },
	{ "npc_dota_hero_jakiro", "jakiro_ice_path", "disable", "position" , "0" },
	{ "npc_dota_hero_jakiro", "jakiro_macropyre", "nuke", "position" , "0" },
	{ "npc_dota_hero_jakiro", "jakiro_dual_breath", "utility", "0" , "0" },
	{ "npc_dota_hero_jakiro", "jakiro_liquid_fire", "utility", "0" , "0" },
	{ "npc_dota_hero_juggernaut", "juggernaut_omni_slash", "nuke", "target" , "0" },
	{ "npc_dota_hero_juggernaut", "juggernaut_blade_dance", "utility", "0" , "0" },
	{ "npc_dota_hero_juggernaut", "juggernaut_blade_fury", "utility", "0" , "0" },
	{ "npc_dota_hero_juggernaut", "juggernaut_healing_ward", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_blinding_light", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_chakra_magic", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_empty1", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_illuminate", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_illuminate_end", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_mana_leak", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_recall", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form_illuminate", "utility", "0" , "0" },
	{ "npc_dota_hero_keeper_of_the_light", "keeper_of_the_light_spirit_form_illuminate_end", "utility", "0" , "0" },
	{ "npc_dota_hero_kunkka", "kunkka_ghostship", "nuke", "position" , "0" },
	{ "npc_dota_hero_kunkka", "kunkka_torrent", "nuke", "skillshot" , "0" },
	{ "npc_dota_hero_kunkka", "kunkka_return", "utility", "0" , "0" },
	{ "npc_dota_hero_kunkka", "kunkka_tidebringer", "utility", "0" , "0" },
	{ "npc_dota_hero_kunkka", "kunkka_x_marks_the_spot", "utility", "0" , "0" },
	{ "npc_dota_hero_legion_commander", "legion_commander_overwhelming_odds", "nuke", "position" , "damage" },
	{ "npc_dota_hero_legion_commander", "legion_commander_duel", "disable", "target" , "0" },
	{ "npc_dota_hero_legion_commander", "legion_commander_moment_of_courage", "utility", "0" , "0" },
	{ "npc_dota_hero_legion_commander", "legion_commander_press_the_attack", "utility", "0" , "0" },
	{ "npc_dota_hero_leshrac", "leshrac_split_earth", "disable", "position" , "0" },
	{ "npc_dota_hero_leshrac", "leshrac_lightning_storm", "nuke", "target" , "0" },
	{ "npc_dota_hero_leshrac", "leshrac_pulse_nova", "utility", "0" , "0" },
	{ "npc_dota_hero_leshrac", "leshrac_diabolic_edict", "utility", "0" , "0" },
	{ "npc_dota_hero_lich", "lich_chain_frost", "nuke", "target" , "damage" },
	{ "npc_dota_hero_lich", "lich_frost_nova", "nuke", "position" , "0" },
	{ "npc_dota_hero_lich", "lich_dark_ritual", "utility", "0" , "0" },
	{ "npc_dota_hero_lich", "lich_frost_armor", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_assimilate", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_assimilate_eject", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_consume", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_control", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_empty_1", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_empty_2", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_empty_3", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_empty_4", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_feast", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_infest", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_open_wounds", "utility", "0" , "0" },
	{ "npc_dota_hero_life_stealer", "life_stealer_rage", "utility", "0" , "0" },
	{ "npc_dota_hero_lina", "lina_laguna_blade", "nuke", "target" , "damage" },
	{ "npc_dota_hero_lina", "lina_light_strike_array", "disable", "position" , "0" },
	{ "npc_dota_hero_lina", "lina_dragon_slave", "nuke", "skillshot" , "0" },
	{ "npc_dota_hero_lina", "lina_fiery_soul", "utility", "0" , "0" },
	{ "npc_dota_hero_lion", "lion_finger_of_death", "nuke", "target" , "damage" },
	{ "npc_dota_hero_lion", "lion_impale", "disable", "position" , "0" },
	{ "npc_dota_hero_lion", "lion_voodoo", "disable", "target" , "0" },
	{ "npc_dota_hero_lion", "lion_mana_drain", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_rabid", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_savage_roar", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_savage_roar_bear", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_demolish", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_entangle", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_spirit_bear_return", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_true_form", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_true_form_battle_cry", "utility", "0" , "0" },
	{ "npc_dota_hero_lone_druid", "lone_druid_true_form_druid", "utility", "0" , "0" },
	{ "npc_dota_hero_luna", "luna_lucent_beam", "nuke", "target" , "beam_damage" },
	{ "npc_dota_hero_luna", "luna_eclipse", "nuke", "no target" , "0" },
	{ "npc_dota_hero_luna", "luna_lunar_blessing", "utility", "0" , "0" },
	{ "npc_dota_hero_luna", "luna_moon_glaive", "utility", "0" , "0" },
	{ "npc_dota_hero_lycan", "lycan_feral_impulse", "utility", "0" , "0" },
	{ "npc_dota_hero_lycan", "lycan_howl", "utility", "0" , "0" },
	{ "npc_dota_hero_lycan", "lycan_shapeshift", "utility", "0" , "0" },
	{ "npc_dota_hero_lycan", "lycan_summon_wolves", "utility", "0" , "0" },
	{ "npc_dota_hero_lycan", "lycan_summon_wolves_critical_strike", "utility", "0" , "0" },
	{ "npc_dota_hero_lycan", "lycan_summon_wolves_invisibility", "utility", "0" , "0" },
	{ "npc_dota_hero_magnataur", "magnataur_shockwave", "nuke", "skillshot" , "shock_damage" },
	{ "npc_dota_hero_magnataur", "magnataur_reverse_polarity", "disable", "no target" , "0" },
	{ "npc_dota_hero_magnataur", "magnataur_empower", "utility", "0" , "0" },
	{ "npc_dota_hero_magnataur", "magnataur_skewer", "utility", "0" , "0" },
	{ "npc_dota_hero_medusa", "medusa_mystic_snake", "pure", "target" , "snake_damage" },
	{ "npc_dota_hero_medusa", "medusa_mana_shield", "utility", "0" , "0" },
	{ "npc_dota_hero_medusa", "medusa_split_shot", "utility", "0" , "0" },
	{ "npc_dota_hero_medusa", "medusa_stone_gaze", "utility", "0" , "0" },
	{ "npc_dota_hero_meepo", "meepo_earthbind", "disable", "position" , "0" },
	{ "npc_dota_hero_meepo", "meepo_poof", "utility", "0" , "0" },
	{ "npc_dota_hero_meepo", "meepo_divided_we_stand", "utility", "0" , "0" },
	{ "npc_dota_hero_meepo", "meepo_geostrike", "utility", "0" , "0" },
	{ "npc_dota_hero_mirana", "mirana_arrow", "disable", "position" , "0" },
	{ "npc_dota_hero_mirana", "mirana_starfall", "nuke", "no target" , "0" },
	{ "npc_dota_hero_mirana", "mirana_invis", "utility", "0" , "0" },
	{ "npc_dota_hero_mirana", "mirana_leap", "utility", "0" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_primal_spring", "disable", "position" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_primal_spring_early", "disable", "position" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_boundless_strike", "nuke", "position" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_jingu_mastery", "utility", "0" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_mischief", "utility", "0" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_tree_dance", "utility", "0" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_untransform", "utility", "0" , "0" },
	{ "npc_dota_hero_monkey_king", "monkey_king_wukongs_command", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_adaptive_strike", "nuke", "target" , "0" },
	{ "npc_dota_hero_morphling", "morphling_waveform", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_hybrid", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_morph", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_morph_agi", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_morph_replicate", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_morph_str", "utility", "0" , "0" },
	{ "npc_dota_hero_morphling", "morphling_replicate", "utility", "0" , "0" },
	{ "npc_dota_hero_naga_siren", "naga_siren_ensnare", "disable", "target" , "0" },
	{ "npc_dota_hero_naga_siren", "naga_siren_rip_tide", "nuke", "no target" , "0" },
	{ "npc_dota_hero_naga_siren", "naga_siren_mirror_image", "utility", "0" , "0" },
	{ "npc_dota_hero_naga_siren", "naga_siren_song_of_the_siren", "utility", "0" , "0" },
	{ "npc_dota_hero_naga_siren", "naga_siren_song_of_the_siren_cancel", "utility", "0" , "0" },
	{ "npc_dota_hero_necrolyte", "necrolyte_reapers_scythe", "disable", "target" , "0" },
	{ "npc_dota_hero_necrolyte", "necrolyte_death_pulse", "nuke", "no target" , "0" },
	{ "npc_dota_hero_necrolyte", "necrolyte_heartstopper_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_necrolyte", "necrolyte_sadist", "utility", "0" , "0" },
	{ "npc_dota_hero_necrolyte", "necrolyte_sadist_stop", "utility", "0" , "0" },
	{ "npc_dota_hero_nevermore", "nevermore_dark_lord", "utility", "0" , "0" },
	{ "npc_dota_hero_nevermore", "nevermore_necromastery", "utility", "0" , "0" },
	{ "npc_dota_hero_nevermore", "nevermore_requiem", "utility", "0" , "0" },
	{ "npc_dota_hero_nevermore", "nevermore_shadowraze1", "nuke", "special" , "0" },
	{ "npc_dota_hero_nevermore", "nevermore_shadowraze2", "nuke", "special" , "0" },
	{ "npc_dota_hero_nevermore", "nevermore_shadowraze3", "nuke", "special" , "0" },
	{ "npc_dota_hero_night_stalker", "night_stalker_void", "nuke", "target" , "0" },
	{ "npc_dota_hero_night_stalker", "night_stalker_crippling_fear", "utility", "0" , "0" },
	{ "npc_dota_hero_night_stalker", "night_stalker_darkness", "utility", "0" , "0" },
	{ "npc_dota_hero_night_stalker", "night_stalker_hunter_in_the_night", "utility", "0" , "0" },
	{ "npc_dota_hero_nyx_assassin", "nyx_assassin_impale", "disable", "position" , "0" },
	{ "npc_dota_hero_nyx_assassin", "nyx_assassin_mana_burn", "nuke", "special" , "0" },
	{ "npc_dota_hero_nyx_assassin", "nyx_assassin_burrow", "utility", "0" , "0" },
	{ "npc_dota_hero_nyx_assassin", "nyx_assassin_spiked_carapace", "utility", "0" , "0" },
	{ "npc_dota_hero_nyx_assassin", "nyx_assassin_unburrow", "utility", "0" , "0" },
	{ "npc_dota_hero_nyx_assassin", "nyx_assassin_vendetta", "utility", "0" , "0" },
	{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_astral_imprisonment", "utility", "0" , "0" },
	{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_sanity_eclipse", "nuke", "position" , "0" },
	{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_arcane_orb", "utility", "0" , "0" },
	{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_essence_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_obsidian_destroyer", "obsidian_destroyer_mind_over_matter", "utility", "0" , "0" },
	{ "npc_dota_hero_ogre_magi", "ogre_magi_fireblast", "nuke", "target" , "0" },
	{ "npc_dota_hero_ogre_magi", "ogre_magi_unrefined_fireblast", "nuke", "target" , "0" },
	{ "npc_dota_hero_ogre_magi", "ogre_magi_bloodlust", "utility", "0" , "0" },
	{ "npc_dota_hero_ogre_magi", "ogre_magi_ignite", "utility", "0" , "0" },
	{ "npc_dota_hero_ogre_magi", "ogre_magi_multicast", "utility", "0" , "0" },
	{ "npc_dota_hero_omniknight", "omniknight_degen_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_omniknight", "omniknight_guardian_angel", "utility", "0" , "0" },
	{ "npc_dota_hero_omniknight", "omniknight_purification", "utility", "0" , "0" },
	{ "npc_dota_hero_omniknight", "omniknight_repel", "utility", "0" , "0" },
	{ "npc_dota_hero_oracle", "oracle_fortunes_end", "disable", "target" , "0" },
	{ "npc_dota_hero_oracle", "oracle_false_promise", "utility", "0" , "0" },
	{ "npc_dota_hero_oracle", "oracle_fates_edict", "utility", "0" , "0" },
	{ "npc_dota_hero_oracle", "oracle_purifying_flames", "nuke", "target" , "damage" },
	{ "npc_dota_hero_phantom_assassin", "phantom_assassin_stifling_dagger", "nuke", "target" , "0" },
	{ "npc_dota_hero_phantom_assassin", "phantom_assassin_blur", "utility", "0" , "0" },
	{ "npc_dota_hero_phantom_assassin", "phantom_assassin_coup_de_grace", "utility", "0" , "0" },
	{ "npc_dota_hero_phantom_assassin", "phantom_assassin_phantom_strike", "utility", "0" , "0" },
	{ "npc_dota_hero_phantom_lancer", "phantom_lancer_spirit_lance", "nuke", "target" , "0" },
	{ "npc_dota_hero_phantom_lancer", "phantom_lancer_doppelwalk", "utility", "0" , "0" },
	{ "npc_dota_hero_phantom_lancer", "phantom_lancer_juxtapose", "utility", "0" , "0" },
	{ "npc_dota_hero_phantom_lancer", "phantom_lancer_phantom_edge", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_fire_spirits", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_icarus_dive", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_icarus_dive_stop", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_launch_fire_spirit", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_sun_ray", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_sun_ray_stop", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_sun_ray_toggle_move", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_sun_ray_toggle_move_empty", "utility", "0" , "0" },
	{ "npc_dota_hero_phoenix", "phoenix_supernova", "utility", "0" , "0" },
	{ "npc_dota_hero_puck", "puck_dream_coil", "disable", "position" , "0" },
	{ "npc_dota_hero_puck", "puck_waning_rift", "disable", "no target" , "0" },
	{ "npc_dota_hero_puck", "puck_ethereal_jaunt", "utility", "0" , "0" },
	{ "npc_dota_hero_puck", "puck_illusory_orb", "utility", "0" , "0" },
	{ "npc_dota_hero_puck", "puck_phase_shift", "utility", "0" , "0" },
	{ "npc_dota_hero_pudge", "pudge_dismember", "disable", "target" , "0" },
	{ "npc_dota_hero_pudge", "pudge_flesh_heap", "utility", "0" , "0" },
	{ "npc_dota_hero_pudge", "pudge_meat_hook", "utility", "0" , "0" },
	{ "npc_dota_hero_pudge", "pudge_rot", "utility", "0" , "0" },
	{ "npc_dota_hero_pugna", "pugna_nether_blast", "nuke", "skillshot" , "blast_damage" },
	{ "npc_dota_hero_pugna", "pugna_life_drain", "nuke", "target" , "0" },
	{ "npc_dota_hero_pugna", "pugna_decrepify", "utility", "0" , "0" },
	{ "npc_dota_hero_pugna", "pugna_nether_ward", "utility", "0" , "0" },
	{ "npc_dota_hero_queenofpain", "queenofpain_sonic_wave", "nuke", "position" , "damage" },
	{ "npc_dota_hero_queenofpain", "queenofpain_shadow_strike", "nuke", "target" , "strike_damage" },
	{ "npc_dota_hero_queenofpain", "queenofpain_scream_of_pain", "nuke", "special" , "0" },
	{ "npc_dota_hero_queenofpain", "queenofpain_blink", "utility", "0" , "0" },
	{ "npc_dota_hero_rattletrap", "rattletrap_battery_assault", "disable", "no target" , "0" },
	{ "npc_dota_hero_rattletrap", "rattletrap_hookshot", "disable", "position" , "0" },
	{ "npc_dota_hero_rattletrap", "rattletrap_rocket_flare", "nuke", "skillshot" , "0" },
	{ "npc_dota_hero_rattletrap", "rattletrap_power_cogs", "utility", "0" , "0" },
	{ "npc_dota_hero_razor", "razor_plasma_field", "nuke", "no target" , "damage_max" },
	{ "npc_dota_hero_razor", "razor_eye_of_the_storm", "nuke", "no target" , "0" },
	{ "npc_dota_hero_razor", "razor_static_link", "utility", "0" , "0" },
	{ "npc_dota_hero_razor", "razor_unstable_current", "utility", "0" , "0" },
	{ "npc_dota_hero_riki", "riki_smoke_screen", "disable", "position" , "0" },
	{ "npc_dota_hero_riki", "riki_blink_strike", "utility", "0" , "0" },
	{ "npc_dota_hero_riki", "riki_permanent_invisibility", "utility", "0" , "0" },
	{ "npc_dota_hero_riki", "riki_tricks_of_the_trade", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_fade_bolt", "nuke", "target" , "damage" },
	{ "npc_dota_hero_rubick", "rubick_telekinesis", "disable", "target" , "0" },
	{ "npc_dota_hero_rubick", "rubick_telekinesis_land", "disable", "target" , "0" },
	{ "npc_dota_hero_rubick", "rubick_empty1", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_empty2", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_hidden1", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_hidden2", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_hidden3", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_null_field", "utility", "0" , "0" },
	{ "npc_dota_hero_rubick", "rubick_spell_steal", "utility", "0" , "0" },
	{ "npc_dota_hero_sand_king", "sandking_burrowstrike", "disable", "position" , "0" },
	{ "npc_dota_hero_sand_king", "sandking_epicenter", "nuke", "no target" , "0" },
	{ "npc_dota_hero_sand_king", "sandking_caustic_finale", "utility", "0" , "0" },
	{ "npc_dota_hero_sand_king", "sandking_sand_storm", "utility", "0" , "0" },
	{ "npc_dota_hero_shadow_demon", "shadow_demon_demonic_purge", "utility", "0" , "0" },
	{ "npc_dota_hero_shadow_demon", "shadow_demon_disruption", "utility", "0" , "0" },
	{ "npc_dota_hero_shadow_demon", "shadow_demon_shadow_poison", "utility", "0" , "0" },
	{ "npc_dota_hero_shadow_demon", "shadow_demon_shadow_poison_release", "utility", "0" , "0" },
	{ "npc_dota_hero_shadow_demon", "shadow_demon_soul_catcher", "utility", "0" , "0" },
	{ "npc_dota_hero_shadow_shaman", "shadow_shaman_ether_shock", "nuke", "target" , "damage" },
	{ "npc_dota_hero_shadow_shaman", "shadow_shaman_shackles", "disable", "target" , "0" },
	{ "npc_dota_hero_shadow_shaman", "shadow_shaman_voodoo", "disable", "target" , "0" },
	{ "npc_dota_hero_shadow_shaman", "shadow_shaman_mass_serpent_ward", "utility", "0" , "0" },
	{ "npc_dota_hero_shredder", "shredder_whirling_death", "pure", "no target" , "whirling_damage" },
	{ "npc_dota_hero_shredder", "shredder_chakram", "nuke", "position" , "0" },
	{ "npc_dota_hero_shredder", "shredder_chakram_2", "nuke", "position" , "0" },
	{ "npc_dota_hero_shredder", "shredder_reactive_armor", "utility", "0" , "0" },
	{ "npc_dota_hero_shredder", "shredder_return_chakram", "utility", "0" , "0" },
	{ "npc_dota_hero_shredder", "shredder_return_chakram_2", "utility", "0" , "0" },
	{ "npc_dota_hero_shredder", "shredder_timber_chain", "utility", "0" , "0" },
	{ "npc_dota_hero_silencer", "silencer_last_word", "nuke", "target" , "damage" },
	{ "npc_dota_hero_silencer", "silencer_global_silence", "disable", "no target" , "0" },
	{ "npc_dota_hero_silencer", "silencer_curse_of_the_silent", "utility", "0" , "0" },
	{ "npc_dota_hero_silencer", "silencer_glaives_of_wisdom", "utility", "0" , "0" },
	{ "npc_dota_hero_skeleton_king", "skeleton_king_hellfire_blast", "disable", "target" , "0" },
	{ "npc_dota_hero_skeleton_king", "skeleton_king_reincarnation", "utility", "0" , "0" },
	{ "npc_dota_hero_skeleton_king", "skeleton_king_vampiric_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_skywrath_mage", "skywrath_mage_arcane_bolt", "nuke", "target" , "bolt_damage" },
	{ "npc_dota_hero_skywrath_mage", "skywrath_mage_ancient_seal", "disable", "target" , "0" },
	{ "npc_dota_hero_skywrath_mage", "skywrath_mage_mystic_flare", "nuke", "position" , "0" },
	{ "npc_dota_hero_skywrath_mage", "skywrath_mage_concussive_shot", "nuke", "special" , "damage" },
	{ "npc_dota_hero_slardar", "slardar_slithereen_crush", "disable", "no target" , "0" },
	{ "npc_dota_hero_slardar", "slardar_amplify_damage", "utility", "0" , "0" },
	{ "npc_dota_hero_slardar", "slardar_bash", "utility", "0" , "0" },
	{ "npc_dota_hero_slardar", "slardar_sprint", "utility", "0" , "0" },
	{ "npc_dota_hero_slark", "slark_dark_pact", "nuke", "no target" , "total_damage" },
	{ "npc_dota_hero_slark", "slark_essence_shift", "utility", "0" , "0" },
	{ "npc_dota_hero_slark", "slark_pounce", "utility", "0" , "0" },
	{ "npc_dota_hero_slark", "slark_shadow_dance", "utility", "0" , "0" },
	{ "npc_dota_hero_sniper", "sniper_assassinate", "nuke", "target" , "0" },
	{ "npc_dota_hero_sniper", "sniper_headshot", "utility", "0" , "0" },
	{ "npc_dota_hero_sniper", "sniper_shrapnel", "utility", "0" , "0" },
	{ "npc_dota_hero_sniper", "sniper_take_aim", "utility", "0" , "0" },
	{ "npc_dota_hero_spectre", "spectre_spectral_dagger", "nuke", "target" , "damage" },
	{ "npc_dota_hero_spectre", "spectre_desolate", "utility", "0" , "0" },
	{ "npc_dota_hero_spectre", "spectre_dispersion", "utility", "0" , "0" },
	{ "npc_dota_hero_spectre", "spectre_haunt", "utility", "0" , "0" },
	{ "npc_dota_hero_spectre", "spectre_reality", "utility", "0" , "0" },
	{ "npc_dota_hero_spirit_breaker", "spirit_breaker_nether_strike", "nuke", "target" , "0" },
	{ "npc_dota_hero_spirit_breaker", "spirit_breaker_charge_of_darkness", "utility", "0" , "0" },
	{ "npc_dota_hero_spirit_breaker", "spirit_breaker_empowering_haste", "utility", "0" , "0" },
	{ "npc_dota_hero_spirit_breaker", "spirit_breaker_greater_bash", "utility", "0" , "0" },
	{ "npc_dota_hero_storm_spirit", "storm_spirit_electric_vortex", "disable", "target" , "0" },
	{ "npc_dota_hero_storm_spirit", "storm_spirit_ball_lightning", "utility", "0" , "0" },
	{ "npc_dota_hero_storm_spirit", "storm_spirit_overload", "utility", "0" , "0" },
	{ "npc_dota_hero_storm_spirit", "storm_spirit_static_remnant", "utility", "0" , "0" },
	{ "npc_dota_hero_sven", "sven_storm_bolt", "disable", "target" , "0" },
	{ "npc_dota_hero_sven", "sven_gods_strength", "utility", "0" , "0" },
	{ "npc_dota_hero_sven", "sven_great_cleave", "utility", "0" , "0" },
	{ "npc_dota_hero_sven", "sven_warcry", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_land_mines", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_stasis_trap", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_suicide", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_remote_mines", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_focused_detonate", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_remote_mines_self_detonate", "utility", "0" , "0" },
	{ "npc_dota_hero_techies", "techies_minefield_sign", "utility", "0" , "0" },
	{ "npc_dota_hero_templar_assassin", "templar_assassin_meld", "utility", "0" , "0" },
	{ "npc_dota_hero_templar_assassin", "templar_assassin_psi_blades", "utility", "0" , "0" },
	{ "npc_dota_hero_templar_assassin", "templar_assassin_psionic_trap", "utility", "0" , "0" },
	{ "npc_dota_hero_templar_assassin", "templar_assassin_refraction", "utility", "0" , "0" },
	{ "npc_dota_hero_templar_assassin", "templar_assassin_self_trap", "utility", "0" , "0" },
	{ "npc_dota_hero_templar_assassin", "templar_assassin_trap", "utility", "0" , "0" },
	{ "npc_dota_hero_terrorblade", "terrorblade_conjure_image", "utility", "0" , "0" },
	{ "npc_dota_hero_terrorblade", "terrorblade_metamorphosis", "utility", "0" , "0" },
	{ "npc_dota_hero_terrorblade", "terrorblade_reflection", "utility", "0" , "0" },
	{ "npc_dota_hero_terrorblade", "terrorblade_sunder", "utility", "0" , "0" },
	{ "npc_dota_hero_tidehunter", "tidehunter_ravage", "disable", "no target" , "0" },
	{ "npc_dota_hero_tidehunter", "tidehunter_anchor_smash", "nuke", "no target" , "0" },
	{ "npc_dota_hero_tidehunter", "tidehunter_gush", "nuke", "target" , "0" },
	{ "npc_dota_hero_tidehunter", "tidehunter_kraken_shell", "utility", "0" , "0" },
	{ "npc_dota_hero_tinker", "tinker_laser", "pure", "target" , "laser_damage" },
	{ "npc_dota_hero_tinker", "tinker_heat_seeking_missile", "nuke", "no target" , "0" },
	{ "npc_dota_hero_tinker", "tinker_march_of_the_machines", "utility", "0" , "0" },
	{ "npc_dota_hero_tinker", "tinker_rearm", "utility", "0" , "0" },
	{ "npc_dota_hero_tiny", "tiny_toss", "nuke", "position" , "toss_damage" },
	{ "npc_dota_hero_tiny", "tiny_avalanche", "disable", "position" , "0" },
	{ "npc_dota_hero_tiny", "tiny_craggy_exterior", "utility", "0" , "0" },
	{ "npc_dota_hero_tiny", "tiny_grow", "utility", "0" , "0" },
	{ "npc_dota_hero_treant", "treant_overgrowth", "disable", "no target" , "0" },
	{ "npc_dota_hero_treant", "treant_eyes_in_the_forest", "utility", "0" , "0" },
	{ "npc_dota_hero_treant", "treant_leech_seed", "utility", "0" , "0" },
	{ "npc_dota_hero_treant", "treant_living_armor", "utility", "0" , "0" },
	{ "npc_dota_hero_treant", "treant_natures_guise", "utility", "0" , "0" },
	{ "npc_dota_hero_troll_warlord", "troll_warlord_battle_trance", "utility", "0" , "0" },
	{ "npc_dota_hero_troll_warlord", "troll_warlord_berserkers_rage", "utility", "0" , "0" },
	{ "npc_dota_hero_troll_warlord", "troll_warlord_fervor", "utility", "0" , "0" },
	{ "npc_dota_hero_troll_warlord", "troll_warlord_whirling_axes_melee", "utility", "0" , "0" },
	{ "npc_dota_hero_troll_warlord", "troll_warlord_whirling_axes_ranged", "utility", "0" , "0" },
	{ "npc_dota_hero_tusk", "tusk_ice_shards", "nuke", "skillshot" , "shard_damage" },
	{ "npc_dota_hero_tusk", "tusk_walrus_kick", "nuke", "target" , "0" },
	{ "npc_dota_hero_tusk", "tusk_walrus_punch", "nuke", "target" , "0" },
	{ "npc_dota_hero_tusk", "tusk_frozen_sigil", "utility", "0" , "0" },
	{ "npc_dota_hero_tusk", "tusk_launch_snowball", "utility", "0" , "0" },
	{ "npc_dota_hero_tusk", "tusk_snowball", "utility", "0" , "0" },
	{ "npc_dota_hero_undying", "undying_decay", "nuke", "position" , "decay_damage" },
	{ "npc_dota_hero_undying", "undying_flesh_golem", "utility", "0" , "0" },
	{ "npc_dota_hero_undying", "undying_soul_rip", "utility", "0" , "0" },
	{ "npc_dota_hero_undying", "undying_tombstone", "utility", "0" , "0" },
	{ "npc_dota_hero_undying", "undying_tombstone_zombie_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_undying", "undying_tombstone_zombie_deathstrike", "utility", "0" , "0" },
	{ "npc_dota_hero_ursa", "ursa_earthshock", "nuke", "no target" , "0" },
	{ "npc_dota_hero_ursa", "ursa_enrage", "utility", "0" , "0" },
	{ "npc_dota_hero_ursa", "ursa_fury_swipes", "utility", "0" , "0" },
	{ "npc_dota_hero_ursa", "ursa_overpower", "utility", "0" , "0" },
	{ "npc_dota_hero_vengefulspirit", "vengefulspirit_magic_missile", "disable", "target" , "0" },
	{ "npc_dota_hero_vengefulspirit", "vengefulspirit_wave_of_terror", "nuke", "skillshot" , "0" },
	{ "npc_dota_hero_vengefulspirit", "vengefulspirit_command_aura", "utility", "0" , "0" },
	{ "npc_dota_hero_vengefulspirit", "vengefulspirit_nether_swap", "utility", "0" , "0" },
	{ "npc_dota_hero_venomancer", "venomancer_plague_ward", "utility", "0" , "0" },
	{ "npc_dota_hero_venomancer", "venomancer_poison_nova", "utility", "0" , "0" },
	{ "npc_dota_hero_venomancer", "venomancer_poison_sting", "utility", "0" , "0" },
	{ "npc_dota_hero_venomancer", "venomancer_venomous_gale", "utility", "0" , "0" },
	{ "npc_dota_hero_viper", "viper_viper_strike", "nuke", "target" , "0" },
	{ "npc_dota_hero_viper", "viper_corrosive_skin", "utility", "0" , "0" },
	{ "npc_dota_hero_viper", "viper_nethertoxin", "utility", "0" , "0" },
	{ "npc_dota_hero_viper", "viper_poison_attack", "utility", "0" , "0" },
	{ "npc_dota_hero_visage", "visage_soul_assumption", "utilit<", "0" , "0" },
	{ "npc_dota_hero_visage", "visage_grave_chill", "utility", "0" , "0" },
	{ "npc_dota_hero_visage", "visage_gravekeepers_cloak", "utility", "0" , "0" },
	{ "npc_dota_hero_visage", "visage_summon_familiars", "utility", "0" , "0" },
	{ "npc_dota_hero_visage", "visage_summon_familiars_stone_form", "utility", "0" , "0" },
	{ "npc_dota_hero_warlock", "warlock_rain_of_chaos", "disable", "position" , "0" },
	{ "npc_dota_hero_warlock", "warlock_shadow_word", "nuke", "target" , "0" },
	{ "npc_dota_hero_warlock", "warlock_fatal_bonds", "utility", "0" , "0" },
	{ "npc_dota_hero_warlock", "warlock_golem_flaming_fists", "utility", "0" , "0" },
	{ "npc_dota_hero_warlock", "warlock_golem_permanent_immolation", "utility", "0" , "0" },
	{ "npc_dota_hero_warlock", "warlock_upheaval", "utility", "0" , "0" },
	{ "npc_dota_hero_weaver", "weaver_geminate_attack", "utility", "0" , "0" },
	{ "npc_dota_hero_weaver", "weaver_shukuchi", "utility", "0" , "0" },
	{ "npc_dota_hero_weaver", "weaver_the_swarm", "utility", "0" , "0" },
	{ "npc_dota_hero_weaver", "weaver_time_lapse", "utility", "0" , "0" },
	{ "npc_dota_hero_windrunner", "windrunner_shackleshot", "disable", "target" , "0" },
	{ "npc_dota_hero_windrunner", "windrunner_powershot", "nuke", "skillshot" , "0" },
	{ "npc_dota_hero_windrunner", "windrunner_focusfire", "utility", "0" , "0" },
	{ "npc_dota_hero_windrunner", "windrunner_windrun", "utility", "0" , "0" },
	{ "npc_dota_hero_winter_wyvern", "winter_wyvern_winters_curse", "disable", "target" , "0" },
	{ "npc_dota_hero_winter_wyvern", "winter_wyvern_splinter_blast", "nuke", "target" , "0" },
	{ "npc_dota_hero_winter_wyvern", "winter_wyvern_arctic_burn", "utility", "0" , "0" },
	{ "npc_dota_hero_winter_wyvern", "winter_wyvern_cold_embrace", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_empty1", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_empty2", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_overcharge", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_relocate", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_spirits", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_spirits_in", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_spirits_out", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_tether", "utility", "0" , "0" },
	{ "npc_dota_hero_wisp", "wisp_tether_break", "utility", "0" , "0" },
	{ "npc_dota_hero_witch_doctor", "witch_doctor_paralyzing_cask", "disable", "target" , "0" },
	{ "npc_dota_hero_witch_doctor", "witch_doctor_death_ward", "utility", "0" , "0" },
	{ "npc_dota_hero_witch_doctor", "witch_doctor_maledict", "utility", "0" , "0" },
	{ "npc_dota_hero_witch_doctor", "witch_doctor_voodoo_restoration", "utility", "0" , "0" },
	{ "npc_dota_hero_zuus", "zuus_arc_lightning", "nuke", "target" , "0" },
	{ "npc_dota_hero_zuus", "zuus_lightning_bolt", "nuke", "skillshot" , "0" },
	{ "npc_dota_hero_zuus", "zuus_thundergods_wrath", "nuke", "no target" , "0" },
	{ "npc_dota_hero_zuus", "zuus_cloud", "utility", "0" , "0" },
	{ "npc_dota_hero_zuus", "zuus_static_field", "utility", "0" , "0" } }

fooAllInOne.preemptiveBKB = {}
for i = 1, #fooAllInOne.preemptiveBKBtable do
	fooAllInOne.preemptiveBKB[i] = Menu.AddOption({ "Utility","foos AllInOne", "5. Auto Use Defensive Items", "2. BKB", "3. dangerous disables" }, fooAllInOne.preemptiveBKBtable[i], "")
end

fooAllInOne.dodgeItOptionTable = {}
for i = 1, #fooAllInOne.dodgeItItems do
	fooAllInOne.dodgeItOptionTable[i] = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt", "1. Dodge items order" }, i .. ". " .. fooAllInOne.dodgeItItems[i][1].." ".."{{dodger}}", "if value == 0 then item will not be used; lower numbers will be used first", 0, #fooAllInOne.dodgeItItems, 1)
end

fooAllInOne.dodgeEnemySkillsOptionsTable = {}
for i = 1, 20 do
	fooAllInOne.dodgeEnemySkillsOptionsTable[fooAllInOne.dodgeEnemySkillsTable[i]] = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt", "3. Dangerous enemy skills", "Table 1" }, fooAllInOne.dodgeEnemySkillsTable[i].." ".."{{dodger}}", "if enabled, skill will be dodged")
end
for i = 21, 40 do
	fooAllInOne.dodgeEnemySkillsOptionsTable[fooAllInOne.dodgeEnemySkillsTable[i]] = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt", "3. Dangerous enemy skills", "Table 2" }, fooAllInOne.dodgeEnemySkillsTable[i].." ".."{{dodger}}", "if enabled, skill will be dodged")
end
for i = 41, #fooAllInOne.dodgeEnemySkillsTable do
	fooAllInOne.dodgeEnemySkillsOptionsTable[fooAllInOne.dodgeEnemySkillsTable[i]] = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt", "3. Dangerous enemy skills", "Table 3" }, fooAllInOne.dodgeEnemySkillsTable[i].." ".."{{dodger}}", "if enabled, skill will be dodged")
end

fooAllInOne.dodgeEnemyHeroskillsOptionsTable = {}
for i = 1, #fooAllInOne.dodgeItSkills do
	fooAllInOne.dodgeEnemyHeroskillsOptionsTable[fooAllInOne.dodgeItSkills[i][1]] = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt", "2. Select myHero skills" }, fooAllInOne.dodgeItSkills[i][1].." ".."{{dodger}}", "if not enabled, skill will not be used to dodge; only uses skill, if attack can be dodged with this skill")
end

fooAllInOne.dodgeEnemyHeroSpecialEmber = Menu.AddOption({ "Utility","foos AllInOne", "98. <BETA> DodgeIt", "2. Select myHero skills" }, "ember_spirit_remnant {{dodger}}", "if not enabled, skill will not be used to dodge; only uses skill, if attack can be dodged with this skill")

function fooAllInOne.ResetGlobalVariables()

	fooAllInOne.LockedTarget = nil
	fooAllInOne.lastCastTime = 0
	fooAllInOne.lastCastTime2 = 0
	fooAllInOne.lastCastTime3 = 0
	fooAllInOne.lastTick = 0
	fooAllInOne.delay = 0
	fooAllInOne.itemDelay = 0
	fooAllInOne.lastItemCast = 0
	fooAllInOne.lastDefItemPop = 0
	fooAllInOne.lastItemTick = 0
	fooAllInOne.ItemCastStop = false
	fooAllInOne.ControlledUnitCastTime = 0
	fooAllInOne.ControlledUnitPauseTime = 0
	fooAllInOne.lastAttackTime = 0
	fooAllInOne.lastAttackTime2 = 0
	fooAllInOne.LastTarget = nil
	fooAllInOne.LastTickManta1 = 0
	fooAllInOne.LastTickManta2 = 0
	fooAllInOne.ArcWardenEntity = nil
	fooAllInOne.GenericUpValue = false
	fooAllInOne.lastPosition = Vector(0, 0, 0)
	fooAllInOne.PuckOrbCastTime = 0
	fooAllInOne.Toggler = false
	fooAllInOne.TogglerTime = 0
	fooAllInOne.PreInvoke = false
	fooAllInOne.InvokerComboSelector = 0
	fooAllInOne.InvokerLastCastedSkill = nil
	fooAllInOne.InvokerLastCastedSkillTime = 0
	fooAllInOne.InvokerLastChangedInstance = 0
	fooAllInOne.InvokerCaptureManualInstances = 0
	fooAllInOne.invokerChannellingKillstealTimer = 0
	fooAllInOne.invokerCaptureGhostwalkActivation = 0
	fooAllInOne.getInvokerGhostWalkKey = nil
	fooAllInOne.invokerDisplayNeedsInit = true
	fooAllInOne.getInvokerSettings = nil
	fooAllInOne.AttackProjectileCreate = 0
	fooAllInOne.AttackAnimationCreate = 0
	fooAllInOne.AttackParticleCreate = 0
	fooAllInOne.InAttackBackswing = false
	fooAllInOne.OrbwalkerDelay = 0
	fooAllInOne.TPParticleIndex = nil
	fooAllInOne.TPParticleTime = 0
	fooAllInOne.TPParticleUnit = nil
	fooAllInOne.TPParticlePosition = Vector()
	fooAllInOne.GlimpseParticleIndex = nil
	fooAllInOne.GlimpseParticleTime = 0
	fooAllInOne.GlimpseParticleUnit = nil
	fooAllInOne.GlimpseParticlePosition = Vector()
	fooAllInOne.GlimpseParticleIndexStart = nil
	fooAllInOne.GlimpseParticlePositionStart = Vector()
	fooAllInOne.particleNextTime = 0
	fooAllInOne.currentParticle = nil
	fooAllInOne.skywrathDMGwithoutUlt = 0
	fooAllInOne.skywrathDMGwithUlt = 0
	fooAllInOne.skywrathComboSelect = false
	fooAllInOne.clockwerkHookUpValue = false
	fooAllInOne.enemyCanBeShackled = false
	fooAllInOne.dodgeTiming = 0
	fooAllInOne.VisageInstStunLockTarget = nil
	fooAllInOne.VisagePanicTarget = nil
	fooAllInOne.morphlingComboSelect = false
	fooAllInOne.morphlingTotalDMG = 0
	fooAllInOne.morphlingTotalDMGwoWave = 0
	fooAllInOne.MorphBalaceTimer = 0
	fooAllInOne.MorphBalanceSelectedHP = 0
	fooAllInOne.MorphBalanceSelected = 0
	fooAllInOne.MorphAutoReplicateControl = false
	fooAllInOne.wardCaptureTiming = 0
	fooAllInOne.sentryImageHandle = nil
	fooAllInOne.obsImageHandle = nil
	fooAllInOne.wardDrawingRemove = 0
	fooAllInOne.necroDMGwithoutUlt = 0
	fooAllInOne.necroDMGwithUlt = 0
	fooAllInOne.necroComboSelect = false
	fooAllInOne.magnusLastPos = Vector()
	fooAllInOne.SFcurrentParticle1 = 0
	fooAllInOne.SFcurrentParticle2 = 0
	fooAllInOne.SFcurrentParticle3 = 0
	fooAllInOne.lastHitterDelay = 0
	fooAllInOne.lastHitterManualTarget = nil
	fooAllInOne.lastHitcurrentParticle = 0
	fooAllInOne.lastHitterKillableImage = nil
	fooAllInOne.lastHitterTimingMap = {}
	fooAllInOne.lastHitterPredictedDieTime = {}
	fooAllInOne.wardDispenserCount = {}
	fooAllInOne.wardProcessingTable = {}
	fooAllInOne.dodgeItTable = {}
	fooAllInOne.dodgeItSkillReady = {}
	fooAllInOne.dodgeItReadyTable = {}
	fooAllInOne.LinkensBreakerItemOrder = {}
	fooAllInOne.ItemCastOrder = {}
	fooAllInOne.rotationTable = {}
	fooAllInOne.PuckOrbHitSim = {}
	fooAllInOne.enemyHeroTable = {}
	fooAllInOne.InvokerKSparticleProcess = {{nil, nil, 0, nil, Vector()}}
	fooAllInOne.PreInvokeSkills = {}
	fooAllInOne.invokerCachedIcons = {}

end

function fooAllInOne.OnGameStart()
	
	fooAllInOne.ResetGlobalVariables()

end

function fooAllInOne.OnGameEnd()
	
	fooAllInOne.ResetGlobalVariables()

end
	

-- main callback
function fooAllInOne.OnUpdate()

	if not Menu.IsEnabled(fooAllInOne.optionEnable) then return end

	if not Engine.IsInGame() then
		fooAllInOne.ResetGlobalVariables()
	end
	
	if not GameRules.GetGameState() == 5 then return end
	if Input.IsInputCaptured() then return end
	local myHero = Heroes.GetLocal()
		if not myHero then return end
		if not Entity.IsAlive(myHero) then return end

	if next(fooAllInOne.ItemCastOrder) == nil then
		fooAllInOne.setOrderItem(false)
	end
 	if next(fooAllInOne.LinkensBreakerItemOrder) == nil then
		fooAllInOne.setOrderLinkens(false)
	end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))

	local isHeroSupported = fooAllInOne.heroSupported(myHero)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		if fooAllInOne.LockedTarget == nil then
			if enemy and NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then
				fooAllInOne.LockedTarget = enemy
			else
				fooAllInOne.LockedTarget = nil
			end
		end
	else
		fooAllInOne.LockedTarget = nil
	end

	if fooAllInOne.LockedTarget ~= nil then
		if not Entity.IsAlive(fooAllInOne.LockedTarget) then
			fooAllInOne.LockedTarget = nil
		elseif Entity.IsDormant(fooAllInOne.LockedTarget) then
			fooAllInOne.LockedTarget = nil
		elseif not NPC.IsEntityInRange(myHero, fooAllInOne.LockedTarget, 3000) then
			fooAllInOne.LockedTarget = nil
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionLockTargetIndicator) then
		fooAllInOne.TargetIndicator(myHero)
	end

	local comboTarget
		if Menu.IsEnabled(fooAllInOne.optionLockTarget) then
			if fooAllInOne.LockedTarget ~= nil then
				comboTarget = fooAllInOne.LockedTarget
			else
				if not Menu.IsKeyDown(fooAllInOne.optionComboKey) then
					comboTarget = enemy
				end
			end
		else
			comboTarget = enemy
		end
			
	if comboTarget then
		if isHeroSupported then
		
			if NPC.GetUnitName(myHero) == "npc_dota_hero_axe" then
				fooAllInOne.axeCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_rattletrap" then
				fooAllInOne.clockwerkCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_skywrath_mage" then
				fooAllInOne.skywrathCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_tiny" then
				fooAllInOne.tinyCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_windrunner" then
				fooAllInOne.WindRunnerCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_ember_spirit" then
				fooAllInOne.EmberCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_ursa" then
				fooAllInOne.UrsaCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_templar_assassin" then
				fooAllInOne.TACombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_slardar" then
				fooAllInOne.SlardarCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_clinkz" then
				fooAllInOne.ClinkzCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_queenofpain" then
				fooAllInOne.QoPCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_sven" then
				fooAllInOne.SvenCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_visage" then
				fooAllInOne.VisageCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_puck" then
				fooAllInOne.PuckCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_antimage" then
				fooAllInOne.AntiMageCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_phantom_assassin" then
				fooAllInOne.PACombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_obsidian_destroyer" then
				fooAllInOne.ODCombo(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_dazzle" then
				fooAllInOne.DazzleHelper(myHero, comboTarget)
			elseif NPC.GetUnitName(myHero) == "npc_dota_hero_centaur" then
				fooAllInOne.centaurCombo(myHero, comboTarget)
			end
		else
			if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.IsAlive(comboTarget) then	
				fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", comboTarget, nil)	
				fooAllInOne.itemUsage(myHero, comboTarget)
			end
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
		fooAllInOne.InvokerCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_arc_warden" then
		fooAllInOne.ArcWardenCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_furion" then
		fooAllInOne.ProphetHelper(myHero, comboTarget)
	end
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_clinkz" then
		if Menu.IsEnabled(fooAllInOne.optionHeroClinkzUlt) then
			fooAllInOne.ClinkzAutoUlt(myHero)
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_legion_commander" then
		fooAllInOne.LegionCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then
		fooAllInOne.MorphCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_necrolyte" then
		fooAllInOne.NecroCombo(myHero, comboTarget)
	end
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_magnataur" then
		fooAllInOne.magnusCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_nevermore" then
		fooAllInOne.SFCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_axe" then
		if Menu.IsEnabled(fooAllInOne.optionHeroAxeForceBlink) then
			fooAllInOne.ForceBlink(myHero, comboTarget, Menu.GetValue(fooAllInOne.optionHeroAxeForceBlinkRange))
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_centaur" then
		if Menu.IsEnabled(fooAllInOne.optionHeroCentaurForceBlink) then
			fooAllInOne.ForceBlink(myHero, comboTarget, Menu.GetValue(fooAllInOne.optionHeroCentaurForceBlinkRange))
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_shredder" then
		fooAllInOne.TimberCombo(myHero, comboTarget)
	end
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_zuus" then
		fooAllInOne.ZuusCombo(myHero, comboTarget)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_huskar" then
		fooAllInOne.huskarCombo(myHero, enemy)
	end

	if Menu.IsEnabled(fooAllInOne.optionDodgeItEnable) then	
		fooAllInOne.dodgerSelectItemorSkill(myHero)
		fooAllInOne.dodgerSkillAvailable(myHero)
		fooAllInOne.dodger(myHero)
	end
	
	if Menu.IsEnabled(fooAllInOne.optionUtilityEnable) then
		fooAllInOne.utilityItemUsage(myHero)
	end

	if Menu.IsEnabled(fooAllInOne.optionKillStealEnable) then
		if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
			if Menu.IsEnabled(fooAllInOne.optionKillStealInvoker) then
		--		fooAllInOne.AutoSunstrikeKillSteal(myHero)
				fooAllInOne.AutoSunstrikeKillStealNew(myHero)
			end
		else
			fooAllInOne.AutoNukeKillSteal(myHero)
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItems) then
		fooAllInOne.useDefensiveItems(myHero, comboTarget)
	end
	
	if Menu.IsEnabled(fooAllInOne.optionWardAwareness) then
		fooAllInOne.wardProcessing(myHero)
	end




fooAllInOne.lastHitter(myHero)



	if comboTarget == nil and Menu.IsEnabled(fooAllInOne.optionLockTarget) then
		if Menu.IsEnabled(fooAllInOne.optionMoveToCursor) then
			if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
				fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Input.GetWorldCursorPos())
				return
			end
		end	
	end

--fooAllInOne.KunkkaCombo(myHero, enemy)

--	for i = 1, NPCs.Count() do
--	local npc = NPCs.Get(i)
--	Log.Write(tostring(NPC.GetUnitName(npc)) .. " " .. tostring(Entity.GetOwner(npc)) .. " " .. tostring(Entity.OwnedBy(npc, myHero)))
--	end

--	local modifiers = NPC.GetModifiers(myHero)
--	for _, modifier in ipairs(modifiers) do
--	local modifierName = Modifier.GetName(modifier)
--	Log.Write(modifierName)
--	end

--
--	for i = 1, Abilities.Count() do
--	local abilities = Abilities.Get(i)
--	local abilityNames = Ability.GetName(abilities)
--	Log.Write(abilityNames)
--	end


end

function fooAllInOne.OnEntityDestroy(ent)

	if not ent then return end
	if not Menu.IsEnabled(fooAllInOne.optionWardAwareness) then return end
	if not Menu.IsEnabled(fooAllInOne.optionWardAwarenessRemove) then return end

	if not Heroes.GetLocal() then return end

	if not Entity.IsNPC(ent) then return end
	if Entity.IsSameTeam(Heroes.GetLocal(), ent) then return end
	if NPC.GetUnitName(ent) ~= "npc_dota_sentry_wards" and NPC.GetUnitName(ent) ~= "npc_dota_observer_wards" then return end

	if next(fooAllInOne.wardProcessingTable) ~= nil then
		for i, v in pairs(fooAllInOne.wardProcessingTable) do
			if v then
				if (v.pos - Entity.GetAbsOrigin(ent)):Length2D() <= 500 then
					fooAllInOne.wardProcessingTable[i] = nil
				end
			end
		end
	end

end

function fooAllInOne.OnParticleCreate(particle)

	if not particle then return end
	if not Heroes.GetLocal() then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(Heroes.GetLocal()), Enum.TeamType.TEAM_ENEMY))

	if particle.name == "teleport_start" then
		if particle.entityForModifiers ~= nil and particle.entityForModifiers ~= Heroes.GetLocal() then
			if not Entity.IsSameTeam(Heroes.GetLocal(), particle.entityForModifiers) then
				fooAllInOne.TPParticleIndex = particle.index
				fooAllInOne.TPParticleTime = GameRules.GetGameTime()
				fooAllInOne.TPParticleUnit = particle.entityForModifiers
			end
		end
	end

	if particle.name == "furion_sprout" then
		if particle.entityForModifiers ~= nil and Entity.IsSameTeam(Heroes.GetLocal(), particle.entityForModifiers) then
			fooAllInOne.InvokerKSparticleProcess[1][1] = particle.index
			fooAllInOne.InvokerKSparticleProcess[1][2] = particle.name
			fooAllInOne.InvokerKSparticleProcess[1][3] = GameRules.GetGameTime()
			fooAllInOne.InvokerKSparticleProcess[1][4] = particle.entityForModifiers
		end
	end

	if particle.name == "rattletrap_cog_deploy" then
		if particle.entity ~= nil and Entity.IsSameTeam(Heroes.GetLocal(), particle.entity) then
			fooAllInOne.InvokerKSparticleProcess[1][1] = particle.index
			fooAllInOne.InvokerKSparticleProcess[1][2] = particle.name
			fooAllInOne.InvokerKSparticleProcess[1][3] = GameRules.GetGameTime()
			fooAllInOne.InvokerKSparticleProcess[1][4] = particle.entity
			fooAllInOne.InvokerKSparticleProcess[1][5] = Entity.GetAbsOrigin(particle.entity)
		end
	end

	if particle.name == "disruptor_glimpse_targetend" then
		fooAllInOne.GlimpseParticleIndex = particle.index
		fooAllInOne.GlimpseParticleTime = GameRules.GetGameTime()
	end

	if particle.name == "disruptor_glimpse_targetstart" then
		fooAllInOne.GlimpseParticleIndexStart = particle.index
	end
	
end

function fooAllInOne.OnParticleUpdate(particle)

	if not particle then return end
	if not Heroes.GetLocal() then return end

	if particle.position:__tostring() == Vector(1.0, 1.0, 1.0):__tostring() then return end
	if particle.position:__tostring() == Vector(0.0, 0.0, 0.0):__tostring() then return end
	if particle.position:Length() < 75 then return end

	if particle.index  == fooAllInOne.TPParticleIndex then
		if particle.controlPoint == 0 then
			fooAllInOne.TPParticlePosition = particle.position
		end
	end

	if particle.index  == fooAllInOne.InvokerKSparticleProcess[1][1] then
		if particle.position:__tostring() ~= Vector(0.0, 150.0, 0.0):__tostring() then
			fooAllInOne.InvokerKSparticleProcess[1][5] = particle.position
		end
	end

	if particle.index  == fooAllInOne.GlimpseParticleIndex then
		if particle.position:Length2D() > 100 then
			fooAllInOne.GlimpseParticlePosition = particle.position
		end
	end

end

function fooAllInOne.OnParticleUpdateEntity(particle)

	if not particle then return end

	if not Heroes.GetLocal() then return end	
	if not particle.position then return end
	if particle.controlPoint > 0 then return end

	if particle.index  == fooAllInOne.GlimpseParticleIndexStart then
		if particle.entity ~= nil and not Entity.IsSameTeam(Heroes.GetLocal(), particle.entity) then
			if particle.position:__tostring() ~= Vector(0.0, 0.0, 0.0):__tostring() then
				fooAllInOne.GlimpseParticlePositionStart = particle.position
				fooAllInOne.GlimpseParticleUnit = particle.entity
			end
		end
	end

end

function fooAllInOne.OnUnitAnimation(animation)

	if not animation then return end
	if not Heroes.GetLocal() then return end

	if Menu.IsEnabled(fooAllInOne.optionDodgeItEnable) then
		fooAllInOne.dodgeProcessing(Heroes.GetLocal(), animation.unit, animation.activity, animation.castpoint)
	end

	if Entity.IsNPC(animation.unit) and NPC.IsLaneCreep(animation.unit) and not NPC.IsRanged(animation.unit) then
		if NPC.IsEntityInRange(Heroes.GetLocal(), animation.unit, 1000) then
			if fooAllInOne.lastHitterGetTarget(Heroes.GetLocal(), animation.unit) ~= nil then
				fooAllInOne.lastHitterTimingMapCreator(animation.unit, fooAllInOne.lastHitterGetTarget(Heroes.GetLocal(), animation.unit), (GameRules.GetGameTime() + animation.castpoint + 0.05 - NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING)))
			end
		end
	end

	if NPC.GetUnitName(Heroes.GetLocal()) ~= NPC.GetUnitName(animation.unit) then return end

	if animation.type == 1 then
		fooAllInOne.AttackAnimationCreate = os.clock()
		fooAllInOne.AttackParticleCreate = os.clock() + animation.castpoint
	end

end

function fooAllInOne.OnProjectile(projectile)

	if not projectile then return end
	if not Heroes.GetLocal() then return end

	if projectile.source and Entity.IsNPC(projectile.source) and (NPC.IsLaneCreep(projectile.source) or NPC.IsTower(projectile.source)) and projectile.isAttack then
		if NPC.IsEntityInRange(Heroes.GetLocal(), projectile.source, 1250) then
			if projectile.target and Entity.IsNPC(projectile.target) and NPC.IsLaneCreep(projectile.target) then
				local projectileSpeed = projectile.moveSpeed
				local distance = (Entity.GetAbsOrigin(projectile.source) - Entity.GetAbsOrigin(projectile.target)):Length()
				local travelTime = distance / projectileSpeed
				fooAllInOne.lastHitterTimingMapCreator(projectile.source, projectile.target, (GameRules.GetGameTime() + travelTime + 0.05 - NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING)))
			end
		end
	end

	if projectile.source ~= Heroes.GetLocal() then return end
	if not projectile.isAttack then return end

	fooAllInOne.AttackProjectileCreate = os.clock()

end

function fooAllInOne.OnLinearProjectileCreate(projectile)
	
	if not projectile or not projectile.source then return end
	
	if projectile.name ~= "puck_illusory_orb" then return end
	
	fooAllInOne.PuckOrbHitSim = {{projectile.origin, projectile.velocity}}

	
end

function fooAllInOne.OnParticleDestroy(particle)

	if not particle then return end
	if not Heroes.GetLocal() then return end

	if particle.index  == fooAllInOne.TPParticleIndex then
		fooAllInOne.TPParticlePosition = Vector()
		fooAllInOne.TPParticleTime = 0
		fooAllInOne.TPParticleUnit = nil
	end

end

function fooAllInOne.OnDraw()

	local myHero = Heroes.GetLocal()
        	if not myHero then return end
		if not Entity.IsAlive(myHero) then return end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then
		if Menu.IsEnabled(fooAllInOne.optionHeroMorphlingKill) then
			fooAllInOne.drawMorphlingKillIndicator(myHero)
		end
		if Menu.IsEnabled(fooAllInOne.optionHeroMorphDrawBoard) then
			fooAllInOne.MorphDrawBalanceBoard(myHero)
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_arc_warden" then
		if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenDraw) then
			fooAllInOne.drawArcWardenIndicators(fooAllInOne.ArcWardenEntity)
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_furion" then
		if Menu.IsEnabled(fooAllInOne.optionProphetDrawToggle) then
			fooAllInOne.DrawProphetHelperSwitch()
		end
		if Menu.IsEnabled(fooAllInOne.optionProphetDrawKS) or Menu.IsEnabled(fooAllInOne.optionProphetDrawKSminimap) then
			fooAllInOne.DrawProphetAwareness(myHero)
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
		fooAllInOne.InvokerDraw(myHero)
		fooAllInOne.InvokerDrawShort(myHero)
		fooAllInOne.invokerDisplayDrawDisplay(myHero)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_phantom_assassin" then
		fooAllInOne.DrawPADaggerSwitch()
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_skywrath_mage" then
		fooAllInOne.skywrathComboDrawDamage(myHero)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_necrolyte" then
		fooAllInOne.necroComboDrawDamage(myHero)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_nevermore" then
		fooAllInOne.SFComboDrawRequiemDamage(myHero)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_rattletrap" then
		fooAllInOne.clockwerkDrawHookIndicator(myHero)
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_windrunner" then
		fooAllInOne.windrunnerDrawShackleIndicator(myHero)
	end

	if Menu.IsEnabled(fooAllInOne.optionWardAwareness) then
		fooAllInOne.drawWard(myHero)
	end

	fooAllInOne.lastHitterDrawing(myHero)

end

function fooAllInOne.OnPrepareUnitOrders(orders)

	if not orders then return true end
	if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_TRAIN_ABILITY then return true end

	local myHero = Heroes.GetLocal()
    		if not myHero then return true end
    
	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerInstanceHelper) then
		if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
			fooAllInOne.invokerProcessInstances(myHero, orders.order)
			return true
		end
	end
	
	if NPC.GetUnitName(myHero) == "npc_dota_hero_invoker" then
		local quas = NPC.GetAbility(myHero, "invoker_quas")
		local wex = NPC.GetAbility(myHero, "invoker_wex")
		local exort = NPC.GetAbility(myHero, "invoker_exort")
		if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET then
			if orders.ability == quas or orders.ability == wex or orders.ability == exort then
				fooAllInOne.InvokerCaptureManualInstances = os.clock()
				return true
			end
		end
	end

	
	if Menu.IsEnabled(fooAllInOne.optionLinkensManual) then
		if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET then
			if orders.target ~= nil and Entity.IsHero(orders.target) and not Entity.IsSameTeam(myHero, orders.target) then
				if NPC.IsLinkensProtected(orders.target) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), orders.target)
						return true
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroMagnusAutoEmpower) then
		if NPC.GetUnitName(myHero) == "npc_dota_hero_magnataur" then
			if orders.order == Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET then
				if orders.target and Entity.IsNPC(orders.target) and not Entity.IsSameTeam(myHero, orders.target) then
					fooAllInOne.magnusAutoEmpower(myHero)
					return true
				end
			end
		end
	end

    return true

end

-- last Hitter
function fooAllInOne.lastHitGetNearestAndLowestTarget(myHero, targetSelector)

	if not myHero then return end

	local targetTable = NPCs.InRadius(Input.GetWorldCursorPos(), 100, Entity.GetTeamNum(myHero), targetSelector)

	if #targetTable <= 1 then
		local targets = Input.GetNearestUnitToCursor(Entity.GetTeamNum(myHero), targetSelector)
		local target
		if Entity.IsNPC(targets) and Entity.IsAlive(targets) and not Entity.IsDormant(targets) and NPC.IsLaneCreep(targets) and not NPC.IsWaitingToSpawn(targets) then
			target = targets
		end
		return target
	else
		local tempTable = {}
		for i, v in ipairs(targetTable) do
			if v and Entity.IsNPC(v) and Entity.IsAlive(v) and not Entity.IsDormant(v) and NPC.IsLaneCreep(v) and not NPC.IsWaitingToSpawn(v) then
				local creepHP = Entity.GetHealth(v)
				table.insert(tempTable, {v, creepHP})
			end
		end

		if next(tempTable) ~= nil then
			table.sort(tempTable, function(a, b)
       				return a[2] < b[2]
    			end)
		end

		if next(tempTable) ~= nil then
			return tempTable[1][1]
		end

	end

	return

end

function fooAllInOne.lastHitterSimpleTarget(myHero, targetSelector)

	if not myHero then return end

	local target = fooAllInOne.lastHitGetNearestAndLowestTarget(myHero, targetSelector)

	if Menu.IsKeyDown(fooAllInOne.optionLastHitKey) then
		if fooAllInOne.lastHitterManualTarget == nil then
			if target and NPC.IsPositionInRange(target, Input.GetWorldCursorPos(), 500, 0) then
				fooAllInOne.lastHitterManualTarget = target
			else
				fooAllInOne.lastHitterManualTarget = nil
			end
		end
	else
		fooAllInOne.lastHitterManualTarget = nil
	end

	if fooAllInOne.lastHitterManualTarget ~= nil then
		if not Entity.IsAlive(fooAllInOne.lastHitterManualTarget) then
			fooAllInOne.lastHitterManualTarget = nil
		elseif Entity.IsDormant(fooAllInOne.lastHitterManualTarget) then
			fooAllInOne.lastHitterManualTarget = nil
		elseif not NPC.IsEntityInRange(myHero, fooAllInOne.lastHitterManualTarget, 1000) then
			fooAllInOne.lastHitterManualTarget = nil
		end
	end

	return

end

function fooAllInOne.lastHitter(myHero)
	
	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionLastHitEnable) then return end

	local targetSelector
		if Menu.GetValue(fooAllInOne.optionLastHitStyle) == 0 then
			targetSelector = Enum.TeamType.TEAM_BOTH
		elseif Menu.GetValue(fooAllInOne.optionLastHitStyle) == 1 then
			targetSelector = Enum.TeamType.TEAM_ENEMY
		elseif Menu.GetValue(fooAllInOne.optionLastHitStyle) == 2 then
			targetSelector = Enum.TeamType.TEAM_FRIEND
		end

	local targets = NPC.GetUnitsInRadius(myHero, 1000, targetSelector)

	local increasedAS = NPC.GetIncreasedAttackSpeed(myHero)

	local attackPoint = 0
	for i, v in pairs(fooAllInOne.attackPointTable) do
		if i == NPC.GetUnitName(myHero) then
			attackPoint = v[1] / (1 + (increasedAS/100))
			break
		end
	end

	fooAllInOne.lastHitterTimingMapCleaner(myHero, targets)
	fooAllInOne.lastHitterPredictDieTime(myHero)
	fooAllInOne.lastHitterDieTimeCleaner(myHero, attackPoint)
	fooAllInOne.lastHitTargetIndicator(myHero, target)
	fooAllInOne.lastHitterSimpleTarget(myHero, targetSelector)

	if next(targets) == nil then return end
	if #targets < 1 then return end

	fooAllInOne.lastHitterExecuteLastHit(myHero, attackPoint)
			
end

function fooAllInOne.lastHitterExecuteLastHit(myHero, attackPoint)

	if not myHero then return end

	local curTime = GameRules.GetGameTime()

	if Menu.IsEnabled(fooAllInOne.optionLastHitDrawRange) and NPC.IsRanged(myHero) then
		if Menu.IsKeyDown(fooAllInOne.optionLastHitKey) then
			Engine.ExecuteCommand("dota_range_display " .. NPC.GetAttackRange(myHero))
		else
			Engine.ExecuteCommand("dota_range_display 0")
		end
	end

	local delaySetting = 0.2 * attackPoint
		if delaySetting > 0.100 then
			delaySetting = 0.100
		elseif delaySetting < 0.055 then
			delaySetting = 0.055
		end

	if Menu.IsKeyDown(fooAllInOne.optionLastHitKey) then
		local target = fooAllInOne.lastHitterManualTarget
		if target ~= nil then
			fooAllInOne.lastHitTargetIndicator(myHero, target)
			if Entity.IsSameTeam(myHero, target) and Entity.GetHealth(target) > 0.5 * Entity.GetMaxHealth(target) then
				return
			end
			if fooAllInOne.lastHitterTimingOffsetter(myHero, target) ~= nil then

				if fooAllInOne.lastHitterPredictedDieTime[target] == nil then
					if (GameRules.GetGameTime() - fooAllInOne.lastHitterDelay) > delaySetting then
						if fooAllInOne.lastHitInAttackAnimation(myHero, attackPoint) == false then
							Player.AttackTarget(Players.GetLocal(), myHero, target, false)
							fooAllInOne.lastHitterDelay = GameRules.GetGameTime()
						--	Log.Write("attack")
						else
							Player.HoldPosition(Players.GetLocal(), myHero, false)
							Player.AttackTarget(Players.GetLocal(), myHero, target, true)
							fooAllInOne.lastHitterDelay = GameRules.GetGameTime()
						--	Log.Write("hold prepare")
						end
					end
				else
					if (GameRules.GetGameTime() - fooAllInOne.lastHitterDelay) > 0.045 then
						if fooAllInOne.lastHitInAttackAnimation(myHero, attackPoint) == false then
							Player.AttackTarget(Players.GetLocal(), myHero, target, false)
							fooAllInOne.lastHitterDelay = GameRules.GetGameTime()
						--	Log.Write("attack")
						else
							if (GameRules.GetGameTime() - (os.clock() - fooAllInOne.AttackAnimationCreate)) + fooAllInOne.lastHitterTimingOffsetter(myHero, target) < fooAllInOne.lastHitterPredictedDieTime[target] + (Menu.GetValue(fooAllInOne.optionLastHitOffset) / 20) then
								Player.HoldPosition(Players.GetLocal(), myHero, false)
								Player.AttackTarget(Players.GetLocal(), myHero, target, true)
								fooAllInOne.lastHitterDelay = GameRules.GetGameTime()
							--	Log.Write("hold kill")
							end
						end
					end
				end
			end
		end
	end
	return

end

function fooAllInOne.myCreepDamageAdjuster(myHero, target)

	if not myHero then return 0 end

	local quelling = NPC.GetItem(myHero, "item_quelling_blade", true)
	local talon = NPC.GetItem(myHero, "item_iron_talon", true)

	local minCreepDamage = NPC.GetMinDamage(myHero)
	local bonusCreepDamage = 0
		if quelling or talon then
			if NPC.IsRanged(myHero) then
				bonusCreepDamage = 7
			else
				bonusCreepDamage = 24
			end
		end

	local overallCreepDamage = minCreepDamage + bonusCreepDamage

	return math.floor(overallCreepDamage)

end

function fooAllInOne.lastHitInAttackAnimation(myHero, attackPoint)

	if not myHero then return false end
	if not attackPoint then return false end
		if attackPoint == 0 then return false end

	if os.clock() >= (fooAllInOne.AttackAnimationCreate) then
		if os.clock() <= (fooAllInOne.AttackAnimationCreate + attackPoint) then
			return true
		end
	end

	return false

end

function fooAllInOne.lastHitterDrawing(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionLastHitDrawCreepEnable) then return end
	
	local count = 0
	for k, l in pairs(fooAllInOne.lastHitterTimingMap) do
		if k then
			for z, u in pairs(l) do
				count = count + 1
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionLastHitDrawCreepAttack) then
		for i, v in pairs(fooAllInOne.lastHitterTimingMap) do
			if i and Entity.IsNPC(i) then
				local count = 0
				for z, u in pairs(v) do
					count = count + 1
				end
				local pos = Entity.GetAbsOrigin(i)
				local posY = NPC.GetHealthBarOffset(i)
					pos:SetZ(pos:GetZ() + posY)
				local x, y, visible = Renderer.WorldToScreen(pos)
				if Menu.GetValue(fooAllInOne.optionLastHitDrawStyle) < 1 then
					if visible then
						if fooAllInOne.lastHitterPredictedDieTime[i] == nil then
							Renderer.SetDrawColor(255,50,50,175)
							Renderer.DrawText(fooAllInOne.skywrathFont, x-38, y-30, "Attacker:      " .. count, 0)
						end
					end
				else
					if not Entity.IsSameTeam(myHero, i) then
						if visible then
							if fooAllInOne.lastHitterPredictedDieTime[i] == nil then
								Renderer.SetDrawColor(255,50,50,175)
								Renderer.DrawText(fooAllInOne.skywrathFont, x-38, y-30, "Attacker:      " .. count, 0)
							end
						end
					end
				end
			end
		end
	end	

	if next(fooAllInOne.lastHitterPredictedDieTime) == nil then return end

	if Menu.IsEnabled(fooAllInOne.optionLastHitDrawCreepTimer) then
		local imageHandle = fooAllInOne.lastHitterKillableImage
			if imageHandle == nil then
				imageHandle = Renderer.LoadImage("resource/flash3/images/broadcast/statpop_exclaim.png")
				fooAllInOne.lastHitterKillableImage = imageHandle
			end
		for i, v in pairs(fooAllInOne.lastHitterPredictedDieTime) do
			local target = i
			local dieTime = v
			if target and Entity.IsNPC(target) then
				local pos = Entity.GetAbsOrigin(target)
				local posY = NPC.GetHealthBarOffset(target)
					pos:SetZ(pos:GetZ() + posY)	
				local x, y, visible = Renderer.WorldToScreen(pos)
				if Menu.GetValue(fooAllInOne.optionLastHitDrawStyle) < 1 then
					if visible then
						if dieTime - GameRules.GetGameTime() > fooAllInOne.lastHitterTimingOffsetter(myHero, target) then
							Renderer.SetDrawColor(255,215,0,200)
							Renderer.DrawImage(imageHandle, x-20, y-47, 40, 40)
						else
							Renderer.SetDrawColor(50,205,50,200)
							Renderer.DrawImage(imageHandle, x-20, y-47, 40, 40)
						end
					end
				else
					if not Entity.IsSameTeam(myHero, i) then
						if visible then
							if dieTime - GameRules.GetGameTime() > fooAllInOne.lastHitterTimingOffsetter(myHero, target) then
								Renderer.SetDrawColor(255,215,0,200)
								Renderer.DrawImage(imageHandle, x-20, y-47, 40, 40)
							else
								Renderer.SetDrawColor(50,205,50,200)
								Renderer.DrawImage(imageHandle, x-20, y-47, 40, 40)
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.lastHitterPredictDieTime(myHero)

	if not myHero then return end
	if next(fooAllInOne.lastHitterTimingMap) == nil then return end

	local curTime = GameRules.GetGameTime()

	if next(fooAllInOne.lastHitterPredictedDieTime) ~= nil then
		table.sort(fooAllInOne.lastHitterPredictedDieTime, function(a, b)
       			return a < b
    		end)
	end

	for i, v in pairs(fooAllInOne.lastHitterTimingMap) do
		local target = i
		local targetHP = 99999
			if Entity.IsNPC(target) then
				targetHP = Entity.GetHealth(target) + NPC.GetHealthRegen(target)
			end

		local myAttackDMG = NPC.GetDamageMultiplierVersus(myHero, target) * ((fooAllInOne.myCreepDamageAdjuster(myHero, target) + NPC.GetBonusDamage(myHero)) * NPC.GetArmorDamageMultiplier(target))

		if targetHP <= myAttackDMG then
			fooAllInOne.lastHitterPredictedDieTime[target] = curTime
			break
			return
		end

		local attackerCount = 0
		for k, l in pairs(v) do
			attackerCount = attackerCount + 1
		end

		local reversMap = {}
		for a, s in pairs(v) do
			if s > GameRules.GetGameTime() then
				table.insert(reversMap, {s, a})
			end
		end

		local timingOffset = fooAllInOne.lastHitterTimingOffsetter(myHero, target)

		if timingOffset > 0.46 then
			if next(reversMap) ~= nil then
				for x = 1, #reversMap do
					table.insert(reversMap, {reversMap[x][1] + NPC.GetAttackTime(reversMap[x][2]), reversMap[x][2]})
				end
			end
		end
		
		table.sort(reversMap, function(a, b)
       			return a[1] < b[1]
    		end)
		
		local remainingHP = targetHP
		for b, n in ipairs(reversMap) do
			local impactTime = fooAllInOne.utilityRoundNumber(n[1], 4)
			local source = n[2]
			local attackDMGcreep = NPC.GetDamageMultiplierVersus(source, target) * ((NPC.GetMinDamage(source) + NPC.GetBonusDamage(source)) * NPC.GetArmorDamageMultiplier(target))	
			if remainingHP > math.floor(myAttackDMG * 0.975) then
				remainingHP = remainingHP - math.floor(attackDMGcreep)
			else
				if remainingHP <= 2 then
					if fooAllInOne.lastHitterPredictedDieTime[target] == nil then
						if b > 1 then
							fooAllInOne.lastHitterPredictedDieTime[target] = reversMap[b-1][1]
							break
							return
						end
					else
						if impactTime < fooAllInOne.lastHitterPredictedDieTime[target] then
							if b > 1 then
								fooAllInOne.lastHitterPredictedDieTime[target] = reversMap[b-1][1]
								break
								return
							end
						end
					end
				else
					if fooAllInOne.lastHitterPredictedDieTime[target] == nil then
						fooAllInOne.lastHitterPredictedDieTime[target] = impactTime
						break
						return
					else
						if impactTime < fooAllInOne.lastHitterPredictedDieTime[target] then
							fooAllInOne.lastHitterPredictedDieTime[target] = impactTime
							break
							return
						end
					end
				end
			end
		end
	end
	
end

function fooAllInOne.lastHitterDieTimeCleaner(myHero, attackPoint)

	if next(fooAllInOne.lastHitterPredictedDieTime) == nil then return end

	if not myHero then
		fooAllInOne.lastHitterPredictedDieTime = {}
	end

	if not Entity.IsAlive(myHero) then
		fooAllInOne.lastHitterPredictedDieTime = {}
	end

	if #NPC.GetUnitsInRadius(myHero, 1000, Enum.TeamType.TEAM_BOTH) <= 1 then
		fooAllInOne.lastHitterPredictedDieTime = {}
	end

	if next(fooAllInOne.lastHitterPredictedDieTime) ~= nil then
		for i, v in pairs(fooAllInOne.lastHitterPredictedDieTime) do
			local target = i
			local dieTime = v
			if not target then
				fooAllInOne.lastHitterPredictedDieTime[i] = nil
				break
				return
			end
			if target and Entity.IsNPC(target) and not Entity.IsAlive(target) then
				fooAllInOne.lastHitterPredictedDieTime[i] = nil
				break
				return
			end
			if GameRules.GetGameTime() >= dieTime + attackPoint then
				fooAllInOne.lastHitterPredictedDieTime[i] = nil
				break
				return
			end
		end
	end	

end

function fooAllInOne.lastHitterTimingMapCleaner(myHero, targets)

	if not myHero then
		fooAllInOne.lastHitterTimingMap = {}
	end

	if not Entity.IsAlive(myHero) then
		fooAllInOne.lastHitterTimingMap = {}
	end

	if next(targets) == nil then
		fooAllInOne.lastHitterTimingMap = {}
	end

	if targets == nil then
		fooAllInOne.lastHitterTimingMap = {}
	end

	for i, v in ipairs(targets) do
		if v and Entity.IsNPC(v) and Entity.IsAlive(v) and not Entity.IsDormant(v) and NPC.IsLaneCreep(v) and not NPC.IsWaitingToSpawn(v) then
			if fooAllInOne.lastHitterTimingMap[v] == nil then
				fooAllInOne.lastHitterTimingMap[v] = {}
			end
		end
	end

	if next(fooAllInOne.lastHitterTimingMap) == nil then return end

	for i, v in pairs(fooAllInOne.lastHitterTimingMap) do
		if fooAllInOne.utilityIsInTable(targets, i) == false then
			fooAllInOne.lastHitterTimingMap[i] = nil
				break
				return
		end
		if i and not Entity.IsAlive(i) then
			fooAllInOne.lastHitterTimingMap[i] = nil
				break
				return
		end
		for e, r in pairs(v) do
			if Menu.GetValue(fooAllInOne.optionLastHitStyle) == 0 and fooAllInOne.utilityIsInTable(targets, e) == false then
				fooAllInOne.lastHitterTimingMap[i][e] = nil
				break
				return
			end
			if e and not Entity.IsNPC(e) then
				fooAllInOne.lastHitterTimingMap[i][e] = nil
				break
				return
			end
			if e and not Entity.IsAlive(e) then
				fooAllInOne.lastHitterTimingMap[i][e] = nil
				break
				return
			end
			if e and NPC.IsLaneCreep(e) and not NPC.IsRanged(e) and not NPC.IsEntityInRange(e, i, 1116) then
				fooAllInOne.lastHitterTimingMap[i][e] = nil
				break
				return
			end
			local creepAttackSpeed = NPC.GetAttackTime(e)
			if e and GameRules.GetGameTime() > r + creepAttackSpeed then
				fooAllInOne.lastHitterTimingMap[i][e] = nil
				break
				return
			end
		end
	end
	
end

function fooAllInOne.utilityIsInTable(table, arg)

	if not table then return false end
	if not arg then return false end
	if next(table) == nil then return false end

	for i, v in pairs(table) do
		if i == arg then
			return true
		end
		if type(v) ~= 'table' and v == arg then
			return true
		end
	end

	return false

end

function fooAllInOne.lastHitterTimingMapCreator(sourceEnt, targetEnt, impactTime)

	if not sourceEnt then return end
	if not targetEnt then return end

	for i, v in pairs(fooAllInOne.lastHitterTimingMap) do
		if i ~= targetEnt then
			if fooAllInOne.utilityIsInTable(v, sourceEnt) == true then
				fooAllInOne.lastHitterTimingMap[i][sourceEnt] = nil
			end
		end
	end

	if fooAllInOne.lastHitterTimingMap[targetEnt] ~= nil then
		fooAllInOne.lastHitterTimingMap[targetEnt][sourceEnt] = impactTime
	end
	
end

function fooAllInOne.lastHitterGetTarget(myHero, creep)

	if not myHero then return end
	if not creep then return end

	if not Entity.IsNPC(creep) then return end
	if not NPC.IsLaneCreep(creep) then return end
	if NPC.IsRanged(creep) then return end
	if not Entity.IsAlive(creep) then return end
	
	local creepRotation = Entity.GetRotation(creep):GetForward():Normalized()
	
	local targets = Entity.GetUnitsInRadius(creep, 128, Enum.TeamType.TEAM_ENEMY)
		if next(targets) == nil then return end
		if #targets < 1 then return end

	if #targets == 1 then
		if Entity.IsNPC(targets[1]) and NPC.IsLaneCreep(targets[1]) then
			return targets[1]
		end
	else
		local adjustedHullSize = 20
		for i, v in ipairs(targets) do
			if v and Entity.IsNPC(v) and NPC.IsLaneCreep(v) and Entity.IsAlive(v) then
				local vpos = Entity.GetAbsOrigin(v)
				local vposZ = vpos:GetZ()
				local pos = Entity.GetAbsOrigin(creep)
				for i = 1, 8 do
					local searchPos = pos + creepRotation:Scaled(25*(8-i))
						searchPos:SetZ(vposZ)
					if NPC.IsPositionInRange(v, searchPos, adjustedHullSize, 0) then
						return v
					end
				end
			end
		end
	end

	return

end

function fooAllInOne.lastHitterTimingOffsetter(myHero, target)

	if not myHero then return end
	if not target then return end
	if target and not Entity.IsNPC(target) then return end

	local increasedAS = NPC.GetIncreasedAttackSpeed(myHero)

	local attackPoint = 0
	local projectileOffset = 0
	for i, v in pairs(fooAllInOne.attackPointTable) do
		if i == NPC.GetUnitName(myHero) then
			if v[3] > 0 then
				attackPoint = v[1] / (1 + (increasedAS/100))
				projectileOffset = ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(target)):Length2D()) / v[3]
				break
			else
				attackPoint = v[1] / (1 + (increasedAS/100))
				projectileOffset = 0
				break
			end
		end
	end

	local overallOffset = attackPoint + projectileOffset + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)

	return overallOffset

end

function fooAllInOne.utilityRoundNumber(number, digits)

	if not number then return end

  	local mult = 10^(digits or 0)
  	return math.floor(number * mult + 0.5) / mult

end

function fooAllInOne.utilityGetTableLength(table)

	if not table then return 0 end
	if next(table) == nil then return 0 end

	local count = 0
	for i, v in pairs(table) do
		count = count + 1
	end

	return count

end

function fooAllInOne.lastHitTargetIndicator(myHero, target)

	if not myHero then return end

	if Menu.IsKeyDown(fooAllInOne.optionLastHitKey) then
		if target then	
			if fooAllInOne.lastHitcurrentParticle == 0 then
				local ringParticle = Particle.Create("particles/ui_mouseactions/range_finder_tower_aoe_target_ring.vpcf", Enum.ParticleAttachment.PATTACH_ABSORIGIN_FOLLOW, target)
				fooAllInOne.lastHitcurrentParticle = ringParticle
		
				Particle.SetControlPoint(ringParticle, 3, Vector(1, 1, 1))
				Particle.SetControlPoint(ringParticle, 4, Vector(255, 255, 255))
				Particle.SetControlPoint(ringParticle, 6, Vector(1, 0, 0))
				Particle.SetControlPoint(ringParticle, 8, Vector(1, 0, 0))

			end
	
			Particle.SetControlPoint(fooAllInOne.lastHitcurrentParticle, 0, Entity.GetAbsOrigin(target))
			Particle.SetControlPoint(fooAllInOne.lastHitcurrentParticle, 2, Entity.GetAbsOrigin(target))
			Particle.SetControlPoint(fooAllInOne.lastHitcurrentParticle, 7, Entity.GetAbsOrigin(target))
		end
	
	else
		if fooAllInOne.lastHitcurrentParticle > 0 then
			Particle.Destroy(fooAllInOne.lastHitcurrentParticle)
			fooAllInOne.lastHitcurrentParticle = 0
		end			
	end

end

-- utility functions
function fooAllInOne.heroSupported(myHero)

	if not myHero then return end
	local supportedHeroList = { "npc_dota_hero_axe",
		"npc_dota_hero_rattletrap", 
		"npc_dota_hero_skywrath_mage",
		"npc_dota_hero_tiny",
		"npc_dota_hero_windrunner",
		"npc_dota_hero_ember_spirit",
		"npc_dota_hero_ursa",
		"npc_dota_hero_templar_assassin",
		"npc_dota_hero_legion_commander",
		"npc_dota_hero_shredder",
		"npc_dota_hero_slardar",
		"npc_dota_hero_clinkz",
		"npc_dota_hero_queenofpain",
		"npc_dota_hero_sven",
		"npc_dota_hero_visage",
		"npc_dota_hero_morphling",
		"npc_dota_hero_puck",
		"npc_dota_hero_invoker",
		"npc_dota_hero_arc_warden",
		"npc_dota_hero_furion",
		"npc_dota_hero_antimage",
		"npc_dota_hero_phantom_assassin",
		"npc_dota_hero_zuus",
		"npc_dota_hero_huskar",
		"npc_dota_hero_necrolyte",
		"npc_dota_hero_obsidian_destroyer",
		"npc_dota_hero_nevermore",
		"npc_dota_hero_dazzle",
		"npc_dota_hero_centaur",
		"npc_dota_hero_magnataur"
			}

	for _, heroName in pairs(supportedHeroList) do
		if heroName == NPC.GetUnitName(myHero) then
			return true
		end
	end
	return false
end

function fooAllInOne.setOrderItem(printed)

	fooAllInOne.ItemCastOrder = {
        	{Menu.GetValue(fooAllInOne.optionItemVeil), "item_veil_of_discord", "position"},
        	{Menu.GetValue(fooAllInOne.optionItemHex), "item_sheepstick", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemBlood), "item_bloodthorn", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemeBlade), "item_ethereal_blade", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemOrchid),"item_orchid", "target"},
        	{Menu.GetValue(fooAllInOne.optionItemAtos),"item_rod_of_atos", "target"},
		{Menu.GetValue(fooAllInOne.optionItemAbyssal),"item_abyssal_blade", "target"},
		{Menu.GetValue(fooAllInOne.optionItemHalberd),"item_heavens_halberd", "target"},
		{Menu.GetValue(fooAllInOne.optionItemShivas),"item_shivas_guard", "no target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_2", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_3", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_4", "target"},
		{Menu.GetValue(fooAllInOne.optionItemDagon),"item_dagon_5", "target"},
		{Menu.GetValue(fooAllInOne.optionItemUrn),"item_urn_of_shadows", "target"},
	--	{Menu.GetValue(fooAllInOne.optionItemManta),"item_manta", "no target"},
	--	{Menu.GetValue(fooAllInOne.optionItemMjollnir),"item_mjollnir", "target"},
		{Menu.GetValue(fooAllInOne.optionItemMedallion),"item_medallion_of_courage", "target"},
		{Menu.GetValue(fooAllInOne.optionItemCrest),"item_solar_crest", "target"}
    				}

    	table.sort(fooAllInOne.ItemCastOrder, function(a, b)
        	return a[1] > b[1]
    	end)
	Log.Write(".....Item Cast Order....")
	local printed = false
		if not printed then
			for k,v in ipairs(fooAllInOne.ItemCastOrder) do
			Log.Write(v[1]..':'..v[2])
			printed = true
			end
		end
end			

function fooAllInOne.setOrderLinkens(printed)
	
	fooAllInOne.LinkensBreakerItemOrder = {
        	{Menu.GetValue(fooAllInOne.optionLinkensForce), "item_force_staff"},
        	{Menu.GetValue(fooAllInOne.optionLinkensEul), "item_cyclone"},
        	{Menu.GetValue(fooAllInOne.optionLinkensHalberd), "item_heavens_halberd"},
        	{Menu.GetValue(fooAllInOne.optionLinkensHex), "item_sheepstick"},
        	{Menu.GetValue(fooAllInOne.optionLinkensBlood),"item_bloodthorn"},
        	{Menu.GetValue(fooAllInOne.optionLinkensOrchid),"item_orchid"},
		{Menu.GetValue(fooAllInOne.optionLinkensPike),"item_hurricane_pike"}
    				}

    	table.sort(fooAllInOne.LinkensBreakerItemOrder, function(a, b)
        	return a[1] > b[1]
    	end)
	Log.Write(".....Linkens Breaker Priorization Order....")
	local printed = false
		if not printed then
			for k,v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
			Log.Write(v[1]..':'..v[2])
			printed = true
			end
		end			
	
end

function fooAllInOne.OnMenuOptionChange(option, old, new)

    	if option == fooAllInOne.optionItemVeil or
		option == fooAllInOne.optionItemHex or
		option == fooAllInOne.optionItemBlood or
		option == fooAllInOne.optionItemeBlade or 
		option == fooAllInOne.optionItemOrchid or 
		option == fooAllInOne.optionItemAtos or 
		option == fooAllInOne.optionItemAbyssal or 
		option == fooAllInOne.optionItemHalberd or 
		option == fooAllInOne.optionItemShivas or 
		option == fooAllInOne.optionItemDagon or 
		option == fooAllInOne.optionItemUrn or
		option == fooAllInOne.optionItemManta or
		option == fooAllInOne.optionItemMjollnir or
		option == fooAllInOne.optionItemMedallion or
		option == fooAllInOne.optionItemCrest then
			fooAllInOne.setOrderItem(false)
	end
	
	if option == fooAllInOne.optionLinkensForce or
		option == fooAllInOne.optionLinkensEul or
		option == fooAllInOne.optionLinkensHalberd or
		option == fooAllInOne.optionLinkensHex or
		option == fooAllInOne.optionLinkensBlood or
		option == fooAllInOne.optionLinkensOrchid or
		option == fooAllInOne.optionLinkensPike then
        		fooAllInOne.setOrderLinkens(false)
    	end

	if option == fooAllInOne.invokerDisplaySizeOption then
        	fooAllInOne.invokerDisplayInit()
    	end

	if option == fooAllInOne.invokerPanelSizeOption then
		fooAllInOne.invokerPanelInit()
    	end

	if option == fooAllInOne.dodgeItOptionTable[1] or 
		option == fooAllInOne.dodgeItOptionTable[2] or
		option == fooAllInOne.dodgeItOptionTable[3] or
		option == fooAllInOne.dodgeItOptionTable[4] or
		option == fooAllInOne.dodgeItOptionTable[5] or
		option == fooAllInOne.dodgeItOptionTable[6] or
		option == fooAllInOne.dodgeItOptionTable[7] then
		fooAllInOne.dodgeItReadyTable = {}
	end

end

function fooAllInOne.targetChecker(genericEnemyEntity)

	if genericEnemyEntity and not NPC.IsDormant(genericEnemyEntity) and not NPC.IsIllusion(genericEnemyEntity) and Entity.GetHealth(genericEnemyEntity) > 0 then

		if NPC.GetUnitName(genericEnemyEntity) == "npc_dota_hero_antimage" and NPC.HasItem(genericEnemyEntity, "item_ultimate_scepter", true) and NPC.HasModifier(genericEnemyEntity, "modifier_antimage_spell_shield") and Ability.IsReady(NPC.GetAbility(genericEnemyEntity, "antimage_spell_shield")) then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_item_lotus_orb_active") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_winter_wyvern_winters_curse") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_item_blade_mail_reflect") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_nyx_assassin_spiked_carapace") then
			return
		end
		if NPC.HasModifier(genericEnemyEntity, "modifier_skeleton_king_reincarnation_scepter_active") then
			return
		end

	return genericEnemyEntity
	end	
end

function fooAllInOne.makeDelay(sec)

	fooAllInOne.delay = sec + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)
	fooAllInOne.lastTick = os.clock()

end

function fooAllInOne.noItemCastFor(sec)

	fooAllInOne.itemDelay = sec
	fooAllInOne.lastItemTick = os.clock()

end

function fooAllInOne.SleepReady(sleep)

	if (os.clock() - fooAllInOne.lastTick) >= sleep then
		return true
	end
	return false

end

function fooAllInOne.ItemSleepReady(sleep)

	if (os.clock() - fooAllInOne.lastItemCast) >= sleep then
		return true
	end
	return false

end

function fooAllInOne.GetAvgLatency()

	local AVGlatency = NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2
	return AVGlatency

end

function fooAllInOne.CastAnimationDelay(ability)

	if not ability then return end

	local abilityAnimation = Ability.GetCastPoint(ability) + fooAllInOne.GetAvgLatency()

	return abilityAnimation

end
	
function fooAllInOne.castLinearPrediction(myHero, enemy, adjustmentVariable)

	if not myHero then return end
	if not enemy then return end

	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)


	local cosGamma = (NPC.GetAbsOrigin(myHero) - enemyOrigin):Dot2D(enemyRotation:Scaled(100)) / ((NPC.GetAbsOrigin(myHero) - enemyOrigin):Length2D() * enemyRotation:Scaled(100):Length2D())
		if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(fooAllInOne.GetMoveSpeed(enemy) * adjustmentVariable * (1 - cosGamma)))
			end
		end
end

function fooAllInOne.castPrediction(myHero, enemy, adjustmentVariable)

	if not myHero then return end
	if not enemy then return end

	local enemyRotation = Entity.GetRotation(enemy):GetVectors()
		enemyRotation:SetZ(0)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)

	if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin
			else return enemyOrigin:__add(enemyRotation:Normalized():Scaled(fooAllInOne.GetMoveSpeed(enemy) * adjustmentVariable))
			end
	end
end

function fooAllInOne.isEnemyTurning(enemy)

	if enemy == nil then return true end
	if not NPC.IsRunning(enemy) then return true end

	local rotationSpeed = Entity.GetAngVelocity(enemy):Length2D()
	if NPC.IsRunning(enemy) then
		table.insert(fooAllInOne.rotationTable, rotationSpeed)
			if #fooAllInOne.rotationTable > (Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn) + 1) then
				table.remove(fooAllInOne.rotationTable, 1)
			end
	end
	
	if #fooAllInOne.rotationTable < Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn) then 
		return true
	else
		local rotationSpeedCounter = 0
		i = 1
		repeat
			rotationSpeedCounter = rotationSpeedCounter + fooAllInOne.rotationTable[#fooAllInOne.rotationTable + 1 - i]
			i = i + 1
		until i > Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn)

		if rotationSpeedCounter / Menu.GetValue(fooAllInOne.optionKillStealInvokerTurn) <= 10 then
			return false
		else
			return true
		end
	end
 
end

function fooAllInOne.GetMoveSpeed(enemy)

	if not enemy then return end

	local base_speed = NPC.GetBaseSpeed(enemy)
	local bonus_speed = NPC.GetMoveSpeed(enemy) - NPC.GetBaseSpeed(enemy)
	local modifierHex
    	local modSheep = NPC.GetModifier(enemy, "modifier_sheepstick_debuff")
    	local modLionVoodoo = NPC.GetModifier(enemy, "modifier_lion_voodoo")
    	local modShamanVoodoo = NPC.GetModifier(enemy, "modifier_shadow_shaman_voodoo")

	if modSheep then
		modifierHex = modSheep
	end
	if modLionVoodoo then
		modifierHex = modLionVoodoo
	end
	if modShamanVoodoo then
		modifierHex = modShamanVoodoo
	end

	if modifierHex then
		if math.max(Modifier.GetDieTime(modifierHex) - GameRules.GetGameTime(), 0) > 0 then
			return 140 + bonus_speed
		end
	end

    	if NPC.HasModifier(enemy, "modifier_invoker_ice_wall_slow_debuff") then 
		return 100 
	end

	if NPC.HasModifier(enemy, "modifier_invoker_cold_snap_freeze") or NPC.HasModifier(enemy, "modifier_invoker_cold_snap") then
		return (base_speed + bonus_speed) * 0.5
	end

	if NPC.HasModifier(enemy, "modifier_spirit_breaker_charge_of_darkness") then
		local chargeAbility = NPC.GetAbility(enemy, "spirit_breaker_charge_of_darkness")
		if chargeAbility then
			local specialAbility = NPC.GetAbility(enemy, "special_bonus_unique_spirit_breaker_2")
			if specialAbility then
				 if Ability.GetLevel(specialAbility) < 1 then
					return Ability.GetLevel(chargeAbility) * 50 + 550
				else
					return Ability.GetLevel(chargeAbility) * 50 + 1050
				end
			end
		end
	end
			
    	return base_speed + bonus_speed
end

function fooAllInOne.getBestPosition(unitsAround, radius)
	if not unitsAround or #unitsAround < 1 then
		return 
	end

	local countEnemies = #unitsAround

	if countEnemies == 1 then 
		return Entity.GetAbsOrigin(unitsAround[1]) 
	end

	local maxCount = 1
	local bestPosition = Entity.GetAbsOrigin(unitsAround[1])
	for i = 1, (countEnemies - 1) do
		for j = i + 1, countEnemies do
			if unitsAround[i] and unitsAround[j] then
				local pos1 = Entity.GetAbsOrigin(unitsAround[i])
				local pos2 = Entity.GetAbsOrigin(unitsAround[j])
				local mid = pos1:__add(pos2):Scaled(0.5)

				local heroesCount = 0
				for k = 1, countEnemies do
					if NPC.IsPositionInRange(unitsAround[k], mid, radius, 0) then
						heroesCount = heroesCount + 1
					end
				end

				if heroesCount > maxCount then
					maxCount = heroesCount
					bestPos = mid
				end
			end
		end
	end
	return bestPos
end

function fooAllInOne.GetMyFaction(myHero)

	if not myHero then return end
	
	local radiantFountain = Vector(-7600, -7300, 640)
	local direFountain = Vector(7800, 7250, 640)
	
	local myFountain
	if myFountain == nil then
		for i = 1, NPCs.Count() do 
		local npc = NPCs.Get(i)
    			if Entity.IsSameTeam(myHero, npc) and NPC.IsStructure(npc) then
    				if NPC.GetUnitName(npc) ~= nil then
        				if NPC.GetUnitName(npc) == "dota_fountain" then
						myFountain = npc
					end
				end
			end
		end
	end

	local myFaction
	if myFaction == nil and myFountain ~= nil then
		if NPC.IsPositionInRange(myFountain, radiantFountain, 1000, 0) then
			myFaction = "radiant"
		else myFaction = "dire"
		end
	end

	return myFaction

end

function fooAllInOne.GetMyFountainPos(myHero)

	if not myHero then return end

	local myFaction = fooAllInOne.GetMyFaction(myHero)

	local myFountainPos
	if myFaction == "radiant" then
		myFountainPos = Vector(-7600, -7300, 640)
	else myFountainPos = Vector(7800, 7250, 640)
	end

	return myFountainPos

end

function fooAllInOne.GetEnemyFountainPos(myHero)

	if not myHero then return end

	local myFaction = fooAllInOne.GetMyFaction(myHero)

	local enemyFountainPos
	if myFaction == "radiant" then
		enemyFountainPos = Vector(7800, 7250, 640)
	else enemyFountainPos = Vector(-7600, -7300, 640)
	end

	return enemyFountainPos

end

function fooAllInOne.IsCreepAncient(npc)

	if not npc then return false end

	ancientNameList = { 
		"npc_dota_neutral_black_drake",
    		"npc_dota_neutral_black_dragon",
    		"npc_dota_neutral_blue_dragonspawn_sorcerer",
    		"npc_dota_neutral_blue_dragonspawn_overseer",
    		"npc_dota_neutral_granite_golem",
    		"npc_dota_neutral_elder_jungle_stalker",
    		"npc_dota_neutral_prowler_acolyte",
    		"npc_dota_neutral_prowler_shaman",
    		"npc_dota_neutral_rock_golem",
    		"npc_dota_neutral_small_thunder_lizard",
    		"npc_dota_neutral_jungle_stalker",
    		"npc_dota_neutral_big_thunder_lizard",
    		"npc_dota_roshan" }

	for _, creepName in ipairs(ancientNameList) do
		if creepName and NPC.GetUnitName(npc) ~= nil then
			if NPC.GetUnitName(npc) == creepName then
				return true
			end
		end
	end

	return false

end

function fooAllInOne.GetNecronomiconEntityTable(myHero, caster)

	if not myHero then return end
	if not caster then return end

	local necronomiconTable = {}
	for i, npc in ipairs(NPC.GetUnitsInRadius(myHero, 99999, Enum.TeamType.TEAM_FRIEND)) do
    		if Entity.IsSameTeam(myHero, npc) and Entity.GetOwner(npc) == caster then
    			if NPC.GetUnitName(npc) ~= nil then
				if NPC.GetUnitName(npc) == string.match(NPC.GetUnitName(npc) , 'npc_dota_necronomicon_archer_.') or NPC.GetUnitName(npc) == string.match(NPC.GetUnitName(npc) , 'npc_dota_necronomicon_warrior_.') then
					if npc ~= nil then
						table.insert(necronomiconTable, npc)
					end
				end
			end
		end
	end
	
	return necronomiconTable

end

function fooAllInOne.GetIllusionEntityTable(myHero, caster)

	if not myHero then return end
	if not caster then return end

	local controllableTable = {}
	if next(controllableTable) == nil then
		for i = 1, NPCs.Count() do 
		local npc = NPCs.Get(i)
			if Entity.IsSameTeam(myHero, npc) then
				if npc ~= myHero then
					if Entity.GetOwner(npc) == Entity.GetOwner(caster) then
						if NPC.HasModifier(npc, "modifier_illusion") then
							if npc ~= nil then
								table.insert(controllableTable, npc)
							else controllableTable = {}
							break
							end
						end
					end
				end
			end
		end
	end
	
	return controllableTable

end

function fooAllInOne.NecronomiconController(necronomiconEntity, target, position)

	if not necronomiconEntity then return end
	if not target and not position then return end

	if target ~= nil then
		if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_archer_.') then
			if not NPC.IsAttacking(necronomiconEntity) then
				if (os.clock() - fooAllInOne.lastCastTime) >= 0.5 then
					if not NPC.IsEntityInRange(necronomiconEntity, target, 600) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
						fooAllInOne.lastCastTime = os.clock()
						fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
					else			
						if Ability.IsReady(NPC.GetAbilityByIndex(necronomiconEntity, 0)) then
							if NPC.IsHero(target) then
								Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, target, Vector(0,0,0), NPC.GetAbilityByIndex(necronomiconEntity, 0), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
								fooAllInOne.lastCastTime = os.clock()
								fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "manaBurn", "DOTA_UNIT_ORDER_CAST_TARGET")
							end
						end
						if not Ability.IsReady(NPC.GetAbilityByIndex(necronomiconEntity, 0)) then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
							fooAllInOne.lastCastTime = os.clock()
							fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
						end	
					end
				end
			end
		end
		if (os.clock() - fooAllInOne.lastCastTime) >= 0.25 then
			if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_warrior_.') then
				if not NPC.IsAttacking(necronomiconEntity) then
					if (os.clock() - fooAllInOne.lastCastTime2) >= 0.5 then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
						fooAllInOne.lastCastTime2 = os.clock()
						fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
					end
				end
			end
		end
	end

	if position ~= nil then
		if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_archer_.') then
			if not NPC.IsAttacking(necronomiconEntity) and not NPC.IsRunning(necronomiconEntity) then
				if (os.clock() - fooAllInOne.lastCastTime) >= 0.5 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
					fooAllInOne.lastCastTime = os.clock()
					fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
		if NPC.GetUnitName(necronomiconEntity) == string.match(NPC.GetUnitName(necronomiconEntity) , 'npc_dota_necronomicon_warrior_.') then
			if (os.clock() - fooAllInOne.lastCastTime) >= 0.25 then
				if not NPC.IsAttacking(necronomiconEntity) and not NPC.IsRunning(necronomiconEntity) then
					if (os.clock() - fooAllInOne.lastCastTime2) >= 0.5 then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, necronomiconEntity)
						fooAllInOne.lastCastTime2 = os.clock()
						fooAllInOne.Debugger(GameRules.GetGameTime(), necronomiconEntity, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
					end
				end
			end
		end	
	end

end

function fooAllInOne.invokerForgedSpiritController(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	for i = 1, NPCs.Count() do 
	local npc = NPCs.Get(i)
		if Entity.IsSameTeam(myHero, npc) then
			if npc ~= myHero and Entity.OwnedBy(npc, myHero) then
				if NPC.GetUnitName(npc) ~= nil then
					if  NPC.GetUnitName(npc) == "npc_dota_invoker_forged_spirit" then
						if npc ~= nil and Entity.IsAlive(npc) then
							fooAllInOne.GenericAttackIssuer2("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, npc)
						end	
					end
				end
			end
		end
	end

end

function fooAllInOne.MantaIlluController(target, position, myHero, tempestDoubleEntity)

	if not myHero then return end
	if next(fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity)) == nil then return end
	if not target and not position then return end
	 
	local mantaIllu1 = fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity)[1]
	local mantaIllu2 = fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity)[2]

	if target ~= nil then
		if mantaIllu1 then
			if os.clock() - fooAllInOne.LastTickManta1 >= 0.5 then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu1)
				fooAllInOne.LastTickManta1 = os.clock()
				fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu1, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			end
		end
		if mantaIllu2 then
			if os.clock() - fooAllInOne.LastTickManta2 >= 0.5 then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu2)
				fooAllInOne.LastTickManta2 = os.clock()
				fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu2, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			end
		end
	end

	if position ~= nil then
		if mantaIllu1 then
			if not NPC.IsAttacking(mantaIllu1) and not NPC.IsRunning(mantaIllu1) then
				if os.clock() - fooAllInOne.LastTickManta1 >= 0.5 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu1)
					fooAllInOne.LastTickManta1 = os.clock()
					fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu1, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
		if mantaIllu2 then
			if not NPC.IsAttacking(mantaIllu2) and not NPC.IsRunning(mantaIllu2) then
				if os.clock() - fooAllInOne.LastTickManta2 >= 0.5 then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, mantaIllu2)
					fooAllInOne.LastTickManta2 = os.clock()
					fooAllInOne.Debugger(GameRules.GetGameTime(), mantaIllu2, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
	end	
end

function fooAllInOne.GenericMainAttack(myHero, attackType, target, position)
	
	if not myHero then return end
	if not target and not position then return end

	if fooAllInOne.IsHeroInvisible(myHero) == true then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.heroCanCastItems(myHero) == false then return end

	if Menu.IsEnabled(fooAllInOne.optionOrbwalkEnable) then
		if target ~= nil then
			if NPC.HasModifier(myHero, "modifier_windrunner_focusfire") then
				fooAllInOne.GenericAttackIssuer(attackType, target, position, myHero)
			elseif NPC.HasModifier(myHero, "modifier_item_hurricane_pike_range") then
				fooAllInOne.GenericAttackIssuer(attackType, target, position, myHero)
			else
				fooAllInOne.OrbWalker(myHero, target)
			end
		else
			fooAllInOne.GenericAttackIssuer(attackType, target, position, myHero)
		end
	else
		fooAllInOne.GenericAttackIssuer(attackType, target, position, myHero)
	end

end

function fooAllInOne.GenericAttackIssuer(attackType, target, position, npc)

	if not npc then return end
	if not target and not position then return end
	if os.clock() - fooAllInOne.lastAttackTime2 < 0.5 then return end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET" then
		if target ~= nil then
			if target ~= fooAllInOne.LastTarget then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
				fooAllInOne.LastTarget = target
				fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			end
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE" then
		if position ~= nil then
			if not NPC.IsAttacking(npc) or not NPC.IsRunning(npc) then
				if position:__tostring() ~= fooAllInOne.LastTarget then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
					fooAllInOne.LastTarget = position:__tostring()
					fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				end
			end
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION" then
		if position ~= nil then
		--	if not NPC.IsRunning(npc) then
				if position:__tostring() ~= fooAllInOne.LastTarget then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
					fooAllInOne.LastTarget = position:__tostring()
					fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "move", "DOTA_UNIT_ORDER_MOVE_TO_POSITION")
				end
		--	end
		end
	end

	if target ~= nil then
		if target == fooAllInOne.LastTarget then
			if not NPC.IsAttacking(npc) then
				fooAllInOne.LastTarget = nil
				fooAllInOne.lastAttackTime2 = os.clock()
				return
			end
		end
	end

	if position ~= nil then
		if position:__tostring() == fooAllInOne.LastTarget then
			if not NPC.IsRunning(npc) then
				fooAllInOne.LastTarget = nil
				fooAllInOne.lastAttackTime2 = os.clock()
				return
			end
		end
	end

end

function fooAllInOne.GenericAttackIssuer2(attackType, target, position, npc)

	if not npc or (npc and not Entity.IsAlive(npc)) then return end
	if not target and not position then return end

	if fooAllInOne[tostring(npc)] ~= nil then
		if os.clock() - fooAllInOne[tostring(npc)] < 1.0 then
			return
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET" and (Menu.IsKeyDown(fooAllInOne.optionComboKey) or Menu.IsKeyDown(fooAllInOne.optionHeroVisageInstStunKey)) then
		if target ~= nil then
		--	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
			Player.AttackTarget(Players.GetLocal(), npc, target, false)
			fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			fooAllInOne[tostring(npc)] = os.clock()
			return
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE" then
		if position ~= nil then
			if #NPC.GetUnitsInRadius(npc, NPC.GetAttackRange(npc)+50, 1) < 1 then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
				fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "attackMove", "DOTA_UNIT_ORDER_ATTACK_MOVE")
				fooAllInOne[tostring(npc)] = os.clock()
				return
			end
		end
	end

	if attackType == "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION" then
		if position ~= nil then
			if not NPC.IsRunning(npc) then
			--	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, position, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, npc)
				NPC.MoveTo(npc, position, false, false)
				fooAllInOne.Debugger(GameRules.GetGameTime(), npc, "move", "DOTA_UNIT_ORDER_MOVE_TO_POSITION")
				fooAllInOne[tostring(npc)] = os.clock()
				return
			end
		end
	end
end

function fooAllInOne.OrbWalker(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	if NPC.IsChannellingAbility(myHero) then return end

	local myMana = NPC.GetMana(myHero)

	local attackRange = NPC.GetAttackRange(myHero)
		if NPC.HasItem(myHero, "item_dragon_lance", true) or NPC.HasItem(myHero, "item_hurricane_pike", true) then
			attackRange = attackRange + 140
		end

	local increasedAS = NPC.GetIncreasedAttackSpeed(myHero)
	local attackTime = NPC.GetAttackTime(myHero)
	local movementSpeed = NPC.GetMoveSpeed(myHero)

	local attackPoint
	local attackBackSwing
	for i, v in pairs(fooAllInOne.attackPointTable) do
		if i == NPC.GetUnitName(myHero) then
			attackPoint = v[1] / (1 + (increasedAS/100))
			attackBackSwing = v[2] / (1 + (increasedAS/100))
			break
		end
	end

	local idleTime = attackTime - attackPoint - attackBackSwing

	local turnTime180degrees = (0.03 * math.pi) / NPC.GetTurnRate(myHero)

	local orbWalkSkill
	for i, v in pairs(fooAllInOne.orbAttackTable) do
		if i == NPC.GetUnitName(myHero) then
			orbWalkSkill = NPC.GetAbility(myHero, v)
			break
		end
	end

	if Entity.IsSameTeam(myHero, enemy) then
		orbWalkSkill = nil
	end	

	if NPC.IsRanged(myHero) then
		if fooAllInOne.AttackProjectileCreate > 0 then
			if os.clock() > fooAllInOne.AttackAnimationCreate and os.clock() < fooAllInOne.AttackProjectileCreate + attackBackSwing + idleTime then
				fooAllInOne.InAttackBackswing = true
			else
				fooAllInOne.InAttackBackswing = false
			end
		end
	else
		if fooAllInOne.AttackParticleCreate > 0 then
			if NPC.HasItem(myHero, "item_echo_sabre", true) then
				if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_echo_sabre", true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_echo_sabre", true)) < (attackPoint / 1.49) + 0.15 then
					fooAllInOne.InAttackBackswing = false
				else
					if os.clock() > fooAllInOne.AttackAnimationCreate and os.clock() < fooAllInOne.AttackParticleCreate + attackBackSwing + idleTime then
						fooAllInOne.InAttackBackswing = true
					else
						fooAllInOne.InAttackBackswing = false
					end
				end
			else
				if os.clock() > fooAllInOne.AttackAnimationCreate and os.clock() < fooAllInOne.AttackParticleCreate + attackBackSwing + idleTime then
					fooAllInOne.InAttackBackswing = true
				else
					fooAllInOne.InAttackBackswing = false
				end
			end
		end
	end

	if os.clock() > fooAllInOne.AttackAnimationCreate and os.clock() < fooAllInOne.AttackParticleCreate then
		fooAllInOne.InAttackBackswing = false
	end

	if os.clock() > fooAllInOne.AttackAnimationCreate and os.clock() < fooAllInOne.AttackProjectileCreate then
		fooAllInOne.InAttackBackswing = false
	end

	local breakPoint
		if NPC.IsRanged(myHero) then
			breakPoint = attackRange * (Menu.GetValue(fooAllInOne.optionOrbwalkDistance) / 100)
		else
			breakPoint = attackRange
		end

	local moveDistance = NPC.GetMoveSpeed(myHero) * (attackBackSwing + idleTime - NPC.GetTimeToFace(myHero, enemy)) * (1 - (Menu.GetValue(fooAllInOne.optionOrbwalkOffset) / 100))
		if NPC.IsRanged(myHero) then
			if (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() > breakPoint and (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() <= breakPoint + moveDistance then
				moveDistance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - breakPoint
			end
		end

	local kiteDistance = 0
		if (2 * turnTime180degrees) < (attackBackSwing + idleTime) * (1 - (Menu.GetValue(fooAllInOne.optionOrbwalkOffset) / 100)) then
			kiteDistance = ((attackBackSwing + idleTime) * (1 - (Menu.GetValue(fooAllInOne.optionOrbwalkOffset) / 100)) - (2 * turnTime180degrees)) * NPC.GetMoveSpeed(myHero)
		end
	
	if not fooAllInOne.InAttackBackswing then
		if orbWalkSkill and Ability.IsCastable(orbWalkSkill, myMana) then
			if os.clock() - fooAllInOne.OrbwalkerDelay > 0.05 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
				Ability.CastTarget(orbWalkSkill, enemy)
				fooAllInOne.OrbwalkerDelay = os.clock()
				return
			end
		else
			if os.clock() - fooAllInOne.OrbwalkerDelay > 0.05 + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) and os.clock() - fooAllInOne.AttackAnimationCreate > attackPoint + 0.1 then
				Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
				fooAllInOne.OrbwalkerDelay = os.clock()
				return
			end
		end
	else
		if (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() > breakPoint then
			if os.clock() - fooAllInOne.OrbwalkerDelay > attackBackSwing + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
				if moveDistance > 50 then
					local targetVector = Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(moveDistance)
				--	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, targetVector, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, myHero, queue, showEffects)
					NPC.MoveTo(myHero, targetVector, false, false)
					fooAllInOne.OrbwalkerDelay = os.clock()
					return
				end
			end
	
		end
		if Menu.IsEnabled(fooAllInOne.optionOrbwalkKiting) then
			if NPC.IsRanged(myHero) then
				if (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() < breakPoint - 50 then
					if os.clock() - fooAllInOne.OrbwalkerDelay > attackBackSwing + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
						if kiteDistance > 50 then
							local targetVector = Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(kiteDistance)
						--	Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, targetVector, ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, myHero, queue, showEffects)
							NPC.MoveTo(myHero, targetVector, false, false)
							fooAllInOne.OrbwalkerDelay = os.clock()
							return
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.GetLongestCooldown(myHero, skill1, skill2, skill3, skill4, skill5)

	if not myHero then return end

	local skill1 = skill1
	local skill2 = skill2
	local skill3 = skill3
	local skill4 = skill4
	local skill5 = skill5


	local tempTable = {}

	if skill1 then
		table.insert(tempTable, math.ceil(Ability.GetCooldownTimeLeft(skill1)))
	end
	if skill2 then
		table.insert(tempTable, math.ceil(Ability.GetCooldownTimeLeft(skill2)))
	end
	if skill3 then
		table.insert(tempTable, math.ceil(Ability.GetCooldownTimeLeft(skill3)))
	end
	if skill4 then
		table.insert(tempTable, math.ceil(Ability.GetCooldownTimeLeft(skill4)))
	end
	if skill5 then
		table.insert(tempTable, math.ceil(Ability.GetCooldownTimeLeft(skill5)))
	end

	table.sort(tempTable, function(a, b)
        	return a > b
    			end)

	return tempTable[1]

end

function fooAllInOne.GenericLanePusher(npc)

	if not npc or (npc and not Entity.IsAlive(npc)) then return end

	local myFaction = fooAllInOne.GetMyFaction(npc)
	local myFountainPos = fooAllInOne.GetMyFountainPos(npc)
	local enemyFountainPos = fooAllInOne.GetEnemyFountainPos(npc)

	local leftCornerPos = Vector(-5750, 6050, 384)
	local rightCornerPos = Vector(6000, -5800, 384)
	local midPos = Vector(-600, -300, 128)

	local radiantTop2 = Vector(-6150, -800, 384)
	local radiantBot2 = Vector(-800, -6250, 384)
	local radiantMid2 = Vector(-2800, -2250, 256)
	
	local direTop2 = Vector(800, 6000, 384)
	local direBot2 = Vector(6200, 400, 384)
	local direMid2 = Vector(2800, 2100, 256)


	local myBotTower2
		if myFaction == "radiant"
			then myBotTower2 = radiantBot2
		else myBotTower2 = direBot2
		end

	local myTopTower2
		if myFaction == "radiant"
			then myTopTower2 = radiantTop2
		else myTopTower2 = direTop2
		end

	local myMidTower2
		if myFaction == "radiant"
			then myMidTower2 = radiantMid2
		else myMidTower2 = direMid2
		end


	local myPos = Entity.GetAbsOrigin(npc)

	local homeSide
	if myPos:__sub(myFountainPos):Length2D() < myPos:__sub(enemyFountainPos):Length2D() then
		homeSide = true
	else homeSide = false
	end
	
	if not homeSide then
		return enemyFountainPos
	end

	if homeSide then
		if myPos:__sub(leftCornerPos):Length2D() <= 800 then
			return enemyFountainPos
		elseif myPos:__sub(rightCornerPos):Length2D() <= 800 then
			return enemyFountainPos
		elseif myPos:__sub(midPos):Length2D() <= 800 then
			return enemyFountainPos
		end
	end

	if homeSide then
		if myPos:__sub(leftCornerPos):Length2D() > 800 and myPos:__sub(rightCornerPos):Length2D() > 800 and myPos:__sub(midPos):Length2D() > 800 then
			
			if myPos:__sub(leftCornerPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(leftCornerPos):Length2D() < myPos:__sub(midPos):Length2D() then
				return leftCornerPos
			elseif myPos:__sub(leftCornerPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(myTopTower2):Length2D() < myPos:__sub(midPos):Length2D() and myPos:__sub(myMidTower2):Length2D() > myPos:__sub(myTopTower2):Length2D() then
				return leftCornerPos
			elseif myPos:__sub(rightCornerPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(rightCornerPos):Length2D() < myPos:__sub(midPos):Length2D() then
				return rightCornerPos
			elseif myPos:__sub(rightCornerPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(myBotTower2):Length2D() < myPos:__sub(midPos):Length2D() and myPos:__sub(myMidTower2):Length2D() > myPos:__sub(myBotTower2):Length2D() then
				return rightCornerPos
			elseif myPos:__sub(midPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(midPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(myMidTower2):Length2D() < myPos:__sub(myTopTower2):Length2D() then
				return enemyFountainPos
			elseif myPos:__sub(midPos):Length2D() < myPos:__sub(leftCornerPos):Length2D() and myPos:__sub(midPos):Length2D() < myPos:__sub(rightCornerPos):Length2D() and myPos:__sub(myMidTower2):Length2D() < myPos:__sub(myBotTower2):Length2D() then
				return enemyFountainPos
			else return enemyFountainPos
			end
		end
	end
end

function fooAllInOne.ForceBlink(myHero, enemy, range)

	if not myHero then return end
	
	local blink = NPC.GetItem(myHero, "item_blink", true)
		if not blink then return end
		if blink and not Ability.IsReady(blink) then return end

	if not enemy or (enemy and not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), range, 0)) then
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
			if NPC.IsPositionInRange(myHero, Input.GetWorldCursorPos(), 1100, 0) then
				Ability.CastPosition(blink, Input.GetWorldCursorPos())
				return
			else
				if fooAllInOne.SleepReady(0.1) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Input.GetWorldCursorPos(), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end	
		end
	end
end

function fooAllInOne:WorldToMiniMap(pos, screenWidth, screenHeight)
	local screenH = screenHeight
	local screenW = screenWidth 
	local MapLeft = -8000
	local MapTop = 7350
	local MapRight = 7500
	local MapBottom = -7200
	local mapWidth = math.abs(MapLeft - MapRight)
	local mapHeight = math.abs(MapBottom - MapTop)
	

	local x = pos:GetX() - MapLeft
	local y = pos:GetY() - MapBottom

	local dx, dy, px, py
	if self.Round(screenW / screenH, 1) >= 1.7 then

		dx = 272 / 1920 * screenW
		dy = 261 / 1080 * screenH
		px = 11 / 1920 * screenW
		py = 11 / 1080 * screenH
	elseif self.Round(screenW / screenH, 1) >= 1.5 then

		dx = 267 / 1680 * screenW
		dy = 252 / 1050 * screenH
		px = 10 / 1680 * screenW
		py = 11 / 1050 * screenH
	else
		dx = 255 / 1280 * screenW
		dy = 229 / 1024 * screenH
		px = 6 / 1280 * screenW
		py = 9 / 1024 * screenH
	end
	local minimapMapScaleX = dx / mapWidth
	local minimapMapScaleY = dy / mapHeight

	local scaledX = math.min(math.max(x * minimapMapScaleX, 0), dx)
	local scaledY = math.min(math.max(y * minimapMapScaleY, 0), dy)

	local screenX = px + scaledX
	local screenY = screenH - scaledY - py

	return Vector(math.floor(screenX - 20 + Menu.GetValue(fooAllInOne.optionWorldToMinimapOffsetX)), math.floor(screenY - 12 + Menu.GetValue(fooAllInOne.optionWorldToMinimapOffsetY)), 0)
end

function fooAllInOne.Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function fooAllInOne.TargetDisableTimer(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local stunRootList = {
		"modifier_stunned",
		"modifier_bashed",
		"modifier_alchemist_unstable_concoction", 
		"modifier_ancientapparition_coldfeet_freeze", 
		"modifier_axe_berserkers_call",
		"modifier_bane_fiends_grip",
		"modifier_bane_nightmare",
		"modifier_bloodseeker_rupture",
		"modifier_rattletrap_hookshot", 
		"modifier_earthshaker_fissure_stun", 
		"modifier_earth_spirit_boulder_smash",
		"modifier_enigma_black_hole_pull",
		"modifier_faceless_void_chronosphere_freeze",
		"modifier_jakiro_ice_path_stun", 
		"modifier_keeper_of_the_light_mana_leak_stun", 
		"modifier_kunkka_torrent", 
		"modifier_legion_commander_duel", 
		"modifier_lion_impale", 
		"modifier_magnataur_reverse_polarity", 
		"modifier_medusa_stone_gaze_stone", 
		"modifier_morphling_adaptive_strike", 
		"modifier_naga_siren_ensnare", 
		"modifier_nyx_assassin_impale", 
		"modifier_pudge_dismember", 
		"modifier_sandking_impale", 
		"modifier_shadow_shaman_shackles", 
		"modifier_techies_stasis_trap_stunned", 
		"modifier_tidehunter_ravage", 
		"modifier_treant_natures_guise",
		"modifier_windrunner_shackle_shot",
		"modifier_rooted", 
		"modifier_crystal_maiden_frostbite", 
		"modifier_ember_spirit_searing_chains", 
		"modifier_meepo_earthbind",
		"modifier_lone_druid_spirit_bear_entangle_effect",
		"modifier_slark_pounce_leash",
		"modifier_storm_spirit_electric_vortex_pull",
		"modifier_treant_overgrowth", 
		"modifier_abyssal_underlord_pit_of_malice_ensare", 
		"modifier_item_rod_of_atos_debuff",
		"modifier_eul_cyclone",
		"modifier_obsidian_destroyer_astral_imprisonment_prison",
		"modifier_shadow_demon_disruption"
			}
	
	local searchMod
	for _, modifier in ipairs(stunRootList) do
		if NPC.HasModifier(enemy, modifier) then
			searchMod = NPC.GetModifier(enemy, modifier)
			break
		end
	end

	if searchMod then
		if NPC.HasModifier(enemy, Modifier.GetName(searchMod)) then
			if Modifier.GetName(searchMod) == "modifier_enigma_black_hole_pull" then
				return Modifier.GetCreationTime(searchMod) + 4
			elseif Modifier.GetName(searchMod) == "modifier_faceless_void_chronosphere_freeze" then
				return Modifier.GetCreationTime(searchMod) + (3.5 + fooAllInOne.GetTeammateAbilityLevel(myHero, "faceless_void_chronosphere") * 0.5)
			else
				return Modifier.GetDieTime(searchMod)
			end
		else
			return 0
		end
	else
		return 0
	end

end

function fooAllInOne.GetTeammateAbilityLevel(myHero, ability)

	if not myHero then return end
	if not ability then return 0 end

	for _, teamMate in ipairs(NPC.GetHeroesInRadius(myHero, 99999, Enum.TeamType.TEAM_FRIEND)) do
		if NPC.HasAbility(teamMate, ability) then
			if NPC.GetAbility(teamMate, ability) then
				return Ability.GetLevel(NPC.GetAbility(teamMate, ability))
			end
		end
	end
	return 0

end

function fooAllInOne.TargetIsInvulnarable(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local curTime = GameRules.GetGameTime()

	local invuList = {
		"modifier_eul_cyclone",
		"modifier_invoker_tornado",
		"modifier_obsidian_destroyer_astral_imprisonment_prison",
		"modifier_shadow_demon_disruption"
			}
	
	local searchMod
	for _, modifier in ipairs(invuList) do
		if NPC.HasModifier(enemy, modifier) then
			searchMod = NPC.GetModifier(enemy, modifier)
			break
		end
	end

	if searchMod then
		if NPC.HasModifier(enemy, Modifier.GetName(searchMod)) then
			return Modifier.GetDieTime(searchMod)
		else
			return 0
		end
	else
		return 0
	end

end

function fooAllInOne.EnemyHPTracker(myHero)

	if not myHero then return end

	if Heroes.Count() == 0 then
		fooAllInOne.enemyHeroTable = {}
		return
	end	

	for i = 1, Heroes.Count() do
		local allHeroes = Heroes.Get(i)
	
		if allHeroes == nil then
			fooAllInOne.enemyHeroTable = {}
			return
		else
			if Entity.IsHero(allHeroes) and not Entity.IsSameTeam(myHero, allHeroes) then
				if not NPC.IsIllusion(allHeroes) then
					if fooAllInOne.enemyHeroTable[allHeroes] == nil then
						fooAllInOne.enemyHeroTable[allHeroes] = { 99999, 99999, 0 }
					end
				end
			end
		end
	end

	for hero, data in pairs(fooAllInOne.enemyHeroTable) do
		if hero and not Entity.IsNPC(hero) then
			fooAllInOne.enemyHeroTable[hero] = nil
		end
		if hero and Entity.IsNPC(hero) and Entity.IsAlive(hero) and not Entity.IsDormant(hero) and GameRules.GetGameTime() - data[3] > 1 then
			local heroHP = Entity.GetHealth(hero)
			local heroHPreg = NPC.GetHealthRegen(hero)
			local timeStamp = GameRules.GetGameTime()
			fooAllInOne.enemyHeroTable[hero] = { heroHP, heroHPreg, timeStamp }
		end
	end

end

function fooAllInOne.getEnemyBeShackledWithNPC(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local myMana = NPC.GetMana(myHero)
	local shackleShot = NPC.GetAbility(myHero, "windrunner_shackleshot")
		if not shackleShot then return end
		if not Ability.IsCastable(shackleShot, myMana) then return end

	local shackleSearchRange = 575
	local shackleCastRange = 785

	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.15 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local directLineVector = enemyPos + (enemyPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(shackleSearchRange)

	local npcs = Entity.GetUnitsInRadius(enemy, shackleSearchRange, Enum.TeamType.TEAM_FRIEND)
		if next(npcs) == nil then return end

		local shackleNPC
		local minAngle = 180
		local minRange = 99999	

		for _, targetNPC in ipairs(npcs) do
			if targetNPC then
				local myDisToEnemy = (Entity.GetAbsOrigin(myHero) - enemyPos):Length2D()
				local myDisToNPC = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(targetNPC)):Length2D()
				local enemyDisToNPC = (enemyPos - Entity.GetAbsOrigin(targetNPC)):Length2D()
				if myDisToEnemy < myDisToNPC then
					if myDisToEnemy < shackleCastRange then
						local vectorEnemyToNPC = Entity.GetAbsOrigin(targetNPC) - enemyPos
						local vectormyHerotoEnemy = enemyPos - Entity.GetAbsOrigin(myHero)
						local tempProcessing = vectormyHerotoEnemy:Dot2D(vectorEnemyToNPC) / (vectormyHerotoEnemy:Length2D() * vectorEnemyToNPC:Length2D())
							if tempProcessing > 1 then
								tempProcessing = 1
							end	
						local searchAngleRad = math.acos(tempProcessing)
						local searchAngle = (180 / math.pi) * searchAngleRad
						if searchAngle < minAngle then
							shackleNPC = enemy
							minAngle = searchAngle
						end
					end
				else
					if myDisToNPC < shackleCastRange then
						local vectorNPCToEnemy = enemyPos - Entity.GetAbsOrigin(targetNPC)
						local vectormyHerotoNPC = Entity.GetAbsOrigin(targetNPC) - Entity.GetAbsOrigin(myHero)
						local tempProcessing = vectormyHerotoNPC:Dot2D(vectorNPCToEnemy) / (vectormyHerotoNPC:Length2D() * vectorNPCToEnemy:Length2D())
							if tempProcessing > 1 then
								tempProcessing = 1
							end	
						local searchAngleRad = math.acos(tempProcessing)
						local searchAngle = (180 / math.pi) * searchAngleRad
						if searchAngle < minAngle and vectorNPCToEnemy:Length2D() < minRange then
							shackleNPC = targetNPC
							minAngle = searchAngle
							minRange = vectorNPCToEnemy:Length2D()
						end
					end
				end
			end
		end

		if shackleNPC and minAngle < 23 then
			return shackleNPC
		end
	
	return

end

function fooAllInOne.getEnemyShackledBestPosition(myHero, enemy, dist)

	if not myHero then return Vector() end
	if not enemy then return Vector() end
	if not dist then return Vector() end

	local myMana = NPC.GetMana(myHero)
	local shackleShot = NPC.GetAbility(myHero, "windrunner_shackleshot")
		if not shackleShot then return Vector() end
		if not Ability.IsCastable(shackleShot, myMana) then return Vector() end

	local shackleSearchRange = 575
	local shackleCastRange = 785

	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.15 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local directLineVector = enemyPos + (enemyPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(shackleSearchRange)

	local shacklePos = Vector()
	local minDis = 99999
	local minCreepDis = 99999

	if not fooAllInOne.canEnemyBeShackledWithTree(myHero, enemy) and fooAllInOne.getEnemyBeShackledWithNPC(myHero, enemy) == nil then
		local npcs = Entity.GetUnitsInRadius(enemy, shackleSearchRange, Enum.TeamType.TEAM_FRIEND)
		for _, targetNPC in ipairs(npcs) do
			if targetNPC then
				local myDisToEnemy = (Entity.GetAbsOrigin(myHero) - enemyPos):Length2D()
				local myDisToNPC = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(targetNPC)):Length2D()
				local enemyDisToNPC = (enemyPos - Entity.GetAbsOrigin(targetNPC)):Length2D()
				
				if myDisToEnemy < myDisToNPC then
					local vectorNPCtoEnemy = enemyPos - Entity.GetAbsOrigin(targetNPC)
					local searchVec = Entity.GetAbsOrigin(targetNPC) + vectorNPCtoEnemy:Normalized():Scaled(vectorNPCtoEnemy:Length2D() + 250)
					local myDisToSearchPos = (searchVec - Entity.GetAbsOrigin(myHero)):Length2D()
					if #Trees.InRadius(searchVec, 300, true) < 1 and #Heroes.InRadius(searchVec, 150, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) < 1 then
						if myDisToSearchPos < minDis then
							shacklePos = searchVec
							minDis = myDisToSearchPos
						end
					end
				else
					local vectorEnemyToNPC = Entity.GetAbsOrigin(targetNPC) - enemyPos
					local searchVec = enemyPos + vectorEnemyToNPC:Normalized():Scaled(vectorEnemyToNPC:Length2D() + 250)
					local myDisToSearchPos = (searchVec - Entity.GetAbsOrigin(myHero)):Length2D()
					if #Trees.InRadius(searchVec, 300, true) < 1 and #Heroes.InRadius(searchVec, 150, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) < 1 then
						if myDisToSearchPos < minDis and vectorEnemyToNPC:Length2D() < minCreepDis then
							shacklePos = searchVec
							minDis = myDisToSearchPos
							minCreepDis = vectorEnemyToNPC:Length2D()
						end
					end
				end
			end
		end
		
		if shacklePos:__tostring() == Vector():__tostring() then
			if next(fooAllInOne.getEnemyShackleTrees(myHero, enemy)) ~= nil then
				for _, targetTree in ipairs(fooAllInOne.getEnemyShackleTrees(myHero, enemy)) do
					if targetTree then
						local vectorTreeToEnemy = enemyPos - Entity.GetAbsOrigin(targetTree)
						local searchVec = Entity.GetAbsOrigin(targetTree) + vectorTreeToEnemy:Normalized():Scaled(vectorTreeToEnemy:Length2D() + 350)
						local myDisToSearchPos = (searchVec - Entity.GetAbsOrigin(myHero)):Length2D()
						if #Trees.InRadius(searchVec, 300, true) < 1 and #Heroes.InRadius(searchVec, 300, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) < 1 then
							if myDisToSearchPos < minDis then
								shacklePos = searchVec
								minDis = myDisToSearchPos
							end
						end
					end
				end
			end	
		end
	end
	
	if shacklePos:__tostring() ~= Vector():__tostring() and minDis < dist then
		return shacklePos
	end

	return Vector()

end

function fooAllInOne.getEnemyShackleTrees(myHero, enemy)

	if not myHero then return {} end
	if not enemy then return {} end

	local shackleSearchRange = 575

	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.15 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local trees = Trees.InRadius(enemyPos, shackleSearchRange, true)
		if next(trees) == nil then return {} end

	local returnTrees = {}
	for _, targetTree in ipairs(trees) do		
		if targetTree then
			table.insert(returnTrees, targetTree)
		end
	end

	if next(returnTrees) ~= nil then
		return returnTrees
	end
	return {}

end
			
function fooAllInOne.canEnemyBeShackledWithTree(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local myMana = NPC.GetMana(myHero)
	local shackleShot = NPC.GetAbility(myHero, "windrunner_shackleshot")
		if not shackleShot then return false end
		if not Ability.IsCastable(shackleShot, myMana) then return false end

	local shackleSearchRange = 575
	local shackleCastRange = 785

	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.15 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local directLineVector = enemyPos + (enemyPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(shackleSearchRange)

	local trees = Trees.InRadius(directLineVector, shackleSearchRange, true)
		if next(trees) == nil then return false end

		local shackleTree
		local minAngle = 180
		
		for _, targetTree in ipairs(trees) do		
			if targetTree then
				local myDisToEnemy = (Entity.GetAbsOrigin(myHero) - enemyPos):Length2D()
				local enemyDisToTree = (enemyPos - Entity.GetAbsOrigin(targetTree)):Length2D()
				if myDisToEnemy < shackleCastRange then
					if enemyDisToTree < shackleSearchRange then
						if targetTree ~= nil then
							local vectorEnemyToTree = Entity.GetAbsOrigin(targetTree) - enemyPos
							local vectormyHerotoEnemy = enemyPos - Entity.GetAbsOrigin(myHero)
							local tempProcessing = vectormyHerotoEnemy:Dot2D(vectorEnemyToTree) / (vectormyHerotoEnemy:Length2D() * vectorEnemyToTree:Length2D())
							if tempProcessing > 1 then
								tempProcessing = 1
							end
							local searchAngleRad = math.acos(tempProcessing)
							local searchAngle = (180 / math.pi) * searchAngleRad
							if searchAngle < minAngle then
								shackleTree = targetTree
								minAngle = searchAngle
							end
						end
					end
				end
			end
		end

		if shackleTree and minAngle < 23 then
			return true
		end
	
	return false

end

function fooAllInOne.TimberIsTreeInRangeForChain(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local myMana = NPC.GetMana(myHero)

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return end
		if not Ability.IsCastable(timberChain, myMana) then return end

	local chainCastRange = Ability.GetCastRange(timberChain) + 45
	

	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroTimberPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local remainingDis = chainCastRange - (enemyPos - Entity.GetAbsOrigin(myHero)):Length2D()
	local directLineVector = enemyPos + (enemyPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(remainingDis)

	local trees = Trees.InRadius(directLineVector, remainingDis, true)
		if next(trees) == nil then return end

		local chainTree
		local minDis = 99999
		
		for _, targetTree in ipairs(trees) do		
			if targetTree then
				local myDisToTree = (Entity.GetAbsOrigin(targetTree) - Entity.GetAbsOrigin(myHero)):Length2D()
				if myDisToTree < chainCastRange then
					local vectormyHeroToTree = Entity.GetAbsOrigin(targetTree) - Entity.GetAbsOrigin(myHero)
					if fooAllInOne.TimberAmIhittingWithChain(myHero, enemy, Entity.GetAbsOrigin(targetTree)) == true and myDisToTree < minDis then
						chainTree = targetTree
						minDis = myDisToTree
					end
				end
			end
		end


		if chainTree then
			return chainTree
		end
	
	return 

end

function fooAllInOne.TimberAmIhittingWithChain(myHero, enemy, pos)

	if not myHero then return false end
	if not enemy then return false end
	if not pos then return false end

	local myPos = Entity.GetAbsOrigin(myHero)
	local chainDistance = (pos - myPos):Length2D()
	local chainVector = myPos - pos

	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroTimberPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local checkNum = tonumber(math.floor(chainDistance/150) + 1)
	for i = checkNum, 1, -1 do 
        	chainVector:Normalize()
        	chainVector:Scale(150 * (i-1))
        	local checkPos = pos + chainVector
		if (checkPos - enemyPos):Length2D() < 200 then
            		return true
		end
	end

	return false

end

function fooAllInOne.TimberGetEnemyChainTrees(myHero, enemy)

	if not myHero then return {} end
	if not enemy then return {} end

	local myMana = NPC.GetMana(myHero)

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return {} end
		if not Ability.IsCastable(timberChain, myMana) then return {} end
	
	local chainCastRange = Ability.GetCastRange(timberChain) + 45
	
	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroTimberPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local remainingDis = chainCastRange - (enemyPos - Entity.GetAbsOrigin(myHero)):Length2D()

	local trees = Trees.InRadius(enemyPos, remainingDis, true)
		if next(trees) == nil then return {} end

	local returnTrees = {}
	for _, targetTree in ipairs(trees) do		
		if targetTree then
			table.insert(returnTrees, targetTree)
		end
	end

	if next(returnTrees) ~= nil then
		return returnTrees
	end
	return {}

end

function fooAllInOne.GetClosestPoint(A,  B,  P, segmentClamp)
	
	A:SetZ(0)
	B:SetZ(0)
	P:SetZ(0)

	local Ax = A:GetX()
	local Ay = A:GetY()
	local Bx = B:GetX()
	local By = B:GetY()
	local Px = P:GetX()
	local Py = P:GetY()

	local AP = P - A
	local AB = B - A

	local APx = AP:GetX()
	local APy = AP:GetY()

	local ABx = AB:GetX()
	local ABy = AB:GetY()

	local ab2 = ABx*ABx + ABy*ABy
	local ap_ab = APx*ABx + APy*ABy

	local t = ap_ab / ab2
 
	if (segmentClamp or true) then
		if (t < 0.0) then
			t = 0.0
		elseif (t > 1.0) then
			t = 1.0
		end
	end
 
	local Closest = Vector(Ax + ABx*t, Ay + ABy * t, 0)
 
	return Closest
end

function fooAllInOne.TimberGetBestChainPos(myHero, enemy, dist)

	if not myHero then return Vector() end
	if not enemy then return Vector() end

	local myMana = NPC.GetMana(myHero)

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return Vector() end
		if not Ability.IsCastable(timberChain, myMana) then return Vector() end

	local chainCastRange = Ability.GetCastRange(timberChain) + 45
	
	local enemyPos = Entity.GetAbsOrigin(enemy)
	if Menu.IsEnabled(fooAllInOne.optionHeroTimberPredict) then
		enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
	end

	local remainingDis = chainCastRange - (enemyPos - Entity.GetAbsOrigin(myHero)):Length2D()

	local chainPos = Vector()
	local minDis = 99999

	if fooAllInOne.TimberIsTreeInRangeForChain(myHero, enemy) == nil then
		if next(fooAllInOne.TimberGetEnemyChainTrees(myHero, enemy)) ~= nil then
			for _, targetTree in ipairs(fooAllInOne.TimberGetEnemyChainTrees(myHero, enemy)) do
				if targetTree then
					local vectorTreeToEnemy = enemyPos - Entity.GetAbsOrigin(targetTree)
					local vectorTreeTomyHero = Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(targetTree)
					local searchVec = enemyPos + vectorTreeToEnemy:Normalized():Scaled(chainCastRange)
					local closestPointToSearchVec = fooAllInOne.GetClosestPoint(enemyPos, searchVec, Entity.GetAbsOrigin(myHero), true)
					local disClosestPointToSearchVec = (closestPointToSearchVec - Entity.GetAbsOrigin(myHero)):Length2D()
					if #Trees.InRadius(closestPointToSearchVec, 300, true) < 1 then
						if (closestPointToSearchVec - Entity.GetAbsOrigin(targetTree)):Length2D() < chainCastRange then
							if disClosestPointToSearchVec < minDis then
								chainPos = closestPointToSearchVec
								minDis = disClosestPointToSearchVec
							end
						end
					end
				end
			end
		end
	end
		
	
	if chainPos:__tostring() ~= Vector():__tostring() and minDis < dist then
		return chainPos
	end

	return Vector()

end

function fooAllInOne.TimberPanicIsTreeInChainWay(myHero, pos)

	if not myHero then return false end
	if not pos then return false end

	local myPos = Entity.GetAbsOrigin(myHero)
	local chainDistance = (pos - myPos):Length2D()
	local chainVector = myPos - pos

	local checkNum = tonumber(math.floor(chainDistance/50))
	for i = checkNum, 1, -1 do 
        	chainVector:Normalize()
        	chainVector:Scale(50 * (i))
        	local checkPos = pos + chainVector
		if #Trees.InRadius(checkPos, 50, true) < 1 then
            		return true
		end
	end

	return false

end

function fooAllInOne.TimberGetEscapeChainTrees(myHero)

	if not myHero then return {} end

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return {} end
	
	local chainCastRange = Ability.GetCastRange(timberChain) + 45
	
	local myPos = Entity.GetAbsOrigin(myHero)

	local trees = Trees.InRadius(myPos, chainCastRange, true)
		if next(trees) == nil then return {} end

	local returnTrees = {}
	for _, targetTree in ipairs(trees) do		
		if targetTree then
			local disTreeTomyHero = (Entity.GetAbsOrigin(targetTree) - Entity.GetAbsOrigin(myHero)):Length2D()
			if fooAllInOne.TimberPanicIsTreeInChainWay(myHero, Entity.GetAbsOrigin(targetTree)) == true then
				table.insert(returnTrees, { disTreeTomyHero, targetTree })
			end
		end
	end

	if next(returnTrees) ~= nil then
		table.sort(returnTrees, function(a, b)
        		return a[1] > b[1]
    		end)

		return returnTrees
	end
	return {}

end

function fooAllInOne.TimberGetEscapeChainTreesFountain(myHero)

	if not myHero then return {} end

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return {} end
	
	local chainCastRange = Ability.GetCastRange(timberChain) + 45
	
	local myPos = Entity.GetAbsOrigin(myHero)

	local trees = Trees.InRadius(myPos, chainCastRange, true)
		if next(trees) == nil then return {} end

	local returnTrees = {}
	for _, targetTree in ipairs(trees) do		
		if targetTree then
			local myFountainPos = fooAllInOne.GetMyFountainPos(myHero)
			local disTreeToFountain = (Entity.GetAbsOrigin(targetTree) - myFountainPos):Length2D()
			local dismyHeroToFountain = (myPos - myFountainPos):Length2D()
			if disTreeToFountain < dismyHeroToFountain then
				if fooAllInOne.TimberPanicIsTreeInChainWay(myHero, Entity.GetAbsOrigin(targetTree)) == true then
					table.insert(returnTrees, { disTreeToFountain, targetTree })
				end
			end
		end
	end

	if next(returnTrees) ~= nil then
		table.sort(returnTrees, function(a, b)
        		return a[1] < b[1]
    		end)

		return returnTrees
	end
	return {}

end

function fooAllInOne.TimberGetTreesFastMoveCursor(myHero)

	if not myHero then return {} end

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return {} end
	
	local chainCastRange = Ability.GetCastRange(timberChain) + 45
	
	local myPos = Entity.GetAbsOrigin(myHero)

	local trees = Trees.InRadius(myPos, chainCastRange, true)
		if next(trees) == nil then return {} end

	local returnTrees = {}
	for _, targetTree in ipairs(trees) do		
		if targetTree then
		local cursorPos = Input.GetWorldCursorPos()
		local disTreeToCursor = (Entity.GetAbsOrigin(targetTree) - cursorPos):Length2D()
		local disTreeTomyHero = (Entity.GetAbsOrigin(targetTree) - myPos):Length2D()
		local dismyHeroToCursor = (myPos - cursorPos):Length2D()
			if disTreeToCursor < dismyHeroToCursor then
				if disTreeTomyHero > 500 then
					if fooAllInOne.TimberPanicIsTreeInChainWay(myHero, Entity.GetAbsOrigin(targetTree)) == true then
						table.insert(returnTrees, { disTreeToCursor, targetTree })
					end
				end
			end
		end
	end

	if next(returnTrees) ~= nil then
		table.sort(returnTrees, function(a, b)
        		return a[1] < b[1]
    		end)

		return returnTrees
	end
	return {}

end

function fooAllInOne.TargetIndicator(myHero)

	if not myHero then return end
	if fooAllInOne.LockedTarget == nil then return end

	local curtime = GameRules.GetGameTime()	

	if curtime > fooAllInOne.particleNextTime then
		if fooAllInOne.currentParticle ~= nil then
			Particle.Destroy(fooAllInOne.currentParticle)
			fooAllInOne.currentParticle = nil
		end

	if Menu.GetValue(fooAllInOne.optionLockTargetParticle) == 0 then
		local sparkParticle = Particle.Create("particles/items_fx/aegis_resspawn_flash.vpcf")
		fooAllInOne.currentParticle = sparkParticle
		
		Particle.SetControlPoint(sparkParticle, 0, Entity.GetAbsOrigin(fooAllInOne.LockedTarget))
	else
		local bloodParticle = Particle.Create("particles/items2_fx/soul_ring_blood.vpcf")
		fooAllInOne.currentParticle = bloodParticle
		Particle.SetControlPoint(bloodParticle, 0, Entity.GetAbsOrigin(fooAllInOne.LockedTarget))
	end

        fooAllInOne.particleNextTime = curtime + 0.35
	
	end

end

-- dodgeIT
function fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange)

	if not myHero then return false end
	if not unit then return false end

	local angle = Entity.GetRotation(unit)

	local direction = angle:GetForward()
    	local name = NPC.GetUnitName(unit)
    		direction:SetZ(0)

    	local origin = NPC.GetAbsOrigin(unit)

	if radius == 0 then
		radius = 100
	end

    	local pointsNum = math.floor(castrange/50) + 1
    	for i = pointsNum,1,-1 do 
        	direction:Normalize()
        	direction:Scale(50*(i-1))
        	local pos = origin + direction
        	if NPC.IsPositionInRange(myHero, pos, radius + NPC.GetHullRadius(myHero), 0) then 
            		return true 
        	end
    	end 
    	return false

end

function fooAllInOne.dodgerEmberSkillsChecker(myHero, skillName)

	if not myHero then return false end
	if not skillName then return false end

	if skillName == "ember_spirit_sleight_of_fist" then
		local effectRange = Ability.GetLevel(NPC.GetAbility(myHero, "ember_spirit_sleight_of_fist")) * 100 + 150
		for i = 0, math.floor(700 / effectRange) do
			if #NPCs.InRadius(Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(i * effectRange), effectRange, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) > 0 then
				return true
			end
		end
	end

	if skillName == "ember_spirit_activate_fire_remnant" then
		if NPC.HasModifier(myHero, "modifier_ember_spirit_fire_remnant_timer") then
			return true
		end
	end

	return false

end

function fooAllInOne.dodgeIt(info)

	local myHero = Heroes.GetLocal()
		if not myHero then return end
		if not Entity.IsAlive(myHero) then return end
	
	if not info then return end

	if next(fooAllInOne.dodgeItReadyTable) == nil then return end

	if not Menu.IsEnabled(fooAllInOne.dodgeEnemySkillsOptionsTable[info.spellname]) then return end

	local myMana = NPC.GetMana(myHero)	

	local dodgeSelector
	local dodgeItemStyle
	local dodgeTargeting
	local dodgeTiming

	if next(fooAllInOne.dodgeItSkillReady) ~= nil then
		if NPC.HasAbility(myHero, fooAllInOne.dodgeItSkillReady[1]["skillname"]) then
			if Ability.IsReady(NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[1]["skillname"])) and Ability.IsCastable(NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[1]["skillname"]), myMana) then
				if fooAllInOne.dodgeItSkillReady[1]["skillstyle"] <= info.style then
					if fooAllInOne.dodgeItSkillReady[1]["skilloffset"] < info.delay then
						if fooAllInOne.dodgeItSkillReady[1]["skillname"] == "slark_dark_pact" then
							if info.type == "disable" then
								dodgeSelector = NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[1]["skillname"])
								dodgeItemStyle = fooAllInOne.dodgeItSkillReady[1]["skillstyle"]
								dodgeTargeting = fooAllInOne.dodgeItSkillReady[1]["skilltargeting"]
								dodgeTiming = fooAllInOne.dodgeItSkillReady[1]["skilloffset"]
							end
						else
							dodgeSelector = NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[1]["skillname"])
							dodgeItemStyle = fooAllInOne.dodgeItSkillReady[1]["skillstyle"]
							dodgeTargeting = fooAllInOne.dodgeItSkillReady[1]["skilltargeting"]
							dodgeTiming = fooAllInOne.dodgeItSkillReady[1]["skilloffset"]
						end
					end
				end
			end
		end
		if #fooAllInOne.dodgeItSkillReady > 1 then
			if dodgeSelector == nil then
				if NPC.HasAbility(myHero, fooAllInOne.dodgeItSkillReady[2]["skillname"]) then
					if Ability.IsReady(NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[2]["skillname"])) and Ability.IsCastable(NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[2]["skillname"]), myMana) then
						if fooAllInOne.dodgeItSkillReady[2]["skillstyle"] <= info.style then
							if fooAllInOne.dodgeItSkillReady[2]["skilloffset"] < info.delay then
								dodgeSelector = NPC.GetAbility(myHero, fooAllInOne.dodgeItSkillReady[2]["skillname"])
								dodgeItemStyle = fooAllInOne.dodgeItSkillReady[2]["skillstyle"]
								dodgeTargeting = fooAllInOne.dodgeItSkillReady[2]["skilltargeting"]
								dodgeTiming = fooAllInOne.dodgeItSkillReady[2]["skilloffset"]
							end
						end
					end
				end
			end
		end		
	end

	if dodgeSelector ~= nil and Ability.GetName(dodgeSelector) == "ember_spirit_sleight_of_fist" then
		if not fooAllInOne.dodgerEmberSkillsChecker(myHero, "ember_spirit_sleight_of_fist") then
			dodgeSelector = nil
		end
	end

	if dodgeSelector == nil then
		for i, v in ipairs(fooAllInOne.dodgeItReadyTable) do
			if info.lotus == 0 then
				if info.global == 0 then
					if v.itemname ~= "item_lotus_orb" then
						if (NPC.GetUnitName(info.source) == "npc_dota_hero_lion" and info.style == 1) or NPC.GetUnitName(info.source) == "npc_dota_hero_nyx_assassin" or NPC.GetUnitName(info.source) == "npc_dota_hero_tidehunter" then
							if v.itemname ~= "item_manta" then
								if v.itemstyle <= info.style then
									if NPC.HasItem(myHero, v.itemname) then
										if Ability.IsReady(NPC.GetItem(myHero, v.itemname)) and Ability.IsCastable(NPC.GetItem(myHero, v.itemname), myMana) then
											dodgeSelector = NPC.GetItem(myHero, v.itemname, true)
											dodgeItemStyle = v.itemstyle
											dodgeTargeting = v.itemtargeting
											dodgeTiming = v.itemoffset
											break
										end
									end
								end
							end

						else
							if v.itemstyle <= info.style then
								if NPC.HasItem(myHero, v.itemname) then
									if Ability.IsReady(NPC.GetItem(myHero, v.itemname)) and Ability.IsCastable(NPC.GetItem(myHero, v.itemname), myMana) then
										dodgeSelector = NPC.GetItem(myHero, v.itemname, true)
										dodgeItemStyle = v.itemstyle
										dodgeTargeting = v.itemtargeting
										dodgeTiming = v.itemoffset
										break
									end
								end
							end
						end
					end
				else
					if v.itemname ~= "item_blink" then
						if v.itemstyle <= info.style then
							if NPC.HasItem(myHero, v.itemname) then
								if Ability.IsReady(NPC.GetItem(myHero, v.itemname)) and Ability.IsCastable(NPC.GetItem(myHero, v.itemname), myMana) then
									dodgeSelector = NPC.GetItem(myHero, v.itemname, true)
									dodgeItemStyle = v.itemstyle
									dodgeTargeting = v.itemtargeting
									dodgeTiming = v.itemoffset
									break
								end
							end
						end
					end
				end			
			else
				if v.itemstyle <= info.style then
					if NPC.HasItem(myHero, v.itemname) then
						if Ability.IsReady(NPC.GetItem(myHero, v.itemname)) and Ability.IsCastable(NPC.GetItem(myHero, v.itemname), myMana) then
							dodgeSelector = NPC.GetItem(myHero, v.itemname, true)
							dodgeItemStyle = v.itemstyle
							dodgeTargeting = v.itemtargeting
							dodgeTiming = v.itemoffset
							break
						end
					end
				end
			end	
		end
	end

	if NPC.GetUnitName(myHero) == "npc_dota_hero_ember_spirit" and dodgeSelector == nil then
		if Menu.IsEnabled(fooAllInOne.dodgeEnemyHeroSpecialEmber) then
			if fooAllInOne.dodgerEmberSkillsChecker(myHero, "ember_spirit_activate_fire_remnant") then
				dodgeSelector = NPC.GetAbility(myHero, "ember_spirit_activate_fire_remnant")
				dodgeItemStyle = 0
				dodgeTargeting = "position"
				dodgeTiming = 0.1
			end
		end
	end		

	if dodgeSelector == nil then return end

	local delay = info.delay
		if NPC.GetUnitName(info.source) == "npc_dota_hero_lina" then
			if Ability.GetName(dodgeSelector) == "item_blink" or Ability.GetName(dodgeSelector) == "item_lotus_orb" or Ability.GetName(dodgeSelector) == "nyx_assassin_spiked_carapace" or Ability.GetName(dodgeSelector) == "sandking_sand_storm" or Ability.GetName(dodgeSelector) == "templar_assassin_meld" then
				delay = info.delay - 0.225
			end
		elseif NPC.GetUnitName(info.source) == "npc_dota_hero_lion" and info.spellname == "lion_finger_of_death" then
			if Ability.GetName(dodgeSelector) == "item_blink" or Ability.GetName(dodgeSelector) == "item_lotus_orb" or Ability.GetName(dodgeSelector) == "nyx_assassin_spiked_carapace" or Ability.GetName(dodgeSelector) == "sandking_sand_storm" or Ability.GetName(dodgeSelector) == "templar_assassin_meld" then
				delay = info.delay - 0.275
			end
		end

	if info.time + delay - dodgeTiming + 0.05 < GameRules.GetGameTime() then return end

	if info.lotus == 1 and NPC.IsLinkensProtected(myHero) then return end
	if info.lotus == 1 and NPC.HasModifier(myHero, "modifier_item_lotus_orb_active") then return end
	if info.style == 2 and NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end
	if NPC.HasModifier(myHero, "modifier_item_glimmer_cape_fade") then return end
	if NPC.HasModifier(myHero, "modifier_templar_assassin_refraction_absorb") then return end
	
	table.insert(fooAllInOne.dodgeItTable, {casttime = info.time, delay = delay, unit = info.source, dodgeobject = dodgeSelector, objecttargeting = dodgeTargeting, objectoffset = dodgeTiming, castpoint = info.castpoint, spellname = info.spellname})

end

function fooAllInOne.dodgerSkillAvailable(myHero)

	if not myHero then return end

	if next(fooAllInOne.dodgeItSkillReady) == nil then

		for i = 1, #fooAllInOne.dodgeItSkills do
			if NPC.HasAbility(myHero, fooAllInOne.dodgeItSkills[i][1]) then
				if Menu.IsEnabled(fooAllInOne.dodgeEnemyHeroskillsOptionsTable[fooAllInOne.dodgeItSkills[i][1]]) then
					if Ability.GetLevel(NPC.GetAbility(myHero, fooAllInOne.dodgeItSkills[i][1])) > 0 then
						table.insert(fooAllInOne.dodgeItSkillReady, {skillname = fooAllInOne.dodgeItSkills[i][1], skillstyle = fooAllInOne.dodgeItSkills[i][2], skilltargeting = fooAllInOne.dodgeItSkills[i][3], skilloffset = fooAllInOne.dodgeItSkills[i][4] })
					end
				end
			end
		end
	end

end
				
function fooAllInOne.dodgerSelectItemorSkill(myHero)

	if not myHero then return end

	if next(fooAllInOne.dodgeItReadyTable) == nil then

		for i = 1, #fooAllInOne.dodgeItItems do
			if Menu.GetValue(fooAllInOne.dodgeItOptionTable[i]) > 0 then
				table.insert(fooAllInOne.dodgeItReadyTable, { prio = Menu.GetValue(fooAllInOne.dodgeItOptionTable[i]), itemname = fooAllInOne.dodgeItItems[i][1], itemstyle = fooAllInOne.dodgeItItems[i][2], itemtargeting = fooAllInOne.dodgeItItems[i][3], itemoffset = fooAllInOne.dodgeItItems[i][4] })
			end
		end
	end

	table.sort(fooAllInOne.dodgeItReadyTable, function(a, b)
       		return a.prio < b.prio
    	end)

end

function fooAllInOne.dodgerRangeOffsetter(myHero, enemy, dodgeSkillName, attackSkillName)

	if not myHero then return end

	if not dodgeSkillName and not attackSkillName then 
		return 
	end

	if dodgeSkillName == "item_blink" then 
		return Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(1150)
	end

	local maxRange = 1000
		if dodgeSkillName == "morphling_waveform" then
			maxRange = 990
		elseif dodgeSkillName == "phantom_lancer_doppelwalk" then
			maxRange = 590
		elseif dodgeSkillName == "faceless_void_time_walk" then
			maxRange = 670
		elseif dodgeSkillName == "ember_spirit_sleight_of_fist" then
			maxRange = 690
		end

	local minRange = 190
		if dodgeSkillName == "morphling_waveform" or dodgeSkillName == "faceless_void_time_walk" then
			minRange = maxRange
		end


	if dodgeSkillName ~= "ember_spirit_sleight_of_fist" then
		if attackSkillName == "enigma_black_hole" or attackSkillName == "faceless_void_chronosphere" then
			return Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(590)
		elseif attackSkillName == "lion_impale" or attackSkillName == "nyx_assassin_impale" or spellname == "pudge_dismember" then
			return Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(350)
		elseif attackSkillName == "queenofpain_sonic_wave" or attackSkillName == "tidehunter_ravage" then
			return Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(maxRange)
		else
			return Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(minRange)
		end
	else
		local effectRange = Ability.GetLevel(NPC.GetAbility(myHero, "ember_spirit_sleight_of_fist")) * 100 + 150 - 1
		for i = 0, math.ceil(maxRange / effectRange) do
			if #NPCs.InRadius(Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(i * effectRange), effectRange, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) > 0 then
				return Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(i * effectRange + 1)
			end
		end
	end

end

function fooAllInOne.dodger(myHero)

	if not myHero then return end

	local myMana = NPC.GetMana(myHero)

	if next(fooAllInOne.dodgeItTable) == nil then
		for i = 1, Heroes.Count() do
			local enemy = Heroes.Get(i)
			if enemy and Entity.IsHero(enemy) and not Entity.IsSameTeam(myHero, enemy) and not Entity.IsDormant(enemy) and (NPC.GetUnitName(enemy) == "npc_dota_hero_axe" or NPC.GetUnitName(enemy) == "npc_dota_hero_sand_king") and not NPC.IsIllusion(enemy) then
				if Entity.IsAlive(enemy) then
					local axe_call = NPC.GetAbility(enemy, "axe_berserkers_call")
					local call_range = 300
					if axe_call and Ability.IsInAbilityPhase(axe_call) and NPC.IsEntityInRange(myHero, enemy, call_range) then
						fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = 0.4; style = 1; source = enemy, lotus = 0, castpoint = 0.4, spellname = "axe_berserkers_call"})
						break
						return
					end
					local burrowStrike = NPC.GetAbility(enemy, "sandking_burrowstrike")
					local burrowRange = 650
					local hitRange = 175
					local burrowSpeed = 2000
						if NPC.HasItem(enemy, "item_ultimate_scepter", true) or NPC.HasModifier(enemy, "modifier_item_ultimate_scepter_consumed") then
							burrowRange = 1300
							burrowSpeed = 3000
						end
					local impactTime = ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length() / burrowSpeed) - 0.2
						if impactTime < 0.1 then
							impactTime = 0.1
						end
					if burrowStrike and Ability.SecondsSinceLastUse(burrowStrike) > -1 and Ability.SecondsSinceLastUse(burrowStrike) <= 0 and NPC.IsEntityInRange(myHero, enemy, burrowRange+hitRange) then	
						if fooAllInOne.dodgeIsTargetMe(myHero, enemy, hitRange, burrowRange) then
						--	local impactTime = ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() - 25) / 2000 - 0.325
							fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = impactTime; style = 2; source = enemy, lotus = 0, castpoint = 0, spellname = "sandking_burrowstrike", global = 0, type = "disable"})
							break
							return
						end
					end
				end
			end
		end
	end

	if next(fooAllInOne.dodgeItTable) == nil then
		if NPC.GetUnitName(myHero) == "npc_dota_hero_alchemist" then
			if NPC.HasModifier(myHero, "modifier_alchemist_unstable_concoction") then
				if Modifier.GetCreationTime(NPC.GetModifier(myHero, "modifier_alchemist_unstable_concoction")) + 5.5 - GameRules.GetGameTime() < 0.15 then
					fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = 0.15; style = 1; source = myHero, lotus = 0, castpoint = 0, spellname = "alchemist_unstable_concoction_throw"})
					return
				end
			end
		end
	end

	if next(fooAllInOne.dodgeItTable) == nil then return end

	local curTime = GameRules.GetGameTime()

	if not fooAllInOne.heroCanCastItems(myHero) then
--		fooAllInOne.dodgeItTable = {}
		return
	end

	if os.clock() - fooAllInOne.dodgeTiming < 0.5 then return end

	local dodgeInfo = fooAllInOne.dodgeItTable[1]
		local casttime = dodgeInfo.casttime
		local delay = dodgeInfo.delay
		local unit = dodgeInfo.unit
		local castpoint = dodgeInfo.castpoint
		local spellname = dodgeInfo.spellname
		local dodgeobject = dodgeInfo.dodgeobject
		local objecttargeting = dodgeInfo.objecttargeting
		local objectoffset = dodgeInfo.objectoffset

		if curTime > casttime + delay + 0.05 then
			fooAllInOne.dodgeItTable = {}
			return
		end

	if NPC.GetUnitName(unit) == "npc_dota_hero_sniper" then
		if curTime >= casttime + delay - objectoffset - (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
			if NPC.HasModifier(myHero, "modifier_sniper_assassinate") then
				if objecttargeting == "no target" then
					Ability.CastNoTarget(dodgeobject)
					fooAllInOne.dodgeTiming = os.clock()
					fooAllInOne.dodgeItTable = {}
					return
				elseif objecttargeting == "position" then
					if fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname) ~= nil then
						Ability.CastPosition(dodgeobject, fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname))
						fooAllInOne.dodgeTiming = os.clock()
						fooAllInOne.dodgeItTable = {}
						return
					end
				elseif objecttargeting == "target" then
					Ability.CastTarget(dodgeobject, myHero)
					fooAllInOne.dodgeTiming = os.clock()
					fooAllInOne.dodgeItTable = {}
					return
				end
			end
		end
	else	
		if unit and not Entity.IsDormant(unit) then
			if curTime >= casttime + castpoint - objectoffset - (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
				if not Ability.IsInAbilityPhase(NPC.GetAbility(unit, spellname)) and castpoint > 0 then
					if delay > castpoint then
						if Ability.SecondsSinceLastUse(NPC.GetAbility(unit, spellname)) == -1 then
							fooAllInOne.dodgeItTable = {}
							return
						else
							if curTime >= casttime + delay - objectoffset - (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then

								if objecttargeting == "no target" then
									Ability.CastNoTarget(dodgeobject)
									fooAllInOne.dodgeTiming = os.clock()
									fooAllInOne.dodgeItTable = {}
									return
								elseif objecttargeting == "position" then
									if fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname) ~= nil then
										Ability.CastPosition(dodgeobject, fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname))
										fooAllInOne.dodgeTiming = os.clock()
										fooAllInOne.dodgeItTable = {}
										return
									end
								elseif objecttargeting == "target" then
									Ability.CastTarget(dodgeobject, myHero)
									fooAllInOne.dodgeTiming = os.clock()
									fooAllInOne.dodgeItTable = {}
									return
								end
							end
						end
					else
						fooAllInOne.dodgeItTable = {}
						return
					end
				else
					if curTime >= casttime + delay - objectoffset - (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
						if objecttargeting == "no target" then
							Ability.CastNoTarget(dodgeobject)
							fooAllInOne.dodgeTiming = os.clock()
							fooAllInOne.dodgeItTable = {}
							return
						elseif objecttargeting == "position" then
							if fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname) ~= nil then
								Ability.CastPosition(dodgeobject, fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname))
								fooAllInOne.dodgeTiming = os.clock()
								fooAllInOne.dodgeItTable = {}
								return
							end
						elseif objecttargeting == "target" then
							Ability.CastTarget(dodgeobject, myHero)
							fooAllInOne.dodgeTiming = os.clock()
							fooAllInOne.dodgeItTable = {}
							return
						end
					end
				end
			end
		else
			if curTime >= casttime + delay - objectoffset - (NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
				if objecttargeting == "no target" then
					Ability.CastNoTarget(dodgeobject)
					fooAllInOne.dodgeTiming = os.clock()
					fooAllInOne.dodgeItTable = {}
					return
				elseif objecttargeting == "position" then
					if fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname) ~= nil then
						Ability.CastPosition(dodgeobject, fooAllInOne.dodgerRangeOffsetter(myHero, unit, Ability.GetName(dodgeobject), spellname))
						fooAllInOne.dodgeTiming = os.clock()
						fooAllInOne.dodgeItTable = {}
						return
					end
				elseif objecttargeting == "target" then
					Ability.CastTarget(dodgeobject, myHero)
					fooAllInOne.dodgeTiming = os.clock()
					fooAllInOne.dodgeItTable = {}
					return
				end
			end
		end
	end

end

function fooAllInOne.dodgeProcessing(myHero, unit, activity, castpoint)

	if not myHero then return end
	if Entity.IsSameTeam(myHero, unit) then return end

	local distance = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(unit)):Length2D() - 25

	if NPC.GetUnitName(unit) == "npc_dota_hero_antimage" then
		local radius = 500
		local castrange = 600
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "antimage_mana_void", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_alchemist" then
		local radius = 0
		local castrange = 775
		local impactTime = distance / 900
		if activity == Enum.GameActivity.ACT_DOTA_ALCHEMIST_CONCOCTION_THROW and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "alchemist_unstable_concoction_throw", global = 0, type = "disable"})
			end
		end		
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_bane" then
		local radius = 0
		local castrange = 800
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "bane_fiends_grip", global = 0, type = "disable"})
			end
		end		
	end	

	if NPC.GetUnitName(unit) == "npc_dota_hero_batrider" then
		local radius = 0
		local castrange = 200
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "batrider_flaming_lasso", global = 0, type = "disable"})
			end
		end
	end	

--	if NPC.GetUnitName(unit) == "npc_dota_hero_beastmaster" then
--		local radius = 
--		local castrange = 
--		if sequenceName == "cast4_primal_roar_anim" and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
--			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
--				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = })
--			end
--		end
--	end	

	if NPC.GetUnitName(unit) == "npc_dota_hero_bloodseeker" then
		local radius = 0
		local castrange = 1000
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "bloodseeker_rupture", global = 0, type = "nuke"})
			end
		end
	end	

	if NPC.GetUnitName(unit) == "npc_dota_hero_centaur" then
		local radius = 315
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius) then
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "centaur_hoof_stomp", global = 0, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_chaos_knight" then
		local radius = 0
		local castrange = 500
		local impactTime = distance / 1000 - 0.15
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "chaos_knight_chaos_bolt", global = 0, type = "disable"})
			end
		end	
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_crystal_maiden" then
		local radius = 0
		local castrange = 650
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "crystal_maiden_frostbite", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_death_prophet" then
		local radius = 425
		local castrange = 1000
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, 425, 1000) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "death_prophet_silence", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_doom_bringer" then
		local radius = 0
		local castrange = 550
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_6 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "doom_bringer_doom", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_drow_ranger" then
		local radius = 900
		local castrange = 250
		local impactTime = distance / 2000 - 0.1
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "drow_ranger_wave_of_silence", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_earthshaker" then
		local radius1 = 225
		local castrange = 1400
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius1+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius1, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "earthshaker_fissure", global = 0, type = "disable"})
			end
		end

		local radius2 = 350
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius2) then
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "earthshaker_enchant_totem", global = 0, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_enigma" then
		local radius = 420
		local castrange = 275
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 0; source = unit, lotus = 0, castpoint = castpoint, spellname = "enigma_black_hole", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_faceless_void" then
		local radius = 425
		local castrange = 600
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 0; source = unit, lotus = 0, castpoint = castpoint, spellname = "faceless_void_chronosphere", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_juggernaut" then
		local radius = 425
		local castrange = 350
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "juggernaut_omni_slash", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_legion_commander" then
		local radius = 0
		local castrange = 300
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = "legion_commander_duel", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_lich" then
		local radius = 0
		local castrange = 1000
		local impactTime = distance / 850
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint + impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "lich_chain_frost", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_lina" then
		local radius = 0
		local castrange = 725
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint + 0.225; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "lina_laguna_blade", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_lion" then
		local radius1 = 125
		local castrange1 = 725
		local impactTime = distance / 1600 - 0.2
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius1+castrange1) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius1, castrange1) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "lion_impale", global = 0, type = "disable"})
			end
		end

		local radius2 = 0
		local castrange2 = 900
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius2+castrange2) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius2, castrange2) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint + 0.275; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "lion_finger_of_death", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_luna" then
		local radius = 0
		local castrange = 800
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "luna_lucent_beam", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_magnataur" then
		local radius = 0
		local castrange = 460
		local instant_radius = 150 + 50
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			local delay = castpoint
			if distance <= instant_radius then delay = 0 end
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = "magnataur_reverse_polarity", global = 0, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_necrolyte" then
		local radius = 0
		local castrange = 650
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "necrolyte_reapers_scythe", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_night_stalker" then
		local radius = 0
		local castrange = 650
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+0.075; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "night_stalker_crippling_fear", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_nyx_assassin" then
		local radius = 125
		local castrange = 700
		local impactTime = distance / 1600 + 0.1
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "nyx_assassin_impale", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_ogre_magi" then
		local radius = 0
		local castrange = 600
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "ogre_magi_fireblast", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_obsidian_destroyer" then
		local radius1 = 0
		local castrange1 = 450
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius1+castrange1) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius1, castrange1) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "obsidian_destroyer_astral_imprisonment", global = 0, type = "disable"})
			end
		end

		local radius2 = 575
		local castrange2 = 700
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius2+castrange2) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius2, castrange2) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "obsidian_destroyer_sanity_eclipse", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_puck" then
		local radius = 450
		local castrange = 0
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "puck_waning_rift", global = 0, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_pudge" then
		local radius = 0
		local castrange = 250
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "pudge_dismember", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_queenofpain" then
		local radius = 450
		local castrange = 900
		local impactTime = distance / 900 - 0.25
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 0; source = unit, lotus = 0, castpoint = castpoint, spellname = "queenofpain_sonic_wave", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_rubick" then
		local radius = 0
		local castrange = 700
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "rubick_telekinesis", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_shadow_demon" then
		local radius = 0
		local castrange = 700
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "shadow_demon_disruption", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_shadow_shaman" then
		local radius = 0
		local castrange = 500
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_3 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "shadow_shaman_shackles", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_silencer" then
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 then
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = "silencer_global_silence", global = 1, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_skywrath_mage" then
		local radius = 0
		local castrange = 750
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_3 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "skywrath_mage_ancient_seal", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_slardar" then
		local radius = 350
		local castrange = 0
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "slardar_slithereen_crush", global = 0, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_sniper" then
		local radius = 0
		local castrange = 3000
		local impactTime = distance / 2500 - 0.05
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then	
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "sniper_assassinate", global = 0, type = "nuke"})
			end
		end
	end
		

--	if NPC.GetUnitName(unit) == "npc_dota_hero_spirit_breaker" then
--		local radius = 0
--		local castrange = 850
--	--	if sequenceName == "ultimate_anim" and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
--		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
--			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
--				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "spirit_breaker_nether_strike", global = 0, type = "nuke"})
--			end
--		end
--	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_storm_spirit" then
		local radius = 0
		local castrange = 350
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "storm_spirit_electric_vortex", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_sven" then
		local radius = 0
		local castrange = 600
		local impactTime = distance / 1000 - 0.15
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "sven_storm_bolt", global = 0, type = "disable"})
			end
		end
	end

--	if NPC.GetUnitName(unit) == "npc_dota_hero_techies" then
--		local radius = 
--		local castrange = 
--		if sequenceName == "cast_blast_off" and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
--			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
--				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = })
--			end
--		end
--	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_terrorblade" then
		local radius = 0
		local castrange = 600
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 1, castpoint = castpoint, spellname = "terrorblade_sunder", global = 0, type = "nuke"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_tidehunter" then
		local radius = 0
		local castrange = 1100
		local impactTime = distance / 775 - 0.35
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			local adjust = impactTime
			if distance <= 250 then adjust = 0 end
			fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint + adjust; style = 2; source = unit, lotus = 0, castpoint = castpoint, spellname = "tidehunter_ravage", global = 0, type = "disable"})
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_tinker" then
		local radius = 0
		local castrange = 900
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+0.1; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "tinker_laser", global = 0, type = "nuke"})
			end
		end
	end

--	if NPC.GetUnitName(unit) == "npc_dota_hero_treant" then
--		local radius = 0
--		local castrange = 850
--		if sequenceName == "cast5_Overgrowth_anim" and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
--			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
--				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = })
--			end
--		end
--	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_vengefulspirit" then
		local radius = 0
		local castrange = 500
		local impactTime = distance / 1250 - 0.1
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "vengefulspirit_magic_missile", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_warlock" then
		local radius = 600
		local castrange = 1200
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_4 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+0.5; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = "warlock_rain_of_chaos", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_windrunner" then
		local radius = 0
		local castrange = 800
		local impactTime = distance / 1650 - 0.1
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "windrunner_shackleshot", global = 0, type = "disable"})
			end
		end
	end

--	if NPC.GetUnitName(unit) == "npc_dota_hero_winter_wyvern" then
--		local radius = 500
--		local castrange = 800
--		if sequenceName == "cast04_winters_curse_flying_low_anim" and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
--			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
--				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = })
--			end
--		end
--	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_skeleton_king" then
		local radius = 0
		local castrange = 525
		local impactTime = distance / 1000 - 0.2
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_1 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint+impactTime; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "skeleton_king_hellfire_blast", global = 0, type = "disable"})
			end
		end
	end

	if NPC.GetUnitName(unit) == "npc_dota_hero_zuus" then
		local radius = 375
		local castrange = 900
		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_2 and NPC.IsEntityInRange(myHero, unit, radius+castrange) then
			if fooAllInOne.dodgeIsTargetMe(myHero, unit, radius, castrange) then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 2; source = unit, lotus = 1, castpoint = castpoint, spellname = "zuus_lightning_bolt", global = 0, type = "nuke"})
			end
		end

		if activity == Enum.GameActivity.ACT_DOTA_CAST_ABILITY_5 then
			if fooAllInOne.IsHeroInvisible(myHero) == false and not NPC.HasModifier(myHero, "modifier_smoke_of_deceit") then
				fooAllInOne.dodgeIt({time = GameRules.GetGameTime(); delay = castpoint; style = 1; source = unit, lotus = 0, castpoint = castpoint, spellname = "zuus_thundergods_wrath", global = 1, type = "nuke"})
			end
		end
	end

end

-- ward awareness
function fooAllInOne.wardProcessing(myHero)

	if not myHero then return end

	if os.clock() - fooAllInOne.wardCaptureTiming < 0.5 then return end

	for i = 1, Heroes.Count() do
		local heroes = Heroes.Get(i)
		if heroes and Entity.IsHero(heroes) and Entity.IsAlive(heroes) and not Entity.IsDormant(heroes) and not Entity.IsSameTeam(myHero, heroes) and not NPC.IsIllusion(heroes) then
			local sentry = NPC.GetItem(heroes, "item_ward_sentry", true)
			local observer = NPC.GetItem(heroes, "item_ward_observer", true)
			local dispenser = NPC.GetItem(heroes, "item_ward_dispenser", true)
			local sentryStack = 0
			local observerStack = 0
			local ownerID = Entity.GetIndex(heroes)
			if sentry then
				sentryStack = Item.GetCurrentCharges(sentry)
			elseif observer then
				observerStack = Item.GetCurrentCharges(observer)
			elseif dispenser then
				sentryStack = Item.GetSecondaryCharges(dispenser)
				observerStack = Item.GetCurrentCharges(dispenser)
			end

			if sentryStack == 0 and observerStack == 0 then
				if fooAllInOne.wardDispenserCount[ownerID] == nil then
					fooAllInOne.wardDispenserCount[ownerID] = nil
					fooAllInOne.wardCaptureTiming = os.clock()
				else
					if fooAllInOne.wardDispenserCount[ownerID]["sentry"] > sentryStack then
						fooAllInOne.wardProcessingTable[ownerID + math.floor(GameRules.GetGameTime())] = {type = "sentry", pos = Entity.GetAbsOrigin(heroes), dieTime = math.floor(GameRules.GetGameTime() + 240)}
						fooAllInOne.wardDispenserCount[ownerID] = nil
						fooAllInOne.wardCaptureTiming = os.clock()
					elseif fooAllInOne.wardDispenserCount[ownerID]["observer"] > sentryStack then
						fooAllInOne.wardProcessingTable[ownerID + math.floor(GameRules.GetGameTime())] = {type = "observer", pos = Entity.GetAbsOrigin(heroes), dieTime = math.floor(GameRules.GetGameTime() + 360)}
						fooAllInOne.wardDispenserCount[ownerID] = nil
						fooAllInOne.wardCaptureTiming = os.clock()
					end
				end
			end
						
			if fooAllInOne.wardDispenserCount[ownerID] == nil then
				if sentryStack > 0 or observerStack > 0 then
					fooAllInOne.wardDispenserCount[ownerID] = {sentry = sentryStack, observer = observerStack}
					fooAllInOne.wardCaptureTiming = os.clock()
				end
			else
				if fooAllInOne.wardDispenserCount[ownerID]["sentry"] < sentryStack then
					fooAllInOne.wardDispenserCount[ownerID] = {sentry = sentryStack, observer = observerStack}
					fooAllInOne.wardCaptureTiming = os.clock()
				elseif fooAllInOne.wardDispenserCount[ownerID]["observer"] < observerStack then
					fooAllInOne.wardDispenserCount[ownerID] = {sentry = sentryStack, observer = observerStack}
					fooAllInOne.wardCaptureTiming = os.clock()
				elseif fooAllInOne.wardDispenserCount[ownerID]["sentry"] > sentryStack then
					fooAllInOne.wardProcessingTable[ownerID + math.floor(GameRules.GetGameTime())] = {type = "sentry", pos = Entity.GetAbsOrigin(heroes), dieTime = math.floor(GameRules.GetGameTime() + 240)}
					fooAllInOne.wardDispenserCount[ownerID] = {sentry = sentryStack, observer = observerStack}
					fooAllInOne.wardCaptureTiming = os.clock()
				elseif fooAllInOne.wardDispenserCount[ownerID]["observer"] > observerStack then
					fooAllInOne.wardProcessingTable[ownerID + math.floor(GameRules.GetGameTime())] = {type = "observer", pos = Entity.GetAbsOrigin(heroes), dieTime = math.floor(GameRules.GetGameTime() + 360)}
					fooAllInOne.wardDispenserCount[ownerID] = {sentry = sentryStack, observer = observerStack}
					fooAllInOne.wardCaptureTiming = os.clock()
				end
			end
		elseif heroes and Entity.IsHero(heroes) and Entity.IsDormant(heroes) then
			local ownerID = Entity.GetIndex(heroes)
			fooAllInOne.wardDispenserCount[ownerID] = nil
			fooAllInOne.wardCaptureTiming = os.clock()
		end
	end

	for k, l in pairs(fooAllInOne.wardProcessingTable) do
		if l then
			if GameRules.GetGameTime() > l.dieTime then
				fooAllInOne.wardProcessingTable[k] = nil
			end	
		end
	end

end

function fooAllInOne.drawWard(myHero)

	if not myHero then return end

	if next(fooAllInOne.wardProcessingTable) == nil then return end

	local sentryImageHandle = fooAllInOne.sentryImageHandle
		if sentryImageHandle == nil then
			sentryImageHandle = Renderer.LoadImage("resource/flash3/images/items/" .. "ward_sentry" .. ".png")
			fooAllInOne.sentryImageHandle = sentryImageHandle
		end
	local obsImageHandle = fooAllInOne.obsImageHandle
		if obsImageHandle == nil then
			obsImageHandle = Renderer.LoadImage("resource/flash3/images/items/" .. "ward_observer" .. ".png")
			fooAllInOne.obsImageHandle = obsImageHandle
		end

	for i, v in pairs(fooAllInOne.wardProcessingTable) do
		if v then
			local type = v.type
			local pos = v.pos
			local dieTime = v.dieTime
			if dieTime > GameRules.GetGameTime() then
				local x, y, visible = Renderer.WorldToScreen(pos)
				local hoveringOver = Input.IsCursorInRect(x, y, 30, 30)
				if visible then
					if type == "sentry" then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawImage(sentryImageHandle, x, y, 30, 30)
						Renderer.DrawText(fooAllInOne.font, x, y+30, math.floor(dieTime - GameRules.GetGameTime()), 0)
					elseif type == "observer" then
						Renderer.SetDrawColor(255, 255, 255, 255)
						Renderer.DrawImage(obsImageHandle, x, y, 30, 30)
						Renderer.DrawText(fooAllInOne.font, x, y+30, math.floor(dieTime - GameRules.GetGameTime()), 0)
					end
					if Menu.IsEnabled(fooAllInOne.optionWardAwarenessClickRemove) and (os.clock() - fooAllInOne.wardDrawingRemove) >= 0.25 then
						if hoveringOver and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
							fooAllInOne.wardDrawingRemove = os.clock()
						end
					else
						if hoveringOver and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
							fooAllInOne.wardProcessingTable[i] = nil
						end
					end
				end
			end
		end
	end

end

-- item usage functions
function fooAllInOne.itemUsage(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	if not Menu.IsEnabled(fooAllInOne.optionItemEnable) then return end
	if (os.clock() - fooAllInOne.lastItemTick) < fooAllInOne.itemDelay then return end
	if fooAllInOne.ItemCastStop then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Menu.GetValue(fooAllInOne.optionItemStyle) == 0 then 
		fooAllInOne.itemUsageNoOrder(myHero, enemy)
	elseif Menu.GetValue(fooAllInOne.optionItemStyle) == 1 then
		fooAllInOne.itemUsageOrder(myHero, enemy)
	elseif Menu.GetValue(fooAllInOne.optionItemStyle) == 2 then
		fooAllInOne.itemUsageSmartOrder(myHero, enemy)
	end

end

function fooAllInOne.itemUsageNoOrder(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local myMana = NPC.GetMana(myHero)

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local hex = NPC.GetItem(myHero, "item_sheepstick", true)
	local blood = NPC.GetItem(myHero, "item_bloodthorn", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local orchid = NPC.GetItem(myHero, "item_orchid", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
	local atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local abyssal = NPC.GetItem(myHero, "item_abyssal_blade", true)
	local halberd = NPC.GetItem(myHero, "item_heavens_halberd", true)
	local shivas = NPC.GetItem(myHero, "item_shivas_guard", true)
	local urn = NPC.GetItem(myHero, "item_urn_of_shadows", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
	local crest = NPC.GetItem(myHero, "item_solar_crest", true)

	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		
		if fooAllInOne.ItemSleepReady(0.05) and soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.ItemSleepReady(0.05) and fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end
		end

		if fooAllInOne.ItemSleepReady(0.05) and abyssal and NPC.IsEntityInRange(myHero, enemy, 140) and Ability.IsCastable(abyssal, myMana) and Menu.GetValue(fooAllInOne.optionItemAbyssal) > 0 then 
			Ability.CastTarget(abyssal, enemy)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if fooAllInOne.ItemSleepReady(0.05) and shivas and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(shivas, myMana) and Menu.GetValue(fooAllInOne.optionItemShivas) > 0 then 
			Ability.CastNoTarget(shivas)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if fooAllInOne.ItemSleepReady(0.05) and mjollnir and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) and Menu.GetValue(fooAllInOne.optionItemMjollnir) > 0 then 
			Ability.CastTarget(mjollnir, myHero)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if fooAllInOne.ItemSleepReady(0.05) and manta and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) and Menu.GetValue(fooAllInOne.optionItemManta) > 0 then 
			Ability.CastNoTarget(manta)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then

			if fooAllInOne.ItemSleepReady(0.05) and orchid and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(orchid, myMana) and Menu.GetValue(fooAllInOne.optionItemOrchid) > 0 then 
				Ability.CastTarget(orchid, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and blood and NPC.IsEntityInRange(myHero, enemy, 900 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(blood, myMana) and Menu.GetValue(fooAllInOne.optionItemBlood) > 0 then 
				Ability.CastTarget(blood, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and veil and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(veil, myMana) and Menu.GetValue(fooAllInOne.optionItemVeil) > 0 then 
				Ability.CastPosition(veil, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and hex and NPC.IsEntityInRange(myHero, enemy, 800 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(hex, myMana) and Menu.GetValue(fooAllInOne.optionItemHex) > 0 then 
				Ability.CastTarget(hex, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and eBlade and NPC.IsEntityInRange(myHero, enemy, 800 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(eBlade, myMana) and Menu.GetValue(fooAllInOne.optionItemeBlade) > 0 then 
				Ability.CastTarget(eBlade, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end
	
			if fooAllInOne.ItemSleepReady(0.05) and atos and NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(atos, myMana) and Menu.GetValue(fooAllInOne.optionItemAtos) > 0 then 
				Ability.CastTarget(atos, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and halberd and NPC.IsEntityInRange(myHero, enemy, 600 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(halberd, myMana) and Menu.GetValue(fooAllInOne.optionItemHalberd) > 0 then
				Ability.CastTarget(halberd, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and urn and NPC.IsEntityInRange(myHero, enemy, 950 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(urn, myMana) and Item.GetCurrentCharges(urn) >= 3 and Entity.GetHealth(enemy) >= 300 and Menu.GetValue(fooAllInOne.optionItemUrn) > 0 then
				Ability.CastTarget(urn, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and medallion and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(medallion, myMana) and Menu.GetValue(fooAllInOne.optionItemMedallion) > 0 then 
				Ability.CastTarget(medallion, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and crest and NPC.IsEntityInRange(myHero, enemy, 1000 + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(crest, myMana) and Menu.GetValue(fooAllInOne.optionItemCrest) > 0 then 
				Ability.CastTarget(crest, enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end

			if fooAllInOne.ItemSleepReady(0.05) and dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) and Menu.GetValue(fooAllInOne.optionItemDagon) > 0 then
				if eBlade then
					if Ability.SecondsSinceLastUse(eBlade) > -1 and Ability.SecondsSinceLastUse(eBlade) < ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1200) then
						return
					else
						Ability.CastTarget(dagon, enemy)
						fooAllInOne.lastItemCast = os.clock()
						return
					end
				else
					Ability.CastTarget(dagon, enemy)
					fooAllInOne.lastItemCast = os.clock()
					return
				end
			end

			if Menu.GetValue(fooAllInOne.optionItemDagon) == -1 then

				if fooAllInOne.ItemSleepReady(0.05) and dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
					local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 14 / 100)))
					if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
						if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							Ability.CastTarget(dagon, enemy)
							fooAllInOne.lastItemCast = os.clock()
							return
						end
					end
				end
			end
		end
	end
end

function fooAllInOne.itemUsageOrder(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local myMana = NPC.GetMana(myHero)

	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		
		if fooAllInOne.ItemSleepReady(0.05) and soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.ItemSleepReady(0.05) and fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end
		end

		if Menu.GetValue(fooAllInOne.optionItemDagon) == -1 then

			if fooAllInOne.ItemSleepReady(0.05) and dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
				local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 14 / 100)))
				if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(dagon, enemy)
						fooAllInOne.lastItemCast = os.clock()
						return
					end
				end
			end
		end

		local orderItem
		local customOrder = 0
		local itemActivation

		for k, v in ipairs(fooAllInOne.ItemCastOrder) do

			local skipItem = 0

			if NPC.HasModifier(enemy, "modifier_black_king_bar_immune") then
				if v[2] == "item_veil_of_discord" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or
					v[2] == "item_ethereal_blade" or v[2] == "item_orchid" or v[2] == "item_rod_of_atos" or
					v[2] == "item_heavens_halberd" or v[2] == "item_urn_of_shadows" or v[2] == "item_dagon"
					or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" or v[2] == "item_medallion_of_courage" or v[2] == "item_solar_crest" then
						skipItem = v[1]
				end
			end

			if NPC.HasModifier(myHero, "modifier_item_ethereal_blade") and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_ethereal_blade", true)) > -1 and
				Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_ethereal_blade", true)) < ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1200) then
				if v[2] == "item_dagon" or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" then
					skipItem = v[1]
				end
			end

			if NPC.HasItem(myHero, v[2], true) then
				if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and (v[1] - skipItem) > customOrder then
						orderItem = NPC.GetItem(myHero, v[2], true)
						customOrder = v[1]
						itemActivation = v[3]
				end
			end	
		end
		
			if fooAllInOne.ItemSleepReady(0.05) and customOrder > 0 then
				if NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(orderItem)) then
					if itemActivation == "target" then
						Ability.CastTarget(orderItem, enemy)
						fooAllInOne.lastItemCast = os.clock()
						customOrder = 0
						return
					end
					if itemActivation == "no target" then
						Ability.CastNoTarget(orderItem)
						fooAllInOne.lastItemCast = os.clock()
						customOrder = 0
						return
					end
					if itemActivation == "position" then
						Ability.CastPosition(orderItem, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastItemCast = os.clock()
						customOrder = 0
						return
					end
				end
			end

		if fooAllInOne.ItemSleepReady(0.05) and mjollnir and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) and Menu.GetValue(fooAllInOne.optionItemMjollnir) > 0 then
			Ability.CastTarget(mjollnir, myHero)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if fooAllInOne.ItemSleepReady(0.05) and manta and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) and Menu.GetValue(fooAllInOne.optionItemManta) > 0 then
			Ability.CastNoTarget(manta)
			fooAllInOne.lastItemCast = os.clock()
			return
		end
	end
end

function fooAllInOne.itemUsageSmartOrder(myHero, enemy, activation)

	if not myHero then return end
	if not enemy then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local alternateActivation
	if activation == nil then
		alternateActivation = false
	else alternateActivation = activation
	end
	

	local myMana = NPC.GetMana(myHero)

	local soulring = NPC.GetItem(myHero, "item_soul_ring", true)
	local mjollnir = NPC.GetItem(myHero, "item_mjollnir", true)
	local manta = NPC.GetItem(myHero, "item_manta", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if (Menu.IsKeyDown(fooAllInOne.optionComboKey) or alternateActivation) then
		
		if fooAllInOne.ItemSleepReady(0.05) and soulring and Ability.IsReady(soulring) and Menu.IsEnabled(fooAllInOne.optionItemSoulring) then
			Ability.CastNoTarget(soulring)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if NPC.IsLinkensProtected(enemy) then
			if fooAllInOne.ItemSleepReady(0.05) and fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
				Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
				fooAllInOne.lastItemCast = os.clock()
				return
			end
		end

		if Menu.GetValue(fooAllInOne.optionItemDagon) == -1 then

			if fooAllInOne.ItemSleepReady(0.05) and dagon and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(dagon) + NPC.GetCastRangeBonus(myHero)) and Ability.IsCastable(dagon, myMana) then
				local dagonDMG = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetLevelSpecialValueFor(dagon, "damage") + (Ability.GetLevelSpecialValueFor(dagon, "damage") * (Hero.GetIntellectTotal(myHero) / 14 / 100)))
				if Entity.GetHealth(enemy) <= dagonDMG and not NPC.IsLinkensProtected(enemy) then
					if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(dagon, enemy)
						fooAllInOne.lastItemCast = os.clock()
						return
					end
				end
			end
		end

		local orderItem
		local customOrder = 0
		local itemActivation

		for k, v in ipairs(fooAllInOne.ItemCastOrder) do

			local skipItem = 0

			if NPC.HasModifier(enemy, "modifier_black_king_bar_immune") then
				if v[2] == "item_veil_of_discord" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or
					v[2] == "item_ethereal_blade" or v[2] == "item_orchid" or v[2] == "item_rod_of_atos" or
					v[2] == "item_heavens_halberd" or v[2] == "item_urn_of_shadows" or v[2] == "item_dagon"
					or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" or v[2] == "item_medallion_of_courage" or v[2] == "item_solar_crest" then
						skipItem = v[1]
				end
			end

			if NPC.HasModifier(enemy, "modifier_bashed") then
				if v[2] == "item_abyssal_blade" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
					skipItem = v[1]
				end
			end

			if NPC.HasModifier(enemy, "modifier_stunned") then
				local dieTime = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_stunned"))
				if GameRules.GetGameTime() <= dieTime - 0.1 then
					if v[2] == "item_abyssal_blade" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or v[2] == "item_orchid" or v[2] == "item_heavens_halberd" then
						skipItem = v[1]
					end
				end
			end

			if NPC.HasModifier(enemy, "modifier_sheepstick_debuff") then
				local dieTime = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_sheepstick_debuff"))
				if GameRules.GetGameTime() <= dieTime - 0.1 then
					if v[2] == "item_abyssal_blade" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or v[2] == "item_orchid" or v[2] == "item_heavens_halberd" then
						skipItem = v[1]
					end
				end
			end

			if NPC.HasItem(myHero, "item_sheepstick") and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_sheepstick",true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_sheepstick",true)) < 0.5 then
				if v[2] == "item_abyssal_blade" or v[2] == "item_sheepstick" or v[2] == "item_bloodthorn" or v[2] == "item_orchid" or v[2] == "item_heavens_halberd" then
					skipItem = v[1]
				end
			end

			if NPC.IsSilenced(enemy) then
				if NPC.HasModifier(enemy, "modifier_bloodthorn_debuff") then
					local dieTime = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_bloodthorn_debuff"))
					if GameRules.GetGameTime() <= dieTime - 0.1 then
						if v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
							skipItem = v[1]
						end
					end
				elseif NPC.HasModifier(enemy, "modifier_orchid_malevolence_debuff") then
					local dieTime = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_orchid_malevolence_debuff"))
					if GameRules.GetGameTime() <= dieTime - 0.1 then
						if v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
							skipItem = v[1]
						end
					end
				elseif NPC.HasModifier(enemy, "modifier_silence") then
					local dieTime = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_silence"))
					if GameRules.GetGameTime() <= dieTime - 0.1 then
						if v[2] == "item_bloodthorn" or v[2] == "item_orchid" then
							skipItem = v[1]
						end
					end
				end
			end

			if NPC.HasModifier(myHero, "modifier_item_ethereal_blade") and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_ethereal_blade", true)) > -1 and
				Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_ethereal_blade", true)) < ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1200) then
				if v[2] == "item_dagon" or v[2] == "item_dagon_2" or v[2] == "item_dagon_3" or v[2] == "item_dagon_4" 
					or v[2] == "item_dagon_5" then
					skipItem = v[1]
				end
			end

			if NPC.HasItem(myHero, v[2], true) then
				if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and (v[1] - skipItem) > customOrder then
				orderItem = NPC.GetItem(myHero, v[2], true)
						customOrder = v[1]
						itemActivation = v[3]
				end
			end	
		end
		
			if fooAllInOne.ItemSleepReady(0.05) and customOrder > 0 then
				if NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(orderItem)) then
					if itemActivation == "target" then
						Ability.CastTarget(orderItem, enemy)
						fooAllInOne.lastItemCast = os.clock()
						customOrder = 0
						return
					end
					if itemActivation == "no target" then
						Ability.CastNoTarget(orderItem)
						fooAllInOne.lastItemCast = os.clock()
						customOrder = 0
						return
					end
					if itemActivation == "position" then
						Ability.CastPosition(orderItem, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastItemCast = os.clock()
						customOrder = 0
						return
					end
				end
			end

		if fooAllInOne.ItemSleepReady(0.05) and mjollnir and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(mjollnir, myMana) and Menu.GetValue(fooAllInOne.optionItemMjollnir) > 0 then
			Ability.CastTarget(mjollnir, myHero)
			fooAllInOne.lastItemCast = os.clock()
			return
		end

		if fooAllInOne.ItemSleepReady(0.05) and manta and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Ability.IsCastable(manta, myMana) and Menu.GetValue(fooAllInOne.optionItemManta) > 0 then
			Ability.CastNoTarget(manta)
			fooAllInOne.lastItemCast = os.clock()
			return
		end
	end
end

-- linkens breaker functions
function fooAllInOne.LinkensBreakerNew(myHero)

	if not myHero then return end

	if not Menu.IsEnabled(fooAllInOne.optionLinkensEnable) then return end

	local myMana = NPC.GetMana(myHero)

 	local prioItem
	local prioOrder = 0

	for k, v in ipairs(fooAllInOne.LinkensBreakerItemOrder) do
	
		if NPC.HasItem(myHero, v[2], true) then
			if Ability.IsCastable(NPC.GetItem(myHero, v[2], true), myMana) and v[1] > prioOrder then
					prioItem = v[2]
					prioOrder = v[1]
				
			end
		end	
	
	end
	return prioItem	
end
	
-- utility item usage functions
function fooAllInOne.utilityItemUsage(myHero)

	if not myHero then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local stick = NPC.GetItem(myHero, "item_magic_stick", true)
	local wand = NPC.GetItem(myHero, "item_magic_wand", true)
	local mekansm = NPC.GetItem(myHero, "item_mekansm", true)
	local greaves = NPC.GetItem(myHero, "item_guardian_greaves", true)
	local arcane = NPC.GetItem(myHero, "item_arcane_boots", true)
	local midas = NPC.GetItem(myHero, "item_hand_of_midas", true)
	local talon = NPC.GetItem(myHero, "item_iron_talon", true)
	local cheese = NPC.GetItem(myHero, "item_cheese", true)
	local faerie = NPC.GetItem(myHero, "item_faerie_fire", true)

	local myMana = NPC.GetMana(myHero)

	if (stick or wand or cheese or faerie) and Menu.IsEnabled(fooAllInOne.optionUtilityStick) then
		fooAllInOne.utilityItemStick(myHero, stick, wand, cheese, faerie)
	end
	if mekansm and Menu.IsEnabled(fooAllInOne.optionUtilityMek) then
		fooAllInOne.utilityItemMek(myHero, mekansm, myMana)
	end
	if greaves and Menu.IsEnabled(fooAllInOne.optionUtilityGreaves) then
		fooAllInOne.utilityItemGreaves(myHero, greaves)
	end
	if arcane and Menu.IsEnabled(fooAllInOne.optionUtilityArcane) then
		fooAllInOne.utilityItemArcane(myHero, arcane)
	end
	if midas and Menu.IsEnabled(fooAllInOne.optionUtilityMidas) then
		fooAllInOne.utilityItemMidas(myHero, midas)
	end
	if talon and Menu.IsEnabled(fooAllInOne.optionUtilityTalon) then
		fooAllInOne.utilityItemTalon(myHero, talon)
	end
end

function fooAllInOne.utilityItemStick(myHero, stick, wand, cheese, faerie)

	if not myHero then return end
	if (Entity.GetAbsOrigin(myHero) - fooAllInOne.GetMyFountainPos(myHero)):Length2D() < 1500 then return end
	
	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	
	if Entity.IsAlive(myHero) and not NPC.HasModifier(myHero, "modifier_ice_blast") then
		if stick and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(stick) then
			if Item.GetCurrentCharges(stick) >= 1 then 
				Ability.CastNoTarget(stick)
				return
			end
		end
		if wand and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(wand) then 
			if Item.GetCurrentCharges(wand) >= 1 then 
				Ability.CastNoTarget(wand)
				return
			end
		end
		if cheese and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(cheese) then 
			Ability.CastNoTarget(cheese)
			return
		end
		if faerie and myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(faerie) then 
			Ability.CastNoTarget(faerie)
			return
		end
	end
end

function fooAllInOne.utilityItemMek(myHero, mekansm, myMana)

	if not myHero then return end
	if not mekansm then return end

	if (Entity.GetAbsOrigin(myHero) - fooAllInOne.GetMyFountainPos(myHero)):Length2D() < 1500 then return end

	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if Ability.IsCastable(mekansm, myMana) then
		if Entity.IsAlive(myHero) and not NPC.HasModifier(myHero, "modifier_ice_blast") then	
			if (myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth)) and Ability.IsCastable(mekansm, myMana) then 
				Ability.CastNoTarget(mekansm) 
				return
			end
		end

		for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
			if teamMates then
				if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasModifier(teamMates, "modifier_ice_blast") then	
					if (Entity.GetHealth(teamMates) / Entity.GetMaxHealth(teamMates)) * 100 <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsCastable(mekansm, myMana) then
						Ability.CastNoTarget(mekansm)
						break
						return 
					end
				end
			end
		end
	end
end

function fooAllInOne.utilityItemGreaves(myHero, greaves)

	if not myHero then return end
	if not greaves then return end

	if (Entity.GetAbsOrigin(myHero) - fooAllInOne.GetMyFountainPos(myHero)):Length2D() < 1500 then return end

	local myHealthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if Ability.IsReady(greaves) then
		if Entity.IsAlive(myHero) and not NPC.HasModifier(myHero, "modifier_ice_blast") then	
			if greaves and (myHealthPerc <= Menu.GetValue(fooAllInOne.optionUtilityHealth)) and Ability.IsReady(greaves) then 
				Ability.CastNoTarget(greaves) 
				return
			end
		end

		for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
			if teamMates then
				if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) and not NPC.HasModifier(teamMates, "modifier_ice_blast") then	
					if greaves and (Entity.GetHealth(teamMates) / Entity.GetMaxHealth(teamMates)) * 100 <= Menu.GetValue(fooAllInOne.optionUtilityHealth) and Ability.IsReady(greaves) then
						Ability.CastNoTarget(greaves) 
						break
						return
					end
				end
			end
		end
	end
end

function fooAllInOne.utilityItemArcane(myHero, arcane)

	if not myHero then return end
	if not arcane then return end

	if (Entity.GetAbsOrigin(myHero) - fooAllInOne.GetMyFountainPos(myHero)):Length2D() < 3000 then return end

	local myManaMissing = NPC.GetMaxMana(myHero) - NPC.GetMana(myHero)

	if Ability.IsReady(arcane) then
		if Entity.IsAlive(myHero) then
			if arcane and myManaMissing >= 200 then 
				Ability.CastNoTarget(arcane)
				return 
			end
		end


		for _, teamMates in ipairs(NPC.GetHeroesInRadius(myHero, 900, Enum.TeamType.TEAM_FRIEND)) do
			if teamMates then
				if Entity.IsAlive(myHero) and Entity.IsAlive(teamMates) then
					if arcane and (NPC.GetMana(teamMates) / NPC.GetMaxMana(teamMates)) * 100 <= 40 and Ability.IsReady(arcane) then 
						Ability.CastNoTarget(arcane)
						break
						return
					end
				end 
			end
		end
	end
end

function fooAllInOne.utilityItemMidas(myHero, midas, bountyXPthreshold)

	if not myHero then return end
	if not midas then return end
	if not Ability.IsReady(midas) then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local bountyXP
	if bountyXPthreshold == nil then
		if Menu.GetValue(fooAllInOne.optionUtilityMidasXP) == 0 then
			bountyXP = 40
		else
			bountyXP = 88
		end
	else bountyXP = bountyXPthreshold
	end

	for _, creeps in pairs(NPC.GetUnitsInRadius(myHero, 580, Enum.TeamType.TEAM_ENEMY)) do
		if creeps then
			local bounty = NPC.GetBountyXP(creeps)
			if fooAllInOne.IsCreepAncient(creeps) == false then
				if (NPC.IsLaneCreep(creeps) or NPC.IsCreep(creeps)) and not NPC.IsDormant(creeps) and bounty >= bountyXP and Ability.IsReady(midas) then
					Ability.CastTarget(midas, creeps)
					break
					return
				end
			end
		end
	end

end

function fooAllInOne.utilityItemTalon(myHero, talon, midas)

	if not myHero then return end
	if not talon then return end
	if midas and Ability.IsReady(midas) then return end
	if not Ability.IsReady(talon) then return end

	local maxHPcreep
	local maxHP = 0
	for _, creeps in ipairs(NPC.GetUnitsInRadius(myHero, 250, Enum.TeamType.TEAM_ENEMY)) do
		if creeps then
			if Entity.IsHero(creeps) or NPC.IsLaneCreep(creeps) then 
				return 
			end
			if fooAllInOne.IsCreepAncient(creeps) == false then
       				if NPC.IsNeutral(creeps) and (Entity.GetHealth(creeps) / Entity.GetMaxHealth(creeps)) >= 0.7 and Entity.GetHealth(creeps) >= maxHP then
            				maxHPcreep = creeps
            				maxHP = Entity.GetMaxHealth(creeps)
       				end
			end
   		end
	end

	if next(NPC.GetUnitsInRadius(myHero, 300, Enum.TeamType.TEAM_ENEMY)) == nil then
		maxHP = 0
	end

	if maxHPcreep and NPC.IsAttacking(myHero) and Ability.IsReady(talon) then
		Ability.CastTarget(talon, maxHPcreep)
		return
	end

end

function fooAllInOne.useDefensiveItems(myHero, enemy)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionDefensiveItems) then return end

	if (Entity.GetAbsOrigin(myHero) - fooAllInOne.GetMyFountainPos(myHero)):Length2D() < 1000 then return end

	if os.clock() - fooAllInOne.lastDefItemPop < 0.25 then return end

	if fooAllInOne.ItemCastStop then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local myMana = NPC.GetMana(myHero)

	local glimmerCape = NPC.GetItem(myHero, "item_glimmer_cape", true)
	local lotusOrb = NPC.GetItem(myHero, "item_lotus_orb", true)
	local crimsonGuard = NPC.GetItem(myHero, "item_crimson_guard", true)
	local pipe = NPC.GetItem(myHero, "item_pipe", true)
	local solarCrest = NPC.GetItem(myHero, "item_solar_crest", true)
	local BKB = NPC.GetItem(myHero, "item_black_king_bar", true)
	local satanic = NPC.GetItem(myHero, "item_satanic", true)
	local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
	local ghost = NPC.GetItem(myHero, "item_ghost", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsGlimmer) then
		if glimmerCape and Ability.IsCastable(glimmerCape, myMana) then
			if fooAllInOne.IsNPCinDanger(myHero, myHero) then
				Ability.CastTarget(glimmerCape, myHero)
				fooAllInOne.lastDefItemPop = os.clock()
				return
			end
			if NPC.IsChannellingAbility(myHero) then
				if NPC.GetUnitName(myHero) ~= "npc_dota_hero_tinker" and NPC.GetUnitName(myHero) ~= "npc_dota_hero_windrunner" then
					Ability.CastTarget(glimmerCape, myHero)
					fooAllInOne.lastDefItemPop = os.clock()
					return
				end
			end
			if NPC.HasModifier(myHero, "modifier_teleporting") then
				local myFountain = fooAllInOne.GetMyFountainPos(myHero)
				if not NPC.IsPositionInRange(myHero, myFountain, 2500, 0) then
					Ability.CastTarget(glimmerCape, myHero)
					fooAllInOne.lastDefItemPop = os.clock()
					return
				end
			end
			local teamMatesAround = NPC.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_FRIEND)
			if next(teamMatesAround) ~= nil then
				for _, ally in ipairs(teamMatesAround) do
					if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) or (NPC.IsChannellingAbility(ally) and NPC.GetUnitName(ally) ~= "npc_dota_hero_tinker" and NPC.GetUnitName(ally) ~= "npc_dota_hero_windrunner") then
							Ability.CastTarget(glimmerCape, ally)
							fooAllInOne.lastDefItemPop = os.clock()
							break
							return
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsGhost) then
		if ghost and Ability.IsReady(ghost) then
			if Entity.GetHealth(myHero) <= Menu.GetValue(fooAllInOne.optionDefensiveItemsThreshold)/100 * Entity.GetMaxHealth(myHero) then
				for _, v in ipairs(Entity.GetHeroesInRadius(myHero, 800, Enum.TeamType.TEAM_ENEMY)) do
					if v and Entity.IsHero(v) and not Entity.IsDormant(v) and not NPC.IsIllusion(v) then
						if NPC.FindFacingNPC(v) == myHero then
							if NPC.IsEntityInRange(myHero, v, NPC.GetAttackRange(v) + 140) then
								if NPC.IsAttacking(v) then
									Ability.CastNoTarget(ghost)
									fooAllInOne.lastDefItemPop = os.clock()
									break
									return
								end
							end
						end
					end
				end	
			end
		end
	end
				
	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemslotusOrb) then
		if lotusOrb and Ability.IsCastable(lotusOrb, myMana) then
			if fooAllInOne.IsNPCinDanger(myHero, myHero) then
				Ability.CastTarget(lotusOrb, myHero)
				fooAllInOne.lastDefItemPop = os.clock()
				return
			end
			local teamMatesAround = NPC.GetHeroesInRadius(myHero, 875, Enum.TeamType.TEAM_FRIEND)
			if next(teamMatesAround) ~= nil then
				for _, ally in ipairs(teamMatesAround) do
					if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) then
							Ability.CastTarget(lotusOrb, ally)
							fooAllInOne.lastDefItemPop = os.clock()
							break
							return
						end
					end
				end
			end
		end
	end
	
	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsCrimson) then
		if crimsonGuard and Ability.IsCastable(crimsonGuard, myMana) then
			if fooAllInOne.IsNPCinDanger(myHero, myHero) then
				Ability.CastNoTarget(crimsonGuard)
				fooAllInOne.lastDefItemPop = os.clock()
				return
			end
			local teamMatesAround = NPC.GetHeroesInRadius(myHero, 875, Enum.TeamType.TEAM_FRIEND)
			if next(teamMatesAround) ~= nil then
				for _, ally in ipairs(teamMatesAround) do
					if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) then
							Ability.CastNoTarget(crimsonGuard)
							fooAllInOne.lastDefItemPop = os.clock()
							break
							return
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsCrest) then
		if solarCrest and Ability.IsCastable(solarCrest, myMana) then
			local teamMatesAround = NPC.GetHeroesInRadius(myHero, 975, Enum.TeamType.TEAM_FRIEND)
			if next(teamMatesAround) ~= nil then
				for _, ally in ipairs(teamMatesAround) do
					if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) then
							Ability.CastTarget(solarCrest, ally)
							fooAllInOne.lastDefItemPop = os.clock()
							break
							return
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsMedallion) then
		if medallion and Ability.IsCastable(medallion, myMana) then
			local teamMatesAround = NPC.GetHeroesInRadius(myHero, 975, Enum.TeamType.TEAM_FRIEND)
			if next(teamMatesAround) ~= nil then
				for _, ally in ipairs(teamMatesAround) do
					if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) then
							Ability.CastTarget(medallion, ally)
							fooAllInOne.lastDefItemPop = os.clock()
							break
							return
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsPipe) then
		if pipe and Ability.IsCastable(pipe, myMana) then
			if fooAllInOne.IsNPCinDanger(myHero, myHero) then
				Ability.CastNoTarget(pipe)
				fooAllInOne.lastDefItemPop = os.clock()
				return
			end
			local teamMatesAround = NPC.GetHeroesInRadius(myHero, 875, Enum.TeamType.TEAM_FRIEND)
			if next(teamMatesAround) ~= nil then
				for _, ally in ipairs(teamMatesAround) do
					if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) then
							Ability.CastNoTarget(pipe)
							fooAllInOne.lastDefItemPop = os.clock()
							break
							return
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsBKB) then
		if BKB and Ability.IsReady(BKB) then
			if fooAllInOne.shouldCastBKB(myHero) == true then
				Ability.CastNoTarget(BKB)
				fooAllInOne.lastDefItemPop = os.clock()
				return
			end
		end
	end
	
	if Menu.IsEnabled(fooAllInOne.optionDefensiveItemsSatanic) then
		if satanic and Ability.IsCastable(satanic, myMana) then			
			if fooAllInOne.shouldCastSatanic(myHero, enemy) == true then
				Ability.CastNoTarget(satanic)
				fooAllInOne.lastDefItemPop = os.clock()
				return
			end
		end
	end
end

function fooAllInOne.IsNPCinDanger(myHero, npc)

	if not myHero then return end
	if not npc or NPC.IsIllusion(npc) or not Entity.IsAlive(npc) then return false end
	if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then return false end

	if NPC.GetUnitName(npc) == "npc_dota_hero_monkey_king" then
		if NPC.GetAbilityByIndex(npc, 1) ~= nil then
			if Ability.SecondsSinceLastUse(NPC.GetAbilityByIndex(npc, 1)) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbilityByIndex(npc, 1)) < 2 then
				return false
			end
		end
	end

	if NPC.GetUnitName(npc) == "npc_dota_hero_nyx_assassin" then
		if NPC.GetAbility(npc, "nyx_assassin_burrow") ~= nil and Ability.GetLevel(NPC.GetAbility(npc, "nyx_assassin_burrow")) > 0 then
			if Ability.IsInAbilityPhase(NPC.GetAbility(npc, "nyx_assassin_burrow")) then
				return false
			elseif not Ability.IsHidden(NPC.GetAbility(npc, "nyx_assassin_unburrow")) then
				return false
			end
		end
	end
	
	if NPC.HasModifier(npc, "modifier_nyx_assassin_burrow") then return false end
	if NPC.HasModifier(npc, "modifier_monkey_king_tree_dance_activity") then return false end

	if NPC.IsStunned(npc) then return true end
	if NPC.IsSilenced(npc) then return true end
	if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_ROOTED) then return true end
	if NPC.HasState(npc, Enum.ModifierState.MODIFIER_STATE_HEXED) then return true end
	if fooAllInOne.TargetDisableTimer(myHero, npc) > GameRules.GetGameTime() then return true end

	if Entity.GetHealth(npc) <= Menu.GetValue(fooAllInOne.optionDefensiveItemsThreshold)/100 * Entity.GetMaxHealth(npc) then return true end

	return false

end

function fooAllInOne.IsHeroInvisible(myHero)

	if not myHero then return false end
	if not Entity.IsAlive(myHero) then return false end

	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return true end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return true end
	if NPC.HasAbility(myHero, "invoker_ghost_walk") then
		if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 1 then 
			return true
		end
	end

	if NPC.HasItem(myHero, "item_invis_sword", true) then
		if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_invis_sword", true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_invis_sword", true)) < 1 then 
			return true
		end
	end
	if NPC.HasItem(myHero, "item_silver_edge", true) then
		if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_silver_edge", true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_silver_edge", true)) < 1 then 
			return true
		end
	end

	return false
		
end

function fooAllInOne.heroCanCastSpells(myHero)

	if not myHero then return false end
	if not Entity.IsAlive(myHero) then return false end

	if NPC.IsSilenced(myHero) then return false end 
	if NPC.IsStunned(myHero) then return false end
	if NPC.HasModifier(myHero, "modifier_bashed") then return false end
	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then return false end	
	if NPC.HasModifier(myHero, "modifier_eul_cyclone") then return false end
	if NPC.HasModifier(myHero, "modifier_obsidian_destroyer_astral_imprisonment_prison") then return false end
	if NPC.HasModifier(myHero, "modifier_shadow_demon_disruption") then return false end	
	if NPC.HasModifier(myHero, "modifier_invoker_tornado") then return false end
	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_HEXED) then return false end
	if NPC.HasModifier(myHero, "modifier_legion_commander_duel") then return false end
	if NPC.HasModifier(myHero, "modifier_axe_berserkers_call") then return false end
	if NPC.HasModifier(myHero, "modifier_winter_wyvern_winters_curse") then return false end
	if NPC.HasModifier(myHero, "modifier_bane_fiends_grip") then return false end
	if NPC.HasModifier(myHero, "modifier_bane_nightmare") then return false end
	if NPC.HasModifier(myHero, "modifier_faceless_void_chronosphere_freeze") then return false end
	if NPC.HasModifier(myHero, "modifier_enigma_black_hole_pull") then return false end
	if NPC.HasModifier(myHero, "modifier_magnataur_reverse_polarity") then return false end
	if NPC.HasModifier(myHero, "modifier_pudge_dismember") then return false end
	if NPC.HasModifier(myHero, "modifier_shadow_shaman_shackles") then return false end
	if NPC.HasModifier(myHero, "modifier_techies_stasis_trap_stunned") then return false end
	if NPC.HasModifier(myHero, "modifier_storm_spirit_electric_vortex_pull") then return false end
	if NPC.HasModifier(myHero, "modifier_tidehunter_ravage") then return false end
	if NPC.HasModifier(myHero, "modifier_windrunner_shackle_shot") then return false end

	return true	

end

function fooAllInOne.heroCanCastItems(myHero)

	if not myHero then return false end
	if not Entity.IsAlive(myHero) then return false end

	if NPC.IsStunned(myHero) then return false end
	if NPC.HasModifier(myHero, "modifier_bashed") then return false end
	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then return false end	
	if NPC.HasModifier(myHero, "modifier_eul_cyclone") then return false end
	if NPC.HasModifier(myHero, "modifier_obsidian_destroyer_astral_imprisonment_prison") then return false end
	if NPC.HasModifier(myHero, "modifier_shadow_demon_disruption") then return false end	
	if NPC.HasModifier(myHero, "modifier_invoker_tornado") then return false end
	if NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_HEXED) then return false end
	if NPC.HasModifier(myHero, "modifier_legion_commander_duel") then return false end
	if NPC.HasModifier(myHero, "modifier_axe_berserkers_call") then return false end
	if NPC.HasModifier(myHero, "modifier_winter_wyvern_winters_curse") then return false end
	if NPC.HasModifier(myHero, "modifier_bane_fiends_grip") then return false end
	if NPC.HasModifier(myHero, "modifier_bane_nightmare") then return false end
	if NPC.HasModifier(myHero, "modifier_faceless_void_chronosphere_freeze") then return false end
	if NPC.HasModifier(myHero, "modifier_enigma_black_hole_pull") then return false end
	if NPC.HasModifier(myHero, "modifier_magnataur_reverse_polarity") then return false end
	if NPC.HasModifier(myHero, "modifier_pudge_dismember") then return false end
	if NPC.HasModifier(myHero, "modifier_shadow_shaman_shackles") then return false end
	if NPC.HasModifier(myHero, "modifier_techies_stasis_trap_stunned") then return false end
	if NPC.HasModifier(myHero, "modifier_storm_spirit_electric_vortex_pull") then return false end
	if NPC.HasModifier(myHero, "modifier_tidehunter_ravage") then return false end
	if NPC.HasModifier(myHero, "modifier_windrunner_shackle_shot") then return false end

	return true	

end

function fooAllInOne.isHeroChannelling(myHero)

	if not myHero then return true end

	if NPC.IsChannellingAbility(myHero) then return true end
	if NPC.HasModifier(myHero, "modifier_teleporting") then return true end

	return false

end

function fooAllInOne.shouldCastBKB(myHero)

	if not myHero then return end

	local dangerousRangeTable = {
		alchemist_unstable_concoction_throw = 775,
		beastmaster_primal_roar = 600,
		centaur_hoof_stomp = 315,
		chaos_knight_chaos_bolt = 500,
		crystal_maiden_frostbite = 525,
		dragon_knight_dragon_tail = 400,
		drow_ranger_wave_of_silence = 900,
		earth_spirit_boulder_smash = 300,
		earthshaker_fissure = 1400,
		ember_spirit_searing_chains = 400,
		invoker_tornado = 1000,
		jakiro_ice_path = 1200,
		lion_impale = 500,
		lion_voodoo = 500,
		naga_siren_ensnare = 650,
		nyx_assassin_impale = 700,
		puck_dream_coil = 750,
		rubick_telekinesis = 625,
		sandking_burrowstrike = 650,
		shadow_shaman_shackles = 400,
		shadow_shaman_voodoo = 500,
		skeleton_king_hellfire_blast = 525,
		slardar_slithereen_crush = 400,
		storm_spirit_electric_vortex = 400,
		sven_storm_bolt = 600,
		tidehunter_ravage = 1025,
		tiny_avalanche = 600,
		vengefulspirit_magic_missile = 500,
		warlock_rain_of_chaos = 1200,
		windrunner_shackleshot = 800,
		slark_pounce = 700,
		ogre_magi_fireblast = 475,
		meepo_poof = 400
			}

	local enemyTable = {}
	local enemiesAround = Entity.GetHeroesInRadius(myHero, Menu.GetValue(fooAllInOne.optionDefensiveItemsBKBRadius), Enum.TeamType.TEAM_ENEMY)
		for _, enemy in ipairs(enemiesAround) do
			if enemy then
				if not Entity.IsDormant(enemy) and not NPC.IsIllusion(enemy) and not NPC.IsStunned(enemy) and not NPC.IsSilenced(enemy) then
					table.insert(enemyTable, enemy)
				end
			end
		end

	if next(enemyTable) == nil then return false end

	local tempTable = {}
	for i = 1, #fooAllInOne.preemptiveBKBtable do
		if Menu.IsEnabled(fooAllInOne.preemptiveBKB[i]) then
			table.insert(tempTable, fooAllInOne.preemptiveBKBtable[i])
		end
	end

	if next(tempTable) == nil then return false end

	local searchAbility
	for _, enemy in ipairs(enemyTable) do
		for _, ability in ipairs(tempTable) do
			if NPC.HasAbility(enemy, ability) then
				if NPC.GetAbility(enemy, ability) ~= nil and Ability.IsReady(NPC.GetAbility(enemy, ability)) then
					if Ability.GetLevel(NPC.GetAbility(enemy, ability)) > 0 and Ability.GetCooldownTimeLeft(NPC.GetAbility(enemy, ability)) < 1 and not Ability.IsHidden(NPC.GetAbility(enemy, ability)) then
						if dangerousRangeTable[ability] > (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() then
							searchAbility = ability
							break
						end
					end
				end
			end
		end
	end

	if searchAbility ~= nil and #enemyTable >= Menu.GetValue(fooAllInOne.optionDefensiveItemsBKBEnemies) then
		return true
	end

	return false

end

function fooAllInOne.shouldCastSatanic(myHero, enemy)

	if not myHero then return end
	if not enemy then return false end
	if Entity.GetHealth(myHero) > Entity.GetMaxHealth(myHero) * 0.3 then return false end

	if enemy then
		if NPC.IsAttacking(myHero) and Entity.GetHealth(enemy) >= Entity.GetMaxHealth(enemy) * 0.25 then
			return true
		end
	end

	return false

end

-- hero functions
function fooAllInOne.axeCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroAxe) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local call = NPC.GetAbilityByIndex(myHero, 0)
	local hunger = NPC.GetAbilityByIndex(myHero, 1)
	local culling = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local myMana = NPC.GetMana(myHero)

	if Menu.IsEnabled(fooAllInOne.optionHeroAxeCulling) then
		if culling and Ability.IsCastable(culling, myMana) and fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then
			local cullingEnemy = NPC.GetHeroesInRadius(myHero, 150 + NPC.GetCastRangeBonus(myHero), Enum.TeamType.TEAM_ENEMY)
			for i, v in ipairs(cullingEnemy) do
				if v then
					if not NPC.IsDormant(v) and not NPC.IsIllusion(v) and Entity.IsAlive(v) then
						if Entity.GetHealth(v) + NPC.GetHealthRegen(v) < Ability.GetLevelSpecialValueFor(culling, "kill_threshold") and not NPC.IsLinkensProtected(v) then
							Ability.CastTarget(culling, v)
							break
						end
					end
				end
			end
		end
	end

	local cursorCheck
	if Menu.IsEnabled(fooAllInOne.optionHeroAxeForceBlink) then
		if NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(fooAllInOne.optionHeroAxeForceBlinkRange)-1, 0) then
			cursorCheck = true
		else
			cursorCheck = false
		end
	else
		cursorCheck = true
	end
	
	fooAllInOne.itemUsage(myHero, enemy)
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and cursorCheck and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 260) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150) then
					if Menu.GetValue(fooAllInOne.optionHeroAxeJump) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
						return
					else
						Ability.CastPosition(blink, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 300, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 280))
						return
					end
				end
			end
		else
			if culling and Entity.GetHealth(enemy) + NPC.GetHealthRegen(enemy) < Ability.GetLevelSpecialValueFor(culling, "kill_threshold") and NPC.IsEntityInRange(myHero, enemy, 150) and Ability.IsCastable(culling, myMana) and not NPC.IsLinkensProtected(enemy) then 
				Ability.CastTarget(culling, enemy)
				fooAllInOne.lastTick = os.clock()
				return 
			end 
			if call and Ability.IsCastable(call, myMana) then 
				Ability.CastNoTarget(call)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(call)) and Blademail and NPC.HasModifier(enemy, "modifier_axe_berserkers_call") and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
				return
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(call)) and hunger and NPC.HasModifier(enemy, "modifier_axe_berserkers_call") and Ability.IsCastable(hunger, myMana - Ability.GetManaCost(culling)) then 
				Ability.CastTarget(hunger, enemy)
				return
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
end

function fooAllInOne.centaurCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroCentaur) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local hoofStomp = NPC.GetAbilityByIndex(myHero, 0)
	local doubleEdge = NPC.GetAbilityByIndex(myHero, 1)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local myMana = NPC.GetMana(myHero)

	local cursorCheck
	if Menu.IsEnabled(fooAllInOne.optionHeroCentaurForceBlink) then
		if NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), Menu.GetValue(fooAllInOne.optionHeroCentaurForceBlinkRange)-1, 0) then
			cursorCheck = true
		else
			cursorCheck = false
		end
	else
		cursorCheck = true
	end
	
	fooAllInOne.itemUsage(myHero, enemy)

	local stunRange = 250
		if NPC.IsRunning(enemy) then
			stunRange = 125
		end	
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and cursorCheck and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, stunRange) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150) then
					if Menu.GetValue(fooAllInOne.optionHeroCentaurJump) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
						return
					else
						Ability.CastPosition(blink, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 310, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 300))
						return
					end
				end
			end
		else
			if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				if hoofStomp and Ability.IsCastable(hoofStomp, myMana) then 
					Ability.CastNoTarget(hoofStomp)
					fooAllInOne.lastTick = os.clock()
					return
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(hoofStomp)) and Blademail and NPC.HasModifier(enemy, "modifier_stunned") and Ability.IsCastable(Blademail, myMana) then 
					Ability.CastNoTarget(Blademail)
					return
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(hoofStomp)) and doubleEdge and Ability.IsCastable(doubleEdge, myMana) then 
					Ability.CastTarget(doubleEdge, enemy)
					return
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

end

function fooAllInOne.clockwerkCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroClock) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end
	
	local BatteryAssault = NPC.GetAbilityByIndex(myHero, 0)
	local PowerCogs = NPC.GetAbilityByIndex(myHero, 1)
	local RocketFlair = NPC.GetAbilityByIndex(myHero, 2)
	local HookShot = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local myMana = NPC.GetMana(myHero)
	
	fooAllInOne.itemUsage(myHero, enemy)

	local cogsTargeter
	if NPC.IsRunning(enemy) then
		cogsTargeter = 100
	else
		cogsTargeter = 200
	end

	if fooAllInOne.clockwerkHookshotChecker(myHero, myMana, enemy, HookShot) == true then
		fooAllInOne.clockwerkHookUpValue = true
	else
		fooAllInOne.clockwerkHookUpValue = false
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, cogsTargeter) then
			if HookShot and Ability.IsCastable(HookShot, myMana) and NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(HookShot)) and fooAllInOne.clockwerkHookUpValue == true then
				local hookshotPrediction = Ability.GetCastPoint(HookShot) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / Ability.GetLevelSpecialValueFor(HookShot, "speed")) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(HookShot, fooAllInOne.castLinearPrediction(myHero, enemy, hookshotPrediction))
				fooAllInOne.lastTick = os.clock()
				return
			end
		else
			if PowerCogs and Ability.IsCastable(PowerCogs, myMana) then 
				Ability.CastNoTarget(PowerCogs)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(PowerCogs)) and BatteryAssault and Ability.IsCastable(BatteryAssault, myMana) then 
				Ability.CastNoTarget(BatteryAssault)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(BatteryAssault)) and Blademail and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
				return
			end			
			if fooAllInOne.SleepReady(Ability.GetCastPoint(BatteryAssault)) and RocketFlair and Ability.IsCastable(RocketFlair, myMana) then 
				Ability.CastPosition(RocketFlair, Entity.GetAbsOrigin(enemy))
				return 
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
end

function fooAllInOne.clockwerkHookshotChecker(myHero, myMana, enemy, HookShot)

	if not myHero then return false end
	if not enemy then return false end

	if not HookShot then return false end
		if not Ability.IsReady(HookShot) or not Ability.IsCastable(HookShot, myMana) then return false end

	local latchRadius = 135
	local distance = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() - 125
		if distance < 75 then return false end
		if distance + 150 > Ability.GetCastRange(HookShot) then return false end

	if #Entity.GetUnitsInRadius(myHero, 125, Enum.TeamType.TEAM_BOTH) > 0 then return false end

	for i = 2, math.floor(distance / latchRadius) do
		local checkVec = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized()
		local checkPos = Entity.GetAbsOrigin(myHero) + checkVec:Scaled(i*latchRadius)
		if #NPCs.InRadius(checkPos, latchRadius, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_BOTH) > 0 then
			return false
		end
	end

	return true
			
end

function fooAllInOne.clockwerkDrawHookIndicator(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroClockDrawIndicator) then return end
	
	if fooAllInOne.clockwerkHookUpValue == false then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))
		if not enemy then return end
		if not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then return end

	local pos = Entity.GetAbsOrigin(enemy)
	local posY = NPC.GetHealthBarOffset(enemy)
		pos:SetZ(pos:GetZ() + posY)
			
	local x, y, visible = Renderer.WorldToScreen(pos)

	if visible then
		Renderer.SetDrawColor(50,205,50,255)
		Renderer.DrawText(fooAllInOne.font, x-40, y-80, "hookable", 0)
	end
		
end

function fooAllInOne.huskarCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroHuskar) then return end

	local burningspear = NPC.GetAbilityByIndex(myHero, 1)
	local innerVitality = NPC.GetAbilityByIndex(myHero, 0)
	local lifeBreak = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)

	local armlet = NPC.GetItem(myHero, "item_armlet", true)
	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)

	fooAllInOne.itemUsage(myHero, enemy)

	local attackRange = NPC.GetAttackRange(myHero)
	local lifeBreakRange = Ability.GetCastRange(lifeBreak)

	if enemy and Menu.IsKeyDown(fooAllInOne.optionHeroHuskarHarassKey) then
		if burningspear and Ability.GetLevel(burningspear) > 0 then
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
			Engine.ExecuteCommand("dota_range_display " .. attackRange)
		end
	else
		Engine.ExecuteCommand("dota_range_display 0")
	end

	if enemy and Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, lifeBreakRange) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1650) then
					Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(500)))
					return
				end
			end
		else
			if innerVitality and Ability.IsCastable(innerVitality, myMana) then
				if Menu.GetValue(fooAllInOne.optionHeroHuskarInnerVit) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroHuskarInnerVit) < 2 then
						Ability.CastTarget(innerVitality, myHero)
						fooAllInOne.lastTick = os.clock()
						return 
					else
						if Entity.GetHealth(myHero) <= Entity.GetMaxHealth(myHero) * (Menu.GetValue(fooAllInOne.optionHeroHuskarHPThreshold) / 100) then
							Ability.CastTarget(innerVitality, myHero)
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			end 
			if fooAllInOne.SleepReady(Ability.GetCastPoint(innerVitality)) and lifeBreak and Ability.IsCastable(lifeBreak, myMana) and Menu.IsEnabled(fooAllInOne.optionHeroHuskarUlt) then 
				Ability.CastTarget(lifeBreak, enemy)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(lifeBreak)) and Blademail and Ability.IsCastable(Blademail, myMana) then 
				Ability.CastNoTarget(Blademail)
				return
			end
			if fooAllInOne.SleepReady(0.6) and armlet and Ability.GetToggleState(armlet) == false then
				Ability.Toggle(armlet)
				fooAllInOne.lastTick = os.clock()
				fooAllInOne.lastCastTime3 = 1
				return
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

	if armlet and Menu.IsEnabled(fooAllInOne.optionHeroHuskarArmletOff) and fooAllInOne.lastCastTime3 == 1 then
		if Entity.GetHealth(myHero) >= 0.30 * Entity.GetMaxHealth(myHero) then
			if #Entity.GetHeroesInRadius(myHero, 700, Enum.TeamType.TEAM_ENEMY) < 1 then
				if fooAllInOne.SleepReady(0.6) and Ability.GetToggleState(armlet) == true then
					Ability.Toggle(armlet)
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.lastCastTime3 = 0
					return
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroHuskarAutoVit) then
		fooAllInOne.huskarAutoBerserkersBlood(myHero, myMana, innerVitality)
	end

end

function fooAllInOne.huskarAutoBerserkersBlood(myHero, myMana, innerVitality)

	if not myHero then return end
	if not innerVitality then return end
		if not Ability.IsCastable(innerVitality, myMana) then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local myHealth = Entity.GetHealth(myHero)

	if myHealth <= Entity.GetMaxHealth(myHero) * (Menu.GetValue(fooAllInOne.optionHeroHuskarHPThreshold) / 100) then
		Ability.CastTarget(innerVitality, myHero)
		return
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroHuskarAutoVitAlly) then
		local teamMatesAround = NPC.GetHeroesInRadius(myHero, 790, Enum.TeamType.TEAM_FRIEND)
		if next(teamMatesAround) ~= nil then
			for _, ally in ipairs(teamMatesAround) do
				if ally and Entity.IsHero(ally) and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
					if fooAllInOne.IsNPCinDanger(myHero, ally) then
						Ability.CastTarget(innerVitality, ally)
						break
						return
					end
				end
			end
		end
	end

end

function fooAllInOne.skywrathCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSky) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local arcaneBolt = NPC.GetAbilityByIndex(myHero, 0)
    	local concussiveShot = NPC.GetAbilityByIndex(myHero, 1)
    	local ancientSeal = NPC.GetAbilityByIndex(myHero, 2)
    	local mysticFlare = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.skywrathComboTotalDamage(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot, mysticFlare)
	fooAllInOne.skywrathComboKillableWithoutUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot)

	if Menu.IsKeyDown(fooAllInOne.optionHeroSkyHarassKey) then
		fooAllInOne.skywrathComboHarass(myHero, myMana, arcaneBolt)
		Engine.ExecuteCommand("dota_range_display 875")
	else
		Engine.ExecuteCommand("dota_range_display 0")
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 999) then
			if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1650) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(500)))
				return
			end
		end

		if Menu.GetValue(fooAllInOne.optionHeroSkyStyle) < 1 then
			fooAllInOne.skywrathComboWithUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot, mysticFlare)
		else
			if fooAllInOne.skywrathComboSelect == true then
				fooAllInOne.skywrathComboWithoutUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot)
			else
				fooAllInOne.skywrathComboWithUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot, mysticFlare)
			end
		end

	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

end

function fooAllInOne.skywrathComboWithoutUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot)

	if not myHero then return end
	if not enemy then return end

	if concussiveShot and Ability.IsCastable(concussiveShot, myMana) and NPC.IsEntityInRange(myHero, enemy, 1550) then
		Ability.CastNoTarget(concussiveShot)
		fooAllInOne.lastTick = os.clock()
		return
	end

	if fooAllInOne.SleepReady(Ability.GetCastPoint(concussiveShot)) and arcaneBolt and Ability.IsCastable(arcaneBolt, myMana) and NPC.IsEntityInRange(myHero, enemy, 850) then
		Ability.CastTarget(arcaneBolt, enemy)
		fooAllInOne.lastTick = os.clock()
		return
	end

	if fooAllInOne.SleepReady(Ability.GetCastPoint(arcaneBolt)) and ancientSeal and Ability.IsCastable(ancientSeal, myMana) and NPC.IsEntityInRange(myHero, enemy, 685) then
		Ability.CastTarget(ancientSeal, enemy)
		fooAllInOne.lastTick = os.clock()
		return
	end

end

function fooAllInOne.skywrathComboWithUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot, mysticFlare)

	if not myHero then return end
	if not enemy then return end

	local aghanimsBuffed = false
		if NPC.HasItem(myHero, "item_ultimate_scepter", true) or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
			aghanimsBuffed = true
		end

	if concussiveShot and Ability.IsCastable(concussiveShot, myMana) and NPC.IsEntityInRange(myHero, enemy, 1550) then
		Ability.CastNoTarget(concussiveShot)
		fooAllInOne.lastTick = os.clock()
		return
	end

	if fooAllInOne.SleepReady(Ability.GetCastPoint(concussiveShot)) and arcaneBolt and Ability.IsCastable(arcaneBolt, myMana) and NPC.IsEntityInRange(myHero, enemy, 850) then
		Ability.CastTarget(arcaneBolt, enemy)
		fooAllInOne.lastTick = os.clock()
		return
	end

	if fooAllInOne.SleepReady(Ability.GetCastPoint(arcaneBolt)) and ancientSeal and Ability.IsCastable(ancientSeal, myMana) and NPC.IsEntityInRange(myHero, enemy, 685) then
		Ability.CastTarget(ancientSeal, enemy)
		fooAllInOne.lastTick = os.clock()
		return
	end

	if fooAllInOne.SleepReady(Ability.GetCastPoint(ancientSeal)) and mysticFlare and Ability.IsCastable(mysticFlare, myMana) then
		if fooAllInOne.TargetDisableTimer(myHero, enemy) > 1.5 then
			if not aghanimsBuffed then
				Ability.CastPosition(mysticFlare, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(95))
				return
			else
				Ability.CastPosition(mysticFlare, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(175))
				return
			end
		elseif NPC.HasItem(myHero, "item_rod_of_atos", true) then
			if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_rod_of_atos", true)) > ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1500) and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_rod_of_atos", true)) < (((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1500) + 2) then
				if not aghanimsBuffed then
					Ability.CastPosition(mysticFlare, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(95))
					return
				else
					Ability.CastPosition(mysticFlare, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(175))
					return
				end
			end
		elseif NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_HEXED) then
			if not aghanimsBuffed then
				local flarePrediction = Ability.GetCastPoint(mysticFlare) + 0.2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(mysticFlare, fooAllInOne.castPrediction(myHero, enemy, flarePrediction))
			else
				Ability.CastPosition(mysticFlare, fooAllInOne.skywrathComboPredictDoubleUltWhileHexed(myHero, enemy))
				return
			end
		else
			if not aghanimsBuffed then
				local flarePrediction = Ability.GetCastPoint(mysticFlare) + 0.2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(mysticFlare, fooAllInOne.castPrediction(myHero, enemy, flarePrediction))
			else
				Ability.CastPosition(mysticFlare, fooAllInOne.skywrathComboPredictDoubleUltWhileHexed(myHero, enemy))
				return
			end
		end
	end

end

function fooAllInOne.skywrathComboKillableWithoutUlt(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot)

	if not myHero then return end
	if not enemy then return end

	if Ability.SecondsSinceLastUse(ancientSeal) > -1 and Ability.SecondsSinceLastUse(ancientSeal) < Ability.GetCooldownLength(arcaneBolt) + 0.5 then return end
	if Ability.SecondsSinceLastUse(concussiveShot) > -1 and Ability.SecondsSinceLastUse(concussiveShot) < Ability.GetCooldownLength(arcaneBolt) + 0.5 then return end
	if Ability.SecondsSinceLastUse(arcaneBolt) > -1 and Ability.SecondsSinceLastUse(arcaneBolt) < Ability.GetCooldownLength(arcaneBolt) + 0.5 then return end

	local totalDamage = 0
	local veilAmp = 0
	local silenceAmp = 0
	local ebladeAmp = 0
	local reqMana = 0

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if veil and Ability.IsCastable(veil, myMana) then
		veilAmp = 0.25
		reqMana = reqMana + Ability.GetManaCost(veil)
	end	

	if ancientSeal and Ability.IsCastable(ancientSeal, myMana) then
		silenceAmp = (Ability.GetLevel(ancientSeal) * 5 + 30) / 100
		reqMana = reqMana + Ability.GetManaCost(ancientSeal)
	end

	if eBlade and Ability.IsCastable(eBlade, myMana) then
		local ebladedamage = Hero.GetIntellectTotal(myHero) * 2 + 75
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (ebladedamage + ebladedamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		ebladeAmp = 0.4
		reqMana = reqMana + Ability.GetManaCost(eBlade)
	end	

	if dagon and Ability.IsCastable(dagon, Ability.GetManaCost(dagon)) then
		local dagondmg = Ability.GetLevelSpecialValueFor(dagon, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (dagondmg + dagondmg * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(dagon)
	end
                
	if arcaneBolt and Ability.IsCastable(arcaneBolt, myMana) then
		local boltdamage = Ability.GetLevelSpecialValueFor(arcaneBolt, "bolt_damage") + Hero.GetIntellectTotal(myHero) * 1.6
		if Ability.GetLevel(arcaneBolt) < 3 then
			totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (boltdamage + boltdamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
			reqMana = reqMana + Ability.GetManaCost(arcaneBolt)                    
		else
			totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (boltdamage + boltdamage * (Hero.GetIntellectTotal(myHero) / 14 / 100)) * 2
			reqMana = reqMana + Ability.GetManaCost(arcaneBolt) * 2
		end
	end

	if concussiveShot and Ability.IsCastable(concussiveShot, myMana) then
		local slowdamage = Ability.GetLevelSpecialValueFor(concussiveShot, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (slowdamage + slowdamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(concussiveShot)
	end

	if reqMana < NPC.GetMana(myHero) and Entity.GetHealth(enemy) < totalDamage and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		fooAllInOne.skywrathComboSelect = true
	else		
		fooAllInOne.skywrathComboSelect = false
	end

end

function fooAllInOne.skywrathComboTotalDamage(myHero, myMana, enemy, ancientSeal, arcaneBolt, concussiveShot, mysticFlare)

	if not myHero then return end
	if not enemy then return end
	if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end 

	local totalDamage = 0
	local totalDamageUlt = 0
	local veilAmp = 0
	local silenceAmp = 0
	local ebladeAmp = 0
	local reqMana = 0
	local reqManaUlt = 0

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local atos = NPC.GetItem(myHero, "item_rod_of_atos", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if veil and Ability.IsCastable(veil, myMana) then
		veilAmp = 0.25
		reqMana = reqMana + Ability.GetManaCost(veil)
	end	

	if ancientSeal and Ability.IsCastable(ancientSeal, myMana) then
		silenceAmp = (Ability.GetLevel(ancientSeal) * 5 + 30) / 100
		reqMana = reqMana + Ability.GetManaCost(ancientSeal)
	end

	if eBlade and Ability.IsCastable(eBlade, myMana) then
		local ebladedamage = Hero.GetIntellectTotal(myHero) * 2 + 75
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (ebladedamage + ebladedamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		ebladeAmp = 0.4
		reqMana = reqMana + Ability.GetManaCost(eBlade)
	end	

	if dagon and Ability.IsCastable(dagon, Ability.GetManaCost(dagon)) then
		local dagondmg = Ability.GetLevelSpecialValueFor(dagon, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (dagondmg + dagondmg * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(dagon)
	end
                
	if arcaneBolt and Ability.IsCastable(arcaneBolt, myMana) then
		local boltdamage = Ability.GetLevelSpecialValueFor(arcaneBolt, "bolt_damage") + Hero.GetIntellectTotal(myHero) * 1.6
		if Ability.GetLevel(arcaneBolt) < 3 then
			totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (boltdamage + boltdamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
			reqMana = reqMana + Ability.GetManaCost(arcaneBolt)                    
		else
			totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (boltdamage + boltdamage * (Hero.GetIntellectTotal(myHero) / 14 / 100)) * 2
			reqMana = reqMana + Ability.GetManaCost(arcaneBolt) * 2
		end
	end

	if concussiveShot and Ability.IsCastable(concussiveShot, myMana) then
		local slowdamage = Ability.GetLevelSpecialValueFor(concussiveShot, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (slowdamage + slowdamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(concussiveShot)
	end

	if mysticFlare and Ability.IsCastable(mysticFlare, myMana) then
		local mysticDamage
		if atos and Ability.IsCastable(atos, myMana) then
			mysticDamage = Ability.GetLevelSpecialValueFor(mysticFlare, "damage") * 2 / 2.4
		end
		if not atos or (atos and not Ability.IsCastable(atos, myMana)) then
			mysticDamage = Ability.GetLevelSpecialValueFor(mysticFlare, "damage") * 1 / 2.4
		end
		totalDamageUlt = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + silenceAmp) * (1 + veilAmp) * (1 + ebladeAmp) * (mysticDamage + mysticDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqManaUlt = reqMana + Ability.GetManaCost(mysticFlare)
	else
		totalDamageUlt = totalDamage
	end

	if reqManaUlt > NPC.GetMana(myHero) and reqMana < NPC.GetMana(myHero) then
		totalDamageUlt = totalDamage
	end

	if reqMana < NPC.GetMana(myHero) then
		fooAllInOne.skywrathDMGwithoutUlt = totalDamage
		fooAllInOne.skywrathDMGwithUlt = totalDamageUlt
	end

end

function fooAllInOne.skywrathComboDrawDamage(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroSkyDrawDMG) then return end
	
	if fooAllInOne.skywrathDMGwithoutUlt == 0 then return end
	if fooAllInOne.skywrathDMGwithUlt == 0 then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))
		if not enemy then return end
		if not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then return end

	local pos = Entity.GetAbsOrigin(enemy)
	local posY = NPC.GetHealthBarOffset(enemy)
		pos:SetZ(pos:GetZ() + posY)
			
	local x, y, visible = Renderer.WorldToScreen(pos)

	if fooAllInOne.skywrathDMGwithoutUlt > 0 and fooAllInOne.skywrathDMGwithUlt > 0 then
		if visible then
			if Entity.GetHealth(enemy) > fooAllInOne.skywrathDMGwithoutUlt then
				Renderer.SetDrawColor(255,102,102,255)
			else
				Renderer.SetDrawColor(50,205,50,255)
			end
				Renderer.DrawText(fooAllInOne.skywrathFont, x-50, y-90, "DMG w/o Ult: " .. math.floor(fooAllInOne.skywrathDMGwithoutUlt), 0)
			if Entity.GetHealth(enemy) > fooAllInOne.skywrathDMGwithUlt then
				Renderer.SetDrawColor(255,102,102,255)
			else
				Renderer.SetDrawColor(50,205,50,255)
			end
				Renderer.DrawText(fooAllInOne.skywrathFont, x-50, y-75, "DMG w/ Ult: " .. math.floor(fooAllInOne.skywrathDMGwithUlt), 0)
		end
	end		

end

function fooAllInOne.skywrathComboHarass(myHero, myMana, arcaneBolt)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroSkyHarass) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not arcaneBolt then return end
		if not Ability.IsCastable(arcaneBolt, myMana) then return end

	for _, hero in ipairs(NPC.GetHeroesInRadius(myHero, 875, Enum.TeamType.TEAM_ENEMY)) do
		if hero and Entity.IsHero(hero) and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) then 
			if Entity.IsAlive(hero) then
        			Ability.CastTarget(arcaneBolt, hero)
				break
        			return
			end
      		end		
	end	

end

function fooAllInOne.skywrathComboPredictDoubleUltWhileHexed(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local enemyRotation = Entity.GetRotation(enemy)
    	local enemyOrigin = NPC.GetAbsOrigin(enemy)
		enemyOrigin:SetZ(0)

	if enemyRotation and enemyOrigin then
			if not NPC.IsRunning(enemy) then
				return enemyOrigin + enemyRotation:GetForward():Normalized():Scaled(175)
			else return enemyOrigin:__add(enemyRotation:GetForward():Normalized():Scaled(fooAllInOne.GetMoveSpeed(enemy) * (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + 0.15) + 175))
			end
	end
end

function fooAllInOne.magnusCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroMagnus) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local shockwave = NPC.GetAbilityByIndex(myHero, 0)
    	local empower = NPC.GetAbilityByIndex(myHero, 1)
    	local skewer = NPC.GetAbilityByIndex(myHero, 2)
	local reversePolarity = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)

	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.magnusAutoUlt(myHero, myMana, skewer, reversePolarity, shockwave, blink, refresher)
	fooAllInOne.magnusSkewerCombo(myHero, myMana, enemy, skewer, blink)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true and not Menu.IsKeyDown(fooAllInOne.optionHeroMagnuscomboKeyAltSkewer) and not Menu.IsKeyDown(fooAllInOne.optionHeroMagnuscomboKeyAltRP) then
		if not NPC.IsEntityInRange(myHero, enemy, 600) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					return
				end
			end
			if Menu.IsEnabled(fooAllInOne.optionHeroMagnusInitiateSkewer) then
				if not blink or (blink and not Ability.IsReady(blink)) then
					if skewer and Ability.IsCastable(skewer, myMana) then
						if NPC.IsEntityInRange(myHero, enemy, Ability.GetLevelSpecialValueFor(skewer, "range")) then
							Ability.CastPosition(skewer, Entity.GetAbsOrigin(enemy))
							return
						end
					end
				end
			end
		end

		if not NPC.HasModifier(myHero, "modifier_magnataur_empower") then
			fooAllInOne.magnusAutoEmpower(myHero)
			return
		end
		if shockwave and Ability.IsCastable(shockwave, myMana) then
			if NPC.IsEntityInRange(myHero, enemy, 800) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				local shockwavePrediction = Ability.GetCastPoint(shockwave) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1050) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(shockwave, fooAllInOne.castLinearPrediction(myHero, enemy, shockwavePrediction))
				return
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Menu.IsKeyDown(fooAllInOne.optionHeroMagnuscomboKeyAltSkewer) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if blink and not NPC.IsEntityInRange(myHero, enemy, 125) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1120) then
					if Menu.GetValue(fooAllInOne.optionHeroMagnusJump) == 0 then
						fooAllInOne.magnusLastPos = Entity.GetAbsOrigin(myHero)
						local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
							if distance > 1100 then
								distance = 1100
							end
						Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(distance + 55))
						return
					else
						fooAllInOne.magnusLastPos = Entity.GetAbsOrigin(myHero)
						local bestPos = fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 149, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 140)
						local distance = (bestPos - Entity.GetAbsOrigin(myHero)):Length2D()
							if distance > 1100 then
								distance = 1100
							end
						Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (bestPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(distance + 55))
						return
					end
				end
			end
		else
			if skewer and Ability.IsCastable(skewer, myMana) then
				if Menu.GetValue(fooAllInOne.optionHeroMagnusReturn) == 0 then
					if blink and Ability.SecondsSinceLastUse(blink) > -1 and Ability.SecondsSinceLastUse(blink) < 0.25 then
						Ability.CastPosition(skewer, fooAllInOne.magnusLastPos)
						return
					else
						local pos = Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(math.floor(Ability.GetLevelSpecialValueFor(skewer, "range")*0.9))
						Ability.CastPosition(skewer, pos)
						return
					end
				else
					local pos = Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(math.floor(Ability.GetLevelSpecialValueFor(skewer, "range")*0.9))
					Ability.CastPosition(skewer, pos)
					return
				end
			end
		end

		if not NPC.HasModifier(myHero, "modifier_magnataur_empower") then
			fooAllInOne.magnusAutoEmpower(myHero)
			return
		end
		if shockwave and Ability.IsCastable(shockwave, myMana) then
			if NPC.IsEntityInRange(myHero, enemy, 800) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				local shockwavePrediction = Ability.GetCastPoint(shockwave) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1050) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
				Ability.CastPosition(shockwave, fooAllInOne.castLinearPrediction(myHero, enemy, shockwavePrediction))
				return
			end
		end

	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
					
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Menu.IsKeyDown(fooAllInOne.optionHeroMagnuscomboKeyAltRP) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		local gapCloser = blink
			if gapCloser and not Ability.IsReady(gapCloser) then
				if Ability.SecondsSinceLastUse(gapCloser) > 1.5 then
					if Menu.IsEnabled(fooAllInOne.optionHeroMagnusInitiateSkewer) then
						gapCloser = skewer
					end
				end
			end
			if not gapCloser then
				if Menu.IsEnabled(fooAllInOne.optionHeroMagnusInitiateSkewer) then
					gapCloser = skewer
				end
			end
		local gapCloserRange = 1150
			if gapCloser then
				if Ability.GetName(gapCloser) == "magnataur_skewer" then
					gapCloserRange = Ability.GetLevelSpecialValueFor(gapCloser, "range") - 25
				end
			end

		if not NPC.IsEntityInRange(myHero, enemy, 400) then
			if gapCloser and Ability.IsCastable(gapCloser, myMana) then
				local bestPos = fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 600, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 410)
				if NPC.IsPositionInRange(myHero, bestPos, gapCloserRange, 0) then
					if Ability.IsCastable(reversePolarity, myMana) and not Ability.IsInAbilityPhase(reversePolarity) then
						if not NPC.HasModifier(myHero, "modifier_magnataur_empower") then
							fooAllInOne.magnusAutoEmpower(myHero)
							return
						end
						if Ability.IsReady(gapCloser) and Ability.IsCastable(gapCloser, myMana) then
							fooAllInOne.magnusLastPos = Entity.GetAbsOrigin(myHero)
							Ability.CastPosition(gapCloser, bestPos)
							return
						end
					end
				end
			end
		else
			if reversePolarity and Ability.IsCastable(reversePolarity, myMana) then
				if Menu.GetValue(fooAllInOne.optionHeroMagnusReturn) == 0 then
					if not fooAllInOne.AmIFacingPos(myHero, fooAllInOne.magnusLastPos, 15) and gapCloser and Ability.GetName(gapCloser) == "item_blink" then
						NPC.MoveTo(myHero, Entity.GetAbsOrigin(myHero) + (fooAllInOne.magnusLastPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(5), false, false)
						return
					else
						Ability.CastNoTarget(reversePolarity)
						return
					end
				end
				if Menu.GetValue(fooAllInOne.optionHeroMagnusReturn) == 1 then
					if not fooAllInOne.AmIFacingPos(myHero, Input.GetWorldCursorPos(), 15) and gapCloser and Ability.GetName(gapCloser) == "item_blink" then
						NPC.MoveTo(myHero, Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(5), false, false)
						return
					else
						Ability.CastNoTarget(reversePolarity)
						return
					end
				end
			end
			if reversePolarity and not Ability.IsReady(reversePolarity) then
				if gapCloser and Ability.GetName(gapCloser) == "item_blink" then
					if Ability.SecondsSinceLastUse(reversePolarity) > -1 and Ability.SecondsSinceLastUse(reversePolarity) < 1.5 then
						if skewer and Ability.IsCastable(skewer, myMana) and not Ability.IsReady(reversePolarity) and (not refresher or (refresher and Ability.IsReady(refresher))) then
							if Menu.GetValue(fooAllInOne.optionHeroMagnusReturn) == 0 then
								Ability.CastPosition(skewer, fooAllInOne.magnusLastPos)
								return
							else
								local pos = Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(math.floor(Ability.GetLevelSpecialValueFor(skewer, "range")*0.9))
								Ability.CastPosition(skewer, pos)
								return
							end
						end
					end
				end
				if shockwave and Ability.IsCastable(shockwave, myMana) then
					Ability.CastPosition(shockwave, Entity.GetAbsOrigin(enemy))
					return
				end
				if Menu.IsEnabled(fooAllInOne.optionHeroMagnusComboRefresher) then
					if refresher and Ability.IsCastable(refresher, myMana) and myMana > (Ability.GetManaCost(reversePolarity) + Ability.GetManaCost(refresher)) then
						local stunTime = Ability.GetLevelSpecialValueForFloat(reversePolarity, "hero_stun_duration")
						if Ability.SecondsSinceLastUse(reversePolarity) > (stunTime - 0.5) and Ability.SecondsSinceLastUse(reversePolarity) < stunTime then
							Ability.CastNoTarget(refresher)
							Ability.CastNoTarget(reversePolarity)
							return
						end
					end
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	

	


end

function fooAllInOne.magnusSkewerCombo(myHero, myMana, enemy, skewer, blink)

	if not myHero then return end
	if not enemy then return end

	if not Menu.IsEnabled(fooAllInOne.optionHeroMagnusSkewerCombo) then return end

	if not blink then return end

	if not skewer then return end
		if not Ability.IsCastable(skewer, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end

	if Menu.IsKeyDown(fooAllInOne.optionHeroMagnusSkewerComboKey) and Entity.GetHealth(enemy) > 0 then
		if NPC.IsEntityInRange(myHero, enemy, 1100) then
			if blink and Ability.IsReady(blink) then
				fooAllInOne.magnusLastPos = Entity.GetAbsOrigin(myHero)
				local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D()
					if distance > 1100 then
						distance = 1100
					end
				Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(distance + 95))
				return
			end
			if Ability.SecondsSinceLastUse(blink) > -1 and Ability.SecondsSinceLastUse(blink) < 0.25 then
				Ability.CastPosition(skewer, fooAllInOne.magnusLastPos)
				return
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

end
			
function fooAllInOne.magnusAutoEmpower(myHero)

	if not myHero then return end
	local myMana = NPC.GetMana(myHero)

	local empower = NPC.GetAbilityByIndex(myHero, 1)
		if not empower then return end
		if not Ability.IsCastable(empower, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if NPC.HasModifier(myHero, "modifier_magnataur_empower") then return end

	Ability.CastTarget(empower, myHero)
	return
	
end

function fooAllInOne.magnusAutoUlt(myHero, myMana, skewer, reversePolarity, shockwave, blink, refresher)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroMagnusAutoUlt) then return end

	if not reversePolarity then return end

	local shivas = NPC.GetItem(myHero, "item_shivas_guard", true)

	local gapCloser = blink
		if gapCloser and not Ability.IsReady(gapCloser) then
			if Ability.SecondsSinceLastUse(gapCloser) > 1.5 then
				if Menu.IsEnabled(fooAllInOne.optionHeroMagnusAutoUltSkewer) then
					gapCloser = skewer
				end
			end
		end
		if not gapCloser then
			if Menu.IsEnabled(fooAllInOne.optionHeroMagnusAutoUltSkewer) then
				gapCloser = skewer
			end
		end
		
	if not gapCloser then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end

	local reverseRadius = 410

	local gapCloserRange = 1150
		if Ability.GetName(gapCloser) == "magnataur_skewer" then
			gapCloserRange = Ability.GetLevelSpecialValueFor(gapCloser, "range") - 25
		end

	local tempTableHittableTargets = {}
	for _, targets in ipairs(Entity.GetHeroesInRadius(myHero, gapCloserRange + reverseRadius, Enum.TeamType.TEAM_ENEMY)) do
		if targets then
			local target = fooAllInOne.targetChecker(targets)
			if target then
				if #Entity.GetHeroesInRadius(target, reverseRadius, Enum.TeamType.TEAM_FRIEND) > -1 then
					table.insert(tempTableHittableTargets, target)
				end
			end
		end
	end

	if #tempTableHittableTargets >= 1 then
		local bestPos = fooAllInOne.getBestPosition(tempTableHittableTargets, reverseRadius)
		if #Heroes.InRadius(bestPos, reverseRadius, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) >= Menu.GetValue(fooAllInOne.optionHeroMagnusAutoUltCount) then
			if NPC.IsPositionInRange(myHero, bestPos, gapCloserRange, 0) then
				if Ability.IsCastable(reversePolarity, myMana) and not Ability.IsInAbilityPhase(reversePolarity) then
					if not NPC.HasModifier(myHero, "modifier_magnataur_empower") then
						fooAllInOne.magnusAutoEmpower(myHero)
						return
					end
					if Ability.IsReady(gapCloser) and Ability.IsCastable(gapCloser, myMana) then
						fooAllInOne.magnusLastPos = Entity.GetAbsOrigin(myHero)
						Ability.CastPosition(gapCloser, bestPos)
						return
					end
					if not fooAllInOne.AmIFacingPos(myHero, fooAllInOne.magnusLastPos, 15) and Ability.GetName(gapCloser) == "item_blink" then
						NPC.MoveTo(myHero, Entity.GetAbsOrigin(myHero) + (fooAllInOne.magnusLastPos - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(5), false, false)
						return
					else
						Ability.CastNoTarget(reversePolarity)
						return
					end
				else
					if Ability.GetName(gapCloser) == "item_blink" then
						if Ability.SecondsSinceLastUse(reversePolarity) > -1 and Ability.SecondsSinceLastUse(reversePolarity) < 1.5 then
							if shivas and Ability.IsCastable(shivas, myMana) then
								Ability.CastNoTarget(shivas)
								return
							end
							if skewer and Ability.IsCastable(skewer, myMana) and not Ability.IsReady(reversePolarity) and (not refresher or (refresher and Ability.IsReady(refresher))) then
								Ability.CastPosition(skewer, fooAllInOne.magnusLastPos)
								return
							end
							if shockwave and Ability.IsCastable(shockwave, myMana) then
								Ability.CastPosition(shockwave, Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(50), true)
								return
							end
							fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, Entity.GetAbsOrigin(myHero))
							return
						end
					else
						if Ability.SecondsSinceLastUse(reversePolarity) > -1 and Ability.SecondsSinceLastUse(reversePolarity) < 1.5 then
							if shivas and Ability.IsCastable(shivas, myMana) then
								Ability.CastNoTarget(shivas)
								return
							end
							if shockwave and Ability.IsCastable(shockwave, myMana) and not Ability.IsReady(skewer) then
								Ability.CastPosition(shockwave, Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(50), true)
								return
							end
							fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, Entity.GetAbsOrigin(myHero))
							return
						end
					end
					if Menu.IsEnabled(fooAllInOne.optionHeroMagnusAutoUltRefresher) then
						if refresher and Ability.IsCastable(refresher, myMana) and myMana > (Ability.GetManaCost(reversePolarity) + Ability.GetManaCost(refresher)) then
							local stunTime = Ability.GetLevelSpecialValueForFloat(reversePolarity, "hero_stun_duration")
							if Ability.SecondsSinceLastUse(reversePolarity) > (stunTime - 0.5) and Ability.SecondsSinceLastUse(reversePolarity) < stunTime then
								Ability.CastNoTarget(refresher)
								Ability.CastNoTarget(reversePolarity)
								return
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.AmIFacingPos(myHero, pos, allowedDeviation)

	if not myHero then return false end

	local myPos = Entity.GetAbsOrigin(myHero)
	local myRotation = Entity.GetRotation(myHero):GetForward():Normalized()

	local baseVec = (pos - myPos):Normalized()

	local tempProcessing = baseVec:Dot2D(myRotation) / (baseVec:Length2D() * myRotation:Length2D())
		if tempProcessing > 1 then
			tempProcessing = 1
		end	

	local checkAngleRad = math.acos(tempProcessing)
	local checkAngle = (180 / math.pi) * checkAngleRad

	if checkAngle < allowedDeviation then
		return true
	end

	return false

end

function fooAllInOne.DazzleHelper(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroDazzle) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local poisonTouch = NPC.GetAbilityByIndex(myHero, 0)
    	local grave = NPC.GetAbilityByIndex(myHero, 1)
    	local shadowWave = NPC.GetAbilityByIndex(myHero, 2)
	local weave = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)
	local blink = NPC.GetItem(myHero, "item_blink", true)

	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.DazzleHelperAutoGrave(myHero, myMana, grave)
	fooAllInOne.DazzleHelperAutoWeave(myHero, myMana, weave)
	fooAllInOne.DazzleHelperAutoHeal(myHero, myMana, shadowWave)
	fooAllInOne.DazzleHelperHealKillsteal(myHero, myMana, shadowWave)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then

		if not NPC.IsEntityInRange(myHero, enemy, 999) then
			if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1550) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(400)))
				return
			end
		end

		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
			if poisonTouch and Ability.IsCastable(poisonTouch, myMana) then
				Ability.CastTarget(poisonTouch, enemy)
				return
			end
		end

	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

end

function fooAllInOne.DazzleHelperHealKillsteal(myHero, myMana, shadowWave)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroDazzleHealKS) then return end

	if not shadowWave then return end
		if not Ability.IsCastable(shadowWave, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local bounces = 2 + Ability.GetLevel(shadowWave)
	local bounceDamage = Ability.GetLevelSpecialValueFor(shadowWave, "damage")
		if NPC.HasAbility(myHero, "special_bonus_unique_dazzle_2") then
			if Ability.GetLevel(NPC.GetAbility(myHero, "special_bonus_unique_dazzle_2")) > 0 then
				bounceDamage = bounceDamage + 60
			end
		end

	local waveRange = Ability.GetCastRange(shadowWave) + NPC.GetCastRangeBonus(myHero) - 10

	for _, targets in ipairs(Entity.GetHeroesInRadius(myHero, waveRange, Enum.TeamType.TEAM_ENEMY)) do
		if targets then
			local target = fooAllInOne.targetChecker(targets)
			if target then
				if not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					local targetHP = Entity.GetHealth(target) + NPC.GetHealthRegen(target)
					local unitsAround = #Entity.GetUnitsInRadius(target, 175, Enum.TeamType.TEAM_ENEMY)
						if unitsAround > bounces then
							unitsAround = bounces
						end
					local waveDamage = unitsAround * bounceDamage
					local waveTrueDamage = (1 - NPC.GetMagicalArmorValue(target)) * (waveDamage + waveDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
					if targetHP < waveTrueDamage then
						for _, v in ipairs(Entity.GetUnitsInRadius(target, 175, Enum.TeamType.TEAM_ENEMY)) do
							if v then
								if NPC.IsEntityInRange(myHero, v, waveRange) then
									Ability.CastTarget(shadowWave, v)
									break
									return
								end
							end
						end
					end
				end
			end
		end
	end
					
end

function fooAllInOne.DazzleHelperAutoHeal(myHero, myMana, shadowWave)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroDazzleAutoHeal) then return end

	if not shadowWave then return end
		if not Ability.IsCastable(shadowWave, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local myHPperc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	local waveRange = Ability.GetCastRange(shadowWave) + NPC.GetCastRangeBonus(myHero) - 10

	if fooAllInOne.TargetIsInvulnarable(myHero, myHero) <= 0 then
		if myHPperc <= Menu.GetValue(fooAllInOne.optionHeroDazzleAutoHealHP) then
			Ability.CastTarget(shadowWave, myHero)
			return
		end
	end

	for _, ally in ipairs(Entity.GetHeroesInRadius(myHero, waveRange, Enum.TeamType.TEAM_FRIEND)) do
		if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) and fooAllInOne.TargetIsInvulnarable(myHero, ally) <= 0 and fooAllInOne.TargetIsInvulnarable(myHero, myHero) <= 0 then
			local allyHPperc = (Entity.GetHealth(ally) / Entity.GetMaxHealth(ally)) * 100
			if allyHPperc <= Menu.GetValue(fooAllInOne.optionHeroDazzleAutoHealHP) then
				Ability.CastTarget(shadowWave, ally)
				break
				return
			end
		end
	end

end

function fooAllInOne.DazzleHelperAutoWeave(myHero, myMana, weave)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroDazzleAutoWeave) then return end

	if not weave then return end
		if not Ability.IsCastable(weave, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local weaveRange = Ability.GetCastRange(weave) + NPC.GetCastRangeBonus(myHero) - 10
	local weaveRadius = 550

	local tempTableHittableTargets = {}
	for _, targets in ipairs(Entity.GetHeroesInRadius(myHero, 2000, Enum.TeamType.TEAM_ENEMY)) do
		if targets then
			local target = fooAllInOne.targetChecker(targets)
			if target then
				if not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					if NPC.IsEntityInRange(myHero, target, weaveRange + weaveRadius) then
						if #Entity.GetHeroesInRadius(target, weaveRadius, Enum.TeamType.TEAM_FRIEND) > -1 then
							table.insert(tempTableHittableTargets, target)
						end
					end
				end
			end
		end
	end

	if #tempTableHittableTargets >= 1 then
		local bestPos = fooAllInOne.getBestPosition(tempTableHittableTargets, weaveRadius)
		if #Heroes.InRadius(bestPos, weaveRadius, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) >= Menu.GetValue(fooAllInOne.optionHeroDazzleAutoWeaveCount) then
			if NPC.IsPositionInRange(myHero, bestPos, weaveRange, 0) then
				Ability.CastPosition(weave, bestPos)
				return
			end
		end
	end

end

function fooAllInOne.DazzleHelperAutoGrave(myHero, myMana, grave)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroDazzleAutoGrave) then return end

	if not grave then return end
		if not Ability.IsCastable(grave, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end

	local myHPperc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	local graveRange = Ability.GetCastRange(grave) + NPC.GetCastRangeBonus(myHero) - 10

	if fooAllInOne.TargetIsInvulnarable(myHero, myHero) <= 0 then
		if myHPperc <= Menu.GetValue(fooAllInOne.optionHeroDazzleHP) then
			if fooAllInOne.IsAttackedByDangerousSpell(myHero, myHero, 1000) == true then
				Ability.CastTarget(grave, myHero)
				return
			else
				for _, v in ipairs(Entity.GetHeroesInRadius(myHero, 800, Enum.TeamType.TEAM_ENEMY)) do
					if v and Entity.IsHero(v) and not Entity.IsDormant(v) and not NPC.IsIllusion(v) then
						if NPC.IsAttacking(v) then
							if NPC.IsEntityInRange(myHero, v, NPC.GetAttackRange(v) + 140) then
								if NPC.FindFacingNPC(v) == myHero then
									Ability.CastTarget(grave, myHero)
									break
									return
								end
							end
						else
							if myHPperc <= 7 then
								if NPC.IsEntityInRange(myHero, v, NPC.GetAttackRange(v) + 140) then
									if NPC.FindFacingNPC(v) == myHero then
										Ability.CastTarget(grave, myHero)
										break
										return
									end
								end
							end
						end	
					end	
				end
			end	
		end
	end

	for _, ally in ipairs(Entity.GetHeroesInRadius(myHero, graveRange, Enum.TeamType.TEAM_FRIEND)) do
		if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) and fooAllInOne.TargetIsInvulnarable(myHero, ally) <= 0 and fooAllInOne.TargetIsInvulnarable(myHero, myHero) <= 0 then
			local allyHPperc = (Entity.GetHealth(ally) / Entity.GetMaxHealth(ally)) * 100
			if allyHPperc <= Menu.GetValue(fooAllInOne.optionHeroDazzleHP) then
				if fooAllInOne.IsAttackedByDangerousSpell(myHero, ally, 800) == true then
					Ability.CastTarget(grave, ally)
					break
					return
				else
					for _, v in ipairs(Entity.GetHeroesInRadius(ally, 800, Enum.TeamType.TEAM_ENEMY)) do
						if v and Entity.IsHero(v) and not Entity.IsDormant(v) and not NPC.IsIllusion(v) then
							if NPC.IsAttacking(v) then
								if NPC.IsEntityInRange(ally, v, NPC.GetAttackRange(v) + 140) then
									if NPC.FindFacingNPC(v) == ally then
										Ability.CastTarget(grave, ally)
										break
										return
									end
								end
							else
								if allyHPperc <= 7 then
									if NPC.IsEntityInRange(ally, v, NPC.GetAttackRange(v) + 140) then
										if NPC.FindFacingNPC(v) == ally then
											Ability.CastTarget(grave, ally)
											break
											return
										end
									end
								end
							end	
						end
					end
				end
			end	
		end
	end

end

function fooAllInOne.IsAttackedByDangerousSpell(myHero, target, searchRange)

	if not myHero then return false end
	if not target then return false end
	if fooAllInOne.TargetIsInvulnarable(myHero, target) > 0 then return false end

	for _, enemy in ipairs(Entity.GetHeroesInRadius(target, searchRange, Enum.TeamType.TEAM_ENEMY)) do
		if enemy and Entity.IsHero(enemy) and not Entity.IsDormant(enemy) and not NPC.IsIllusion(enemy) then
			if NPC.FindFacingNPC(enemy) == target then
				for _, info in ipairs(fooAllInOne.AbilityList) do
					if info[1] == NPC.GetUnitName(enemy) then
						if info[3] == "nuke" or info[3] == "disable" then
							if NPC.HasAbility(enemy, info[2]) then
								if Ability.IsInAbilityPhase(NPC.GetAbility(enemy, info[2])) then
									local castRange = Ability.GetCastRange(NPC.GetAbility(enemy, info[2])) + NPC.GetCastRangeBonus(enemy) + 25
									if NPC.IsEntityInRange(enemy, target, castRange) then
										return true
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return false

end

function fooAllInOne.SFCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSF) then return end

	local razeShort = NPC.GetAbilityByIndex(myHero, 0)
    	local razeMid = NPC.GetAbilityByIndex(myHero, 1)
    	local razeLong = NPC.GetAbilityByIndex(myHero, 2)
	local requiem = NPC.GetAbility(myHero, "nevermore_requiem")
	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	local eul = NPC.GetItem(myHero, "item_cyclone", true)
	local hurricanePike = NPC.GetItem(myHero, "item_hurricane_pike", true)

	local myAttackRange = NPC.GetAttackRange(myHero)
		if NPC.HasItem(myHero, "item_dragon_lance") or NPC.HasItem(myHero, "item_hurricane_pike") then
			myAttackRange = myAttackRange + 140
		end
		if NPC.HasModifier(myHero, "modifier_item_hurricane_pike_range") then
			myAttackRange = 99999
		end

	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.SFAutoHurricane(myHero, myMana, enemy, hurricanePike)
	fooAllInOne.SFComboDrawRazeCircles(myHero)

	if enemy then
		if eul and requiem and Ability.IsCastable(requiem, myMana) then
			if Menu.IsKeyDown(fooAllInOne.optionHeroSFEulCombo) and Entity.GetHealth(enemy) > 0 then
				if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
					if not NPC.IsEntityInRange(myHero, enemy, 550) then
						if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1350) then
							Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(200)))
							return
						else
							fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy))
							return
						end
					else
						if Ability.IsCastable(eul, myMana) then
							Ability.CastTarget(eul, enemy)
							return
						end
						if NPC.HasModifier(enemy, "modifier_eul_cyclone") then
							if not NPC.IsEntityInRange(myHero, enemy, 20) then
								fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy))
								return
							else
								local cycloneDieTime = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_eul_cyclone"))
								if cycloneDieTime - GameRules.GetGameTime() <= 1.62 then
									Ability.CastNoTarget(requiem)
									return
								end
							end
						end
					end	
				end
			end
		end
	end

	if enemy then
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
			if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
				if not NPC.IsEntityInRange(myHero, enemy, 999) then
					if Menu.IsEnabled(fooAllInOne.optionHeroSFBlink) and blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1150 + Menu.GetValue(fooAllInOne.optionHeroSFBlinkRange)) then
						Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(Menu.GetValue(fooAllInOne.optionHeroSFBlinkRange))))
						return
					end
				end

				if Menu.IsEnabled(fooAllInOne.optionHeroSFComboRaze) then
					if razeShort and Ability.IsCastable(razeShort, myMana) then
						local razePos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(200)
						local razePrediction = 0.55 + 0.1 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)			
						local predictedPos = fooAllInOne.castPrediction(myHero, stealEnemy, razePrediction)
						local disRazePOSpredictedPOS = (razePos - predictedPos):Length2D()
						if disRazePOSpredictedPOS <= 200 and not Entity.IsTurning(myHero) then
							if os.clock() - fooAllInOne.lastTick >= 0.55 then
								Ability.CastNoTarget(razeShort)
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
					if razeMid and Ability.IsCastable(razeMid, myMana) then
						local razePos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(450)
						local razePrediction = 0.55 + 0.1 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)			
						local predictedPos = fooAllInOne.castPrediction(myHero, stealEnemy, razePrediction)
						local disRazePOSpredictedPOS = (razePos - predictedPos):Length2D()
						if disRazePOSpredictedPOS <= 200 and not Entity.IsTurning(myHero) then
							if os.clock() - fooAllInOne.lastTick >= 0.55 then
								Ability.CastNoTarget(razeMid)
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
					if razeLong and Ability.IsCastable(razeLong, myMana) then
						local razePos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(700)
						local razePrediction = 0.55 + 0.1 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)			
						local predictedPos = fooAllInOne.castPrediction(myHero, stealEnemy, razePrediction)
						local disRazePOSpredictedPOS = (razePos - predictedPos):Length2D()
						if disRazePOSpredictedPOS <= 200 and not Entity.IsTurning(myHero) then
							if os.clock() - fooAllInOne.lastTick >= 0.55 then
								Ability.CastNoTarget(razeLong)
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
				end
			end
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
			return
		end
	end

end

function fooAllInOne.SFComboDrawRazeCircles(myHero)

	if not myHero then return end

	local curtime = GameRules.GetGameTime()	

	if Menu.IsEnabled(fooAllInOne.optionHeroSFDrawRazeCircle) then
		local circle1 = Particle.Create("particles/econ/generic/generic_progress_meter/generic_progress_circle_b.vpcf")
		local circle2 = Particle.Create("particles/econ/generic/generic_progress_meter/generic_progress_circle_b.vpcf")
		local circle3 = Particle.Create("particles/econ/generic/generic_progress_meter/generic_progress_circle_b.vpcf")
		if fooAllInOne.SFcurrentParticle1 == 0 then
			fooAllInOne.SFcurrentParticle1 = circle1
			Particle.SetControlPoint(circle1, 1, Vector(250, 1, 1))
			Particle.SetControlPoint(circle1, 15, Vector(0, 255, 0))
			Particle.SetControlPoint(circle1, 16, Vector(1, 0, 0))
		end
		if fooAllInOne.SFcurrentParticle2 == 0 then
			fooAllInOne.SFcurrentParticle2 = circle2
			Particle.SetControlPoint(circle2, 1, Vector(250, 1, 1))
			Particle.SetControlPoint(circle2, 15, Vector(255, 255, 0))
			Particle.SetControlPoint(circle2, 16, Vector(1, 0, 0))
		end
		if fooAllInOne.SFcurrentParticle3 == 0 then
			fooAllInOne.SFcurrentParticle3 = circle3
			Particle.SetControlPoint(circle3, 1, Vector(250, 1, 1))
			Particle.SetControlPoint(circle3, 15, Vector(255, 100, 0))
			Particle.SetControlPoint(circle3, 16, Vector(1, 0, 0))
		end

			Particle.SetControlPoint(fooAllInOne.SFcurrentParticle1, 0, (Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(200)))
	
			Particle.SetControlPoint(fooAllInOne.SFcurrentParticle2, 0, (Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(450)))
		
			Particle.SetControlPoint(fooAllInOne.SFcurrentParticle3, 0, (Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(700)))
			
	else
		if fooAllInOne.SFcurrentParticle1 > 0 then
			Particle.Destroy(fooAllInOne.SFcurrentParticle1)
			Particle.Destroy(fooAllInOne.SFcurrentParticle2)
			Particle.Destroy(fooAllInOne.SFcurrentParticle3)
			fooAllInOne.SFcurrentParticle1 = 0
			fooAllInOne.SFcurrentParticle2 = 0
			fooAllInOne.SFcurrentParticle3 = 0
		end
	end

end

function fooAllInOne.SFComboDrawRequiemDamage(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroSFDrawReqDMG) then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))
		if not enemy then return end
		if not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then return end

	local pos = Entity.GetAbsOrigin(enemy)
	local posY = NPC.GetHealthBarOffset(enemy)
		pos:SetZ(pos:GetZ() + posY)
			
	local x, y, visible = Renderer.WorldToScreen(pos)

	local requiem = NPC.GetAbility(myHero, "nevermore_requiem")
	local myMana = NPC.GetMana(myHero)

	local stackCounter = 0
		if NPC.HasModifier(myHero, "modifier_nevermore_necromastery") then
			stackCounter = Modifier.GetStackCount(NPC.GetModifier(myHero, "modifier_nevermore_necromastery"))
		end

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)

	local requiemDamage = Ability.GetDamage(requiem) * (math.floor(stackCounter/2))
		if aghanims or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
			requiemDamage = requiemDamage + Ability.GetLevelSpecialValueForFloat(requiem, "requiem_damage_pct_scepter") * (math.floor(stackCounter/2))
		end
	local requiemTrueDamage = (1 - NPC.GetMagicalArmorValue(enemy)) * (requiemDamage + requiemDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))

	local remainingHP = math.floor(Entity.GetHealth(enemy) - requiemTrueDamage)
		if remainingHP < 0 then
			remainingHP = 0
		end

	if requiem and Ability.IsCastable(requiem, myMana) then
		if visible then
			if Entity.GetHealth(enemy) > requiemTrueDamage then
				Renderer.SetDrawColor(255,102,102,255)
			else
				Renderer.SetDrawColor(50,205,50,255)
			end
			Renderer.DrawText(fooAllInOne.skywrathFont, x-60, y-70, "Full requiem hit:   " .. math.floor(requiemTrueDamage) .. "  (" .. remainingHP .. ")", 0)
		end
	end	

end

function fooAllInOne.SFAutoHurricane(myHero, myMana, enemy, hurricanePike)

	if not myHero then return end
	if not enemy then return end

	if not Menu.IsEnabled(fooAllInOne.optionHeroSFHurricane) then return end

	if not hurricanePike then return end
		if not Ability.IsCastable(hurricanePike, myMana) then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local myHPperc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if myHPperc <= Menu.GetValue(fooAllInOne.optionHeroSFHurricaneHP) then
		for _, v in ipairs(Entity.GetHeroesInRadius(myHero, 800, Enum.TeamType.TEAM_ENEMY)) do
			if v and Entity.IsHero(v) and not Entity.IsDormant(v) and not NPC.IsIllusion(v) then
				if NPC.FindFacingNPC(v) == myHero then
					if NPC.IsEntityInRange(myHero, v, NPC.GetAttackRange(v) + 140) then
						if NPC.IsAttacking(v) then
							Ability.CastTarget(hurricanePike, enemy)
							break
							return
						end
					end
				end
			end	
		end
	end

end

function fooAllInOne.ODCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroOD) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local arcaneOrb = NPC.GetAbilityByIndex(myHero, 0)
    	local astralPrison = NPC.GetAbilityByIndex(myHero, 1)
    	local sanityEclipse = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	local hurricanePike = NPC.GetItem(myHero, "item_hurricane_pike", true)

	local myAttackRange = NPC.GetAttackRange(myHero)
		if NPC.HasItem(myHero, "item_dragon_lance") or NPC.HasItem(myHero, "item_hurricane_pike") then
			myAttackRange = myAttackRange + 140
		end
		if NPC.HasModifier(myHero, "modifier_item_hurricane_pike_range") then
			myAttackRange = 99999
		end

	if arcaneOrb and Ability.GetLevel(arcaneOrb) > 0 then
		if NPC.HasModifier(myHero, "modifier_item_hurricane_pike_range") then
			if Ability.GetAutoCastState(arcaneOrb) == false and os.clock() - fooAllInOne.lastTick > 0.5 then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TOGGLE_AUTO, nil, Vector(), arcaneOrb, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end			

	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.ODKillsteal(myHero, myMana, myAttackRange, arcaneOrb, astralPrison, sanityEclipse)
	fooAllInOne.ODAutoHurricane(myHero, myMana, enemy, hurricanePike)
	fooAllInOne.ODAutoPrisonAutoDisable(myHero, myMana, astralPrison)
	fooAllInOne.ODAutoPrisonSave(myHero, myMana, astralPrison)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
			if not NPC.IsEntityInRange(myHero, enemy, 999) then
				if Menu.IsEnabled(fooAllInOne.optionHeroODBlink) and blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1150 + Menu.GetValue(fooAllInOne.optionHeroODBlinkRange)) then
					Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(Menu.GetValue(fooAllInOne.optionHeroODBlinkRange))))
					return
				end
			end
		end
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
		return
	end

end

function fooAllInOne.ODAutoPrisonSave(myHero, myMana, astralPrison)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroODAutoPrisonSave) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not astralPrison then return end
		if not Ability.IsCastable(astralPrison, myMana) then return end

	local prisonCastRange = Ability.GetCastRange(astralPrison) - 25

	local myHPperc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if Menu.IsEnabled(fooAllInOne.optionHeroODAutoPrisonSaveSelf) then
		if myHPperc <= Menu.GetValue(fooAllInOne.optionHeroODAutoPrisonHP) then
			for _, v in ipairs(Entity.GetHeroesInRadius(myHero, 800, Enum.TeamType.TEAM_ENEMY)) do
				if v and Entity.IsHero(v) and not Entity.IsDormant(v) and not NPC.IsIllusion(v) then
					if NPC.FindFacingNPC(v) == myHero then
						if NPC.IsEntityInRange(myHero, v, NPC.GetAttackRange(v) + 140) then
							if NPC.IsAttacking(v) then
								Ability.CastTarget(astralPrison, myHero)
								break
								return
							end
						end
					end
				end	
			end
		end
	end
	
	if Menu.IsEnabled(fooAllInOne.optionHeroODAutoPrisonSaveAlly) then
		local teamMatesAround = NPC.GetHeroesInRadius(myHero, prisonCastRange, Enum.TeamType.TEAM_FRIEND)
		if next(teamMatesAround) ~= nil then
			for _, ally in ipairs(teamMatesAround) do
				if ally and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
					if not fooAllInOne.isHeroChannelling(ally) and not fooAllInOne.IsHeroInvisible(ally) then
						if fooAllInOne.IsNPCinDanger(myHero, ally) or (((Entity.GetHealth(ally) / Entity.GetMaxHealth(ally)) * 100) < Menu.GetValue(fooAllInOne.optionHeroODAutoPrisonHP)) then
							Ability.CastTarget(astralPrison, ally)
							break
							return
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.ODAutoPrisonAutoDisable(myHero, myMana, astralPrison)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroODAutoPrisonDefend) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not astralPrison then return end
		if not Ability.IsCastable(astralPrison, myMana) then return end

	local prisonCastRange = Ability.GetCastRange(astralPrison) - 25

	for _, heroes in ipairs(NPC.GetHeroesInRadius(myHero, prisonCastRange, Enum.TeamType.TEAM_ENEMY)) do
		if heroes and not NPC.IsDormant(heroes) and Entity.IsAlive(heroes) then
			local enemyDagger = NPC.GetItem(heroes, "item_blink", true)
			if enemyDagger and Ability.GetCooldownTimeLeft(enemyDagger) >= 9 and Ability.SecondsSinceLastUse(enemyDagger) > -1 and Ability.SecondsSinceLastUse(enemyDagger) <= 1 then
				if not NPC.HasState(heroes, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(heroes) then
					Ability.CastTarget(astralPrison, heroes)
					break
					return
				end
			end
		end
	end

end

function fooAllInOne.ODAutoHurricane(myHero, myMana, enemy, hurricanePike)

	if not myHero then return end
	if not enemy then return end

	if not Menu.IsEnabled(fooAllInOne.optionHeroODHurricane) then return end

	if not hurricanePike then return end
		if not Ability.IsCastable(hurricanePike, myMana) then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local myHPperc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if myHPperc <= Menu.GetValue(fooAllInOne.optionHeroODHurricaneHP) then
		for _, v in ipairs(Entity.GetHeroesInRadius(myHero, 800, Enum.TeamType.TEAM_ENEMY)) do
			if v and Entity.IsHero(v) and not Entity.IsDormant(v) and not NPC.IsIllusion(v) then
				if NPC.FindFacingNPC(v) == myHero then
					if NPC.IsEntityInRange(myHero, v, NPC.GetAttackRange(v) + 140) then
						if NPC.IsAttacking(v) then
							Ability.CastTarget(hurricanePike, enemy)
							break
							return
						end
					end
				end
			end	
		end
	end

end

function fooAllInOne.ODKillsteal(myHero, myMana, myAttackRange, arcaneOrb, astralPrison, sanityEclipse)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroODKillsteal) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not (arcaneOrb and astralPrison and sanityEclipse) then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroODKillstealEclipse) then
		if sanityEclipse and Ability.IsCastable(sanityEclipse, myMana) then
			local tempTableHittableTargets = {}
			local tempTableKillableTargets = {}
			local sanityEclipseRadius = Ability.GetLevelSpecialValueFor(sanityEclipse, "radius")
			for _, targets in ipairs(Entity.GetHeroesInRadius(myHero, 1200, Enum.TeamType.TEAM_ENEMY)) do
				if targets then
					local target = fooAllInOne.targetChecker(targets)
					if target then
						if not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							if NPC.IsEntityInRange(myHero, target, 690 + sanityEclipseRadius - 25) then
								if #Entity.GetHeroesInRadius(target, sanityEclipseRadius - 25, Enum.TeamType.TEAM_FRIEND) > -1 then
									table.insert(tempTableHittableTargets, target)
								end
							end
						end
					end
				end
			end

			if #tempTableHittableTargets >= 1 then
				local bestPos = fooAllInOne.getBestPosition(tempTableHittableTargets, (sanityEclipseRadius - 25))
				if #Heroes.InRadius(bestPos, (sanityEclipseRadius - 25), Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) >= Menu.GetValue(fooAllInOne.optionHeroODKillstealEclipseHittable) then
					for _, v in ipairs(Heroes.InRadius(bestPos, (sanityEclipseRadius - 25), Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)) do
						local targetHP = Entity.GetHealth(v) + NPC.GetHealthRegen(v)
						local sanityEclipseDamage = (Hero.GetIntellectTotal(myHero) - Hero.GetIntellectTotal(v)) * Ability.GetLevelSpecialValueFor(sanityEclipse, "damage_multiplier")
						local sanityEclipseTrueDamage = (1 - NPC.GetMagicalArmorValue(v)) * (sanityEclipseDamage + sanityEclipseDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))		
						if targetHP < sanityEclipseTrueDamage then
							table.insert(tempTableKillableTargets, v)
						end
					end
				end
			end

			if #tempTableKillableTargets >= Menu.GetValue(fooAllInOne.optionHeroODKillstealEclipseKillable) then
				local bestPos = fooAllInOne.getBestPosition(tempTableHittableTargets, (sanityEclipseRadius - 25))
				if NPC.IsPositionInRange(myHero, bestPos, 690, 0) then
					Ability.CastPosition(sanityEclipse, bestPos)
					return
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroODKillstealPrison) then
		if astralPrison and Ability.IsCastable(astralPrison, myMana) then
			local prisonCastRange = Ability.GetCastRange(astralPrison)
			for _, targets in ipairs(Entity.GetHeroesInRadius(myHero, prisonCastRange, Enum.TeamType.TEAM_ENEMY)) do
				if targets then
					local target = fooAllInOne.targetChecker(targets)
					if target then
						if not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(target) then
							local targetHP = Entity.GetHealth(target) + 4 * math.ceil(NPC.GetHealthRegen(target))
							local prisonDamage = Ability.GetLevelSpecialValueFor(astralPrison, "damage")
							local prisonTrueDamage = (1 - NPC.GetMagicalArmorValue(target)) * (prisonDamage + prisonDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
							if targetHP < prisonTrueDamage then
								Ability.CastTarget(astralPrison, target)
								break
								return
							end
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroODKillstealOrb) then
		if arcaneOrb and Ability.IsCastable(arcaneOrb, myMana) and Ability.GetLevel(arcaneOrb) > 0 then
			for _, targets in ipairs(Entity.GetHeroesInRadius(myHero, myAttackRange, Enum.TeamType.TEAM_ENEMY)) do
				if targets then
					local target = fooAllInOne.targetChecker(targets)
					if target then
						if not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsLinkensProtected(target) then
							local targetHP = Entity.GetHealth(target) + NPC.GetHealthRegen(target)
							local orbExtraDamage = (0.05 + (0.01 * Ability.GetLevel(arcaneOrb))) * NPC.GetMana(myHero)
							local rightClickDamage = NPC.GetDamageMultiplierVersus(myHero, target) * ((NPC.GetMinDamage(myHero) + NPC.GetBonusDamage(myHero)) * NPC.GetArmorDamageMultiplier(target))
							local overallDamage = rightClickDamage + orbExtraDamage
							if targetHP < overallDamage then
								Ability.CastTarget(arcaneOrb, target)
								break
								return
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.NecroCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroNecro) then return end

	local deathPulse = NPC.GetAbilityByIndex(myHero, 0)
    	local ghostShroud = NPC.GetAbilityByIndex(myHero, 1)
    	local reapersScythe = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.necroComboTotalDamage(myHero, myMana, enemy, deathPulse, reapersScythe)
	fooAllInOne.necroComboSelector(myHero, myMana, enemy, deathPulse, reapersScythe)
	fooAllInOne.necroAutoScythe(myHero, myMana, reapersScythe)
	fooAllInOne.necroAutoPulse(myHero, myMana, deathPulse)
	fooAllInOne.necroAutoFarmShroud(myHero, myMana, deathPulse, ghostShroud)
	fooAllInOne.necroAutoPulseShroudPanic(myHero, myMana, deathPulse, ghostShroud)

	if enemy then
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
			if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
				if not NPC.IsEntityInRange(myHero, enemy, 999) then
					if Menu.IsEnabled(fooAllInOne.optionHeroNecroBlink) and blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1150 + Menu.GetValue(fooAllInOne.optionHeroNecroBlinkRange)) then
						Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(Menu.GetValue(fooAllInOne.optionHeroNecroBlinkRange))))
						return
					end
				end

				if not fooAllInOne.necroComboSelect then
					fooAllInOne.necroComboWithoutUlt(myHero, myMana, enemy, deathPulse)
				else
					fooAllInOne.necroComboWithUlt(myHero, myMana, enemy, deathPulse, reapersScythe)
				end

			end
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
		end
	end

end

function fooAllInOne.necroAutoPulseShroudPanic(myHero, myMana, deathPulse, ghostShroud)

	if not Menu.IsEnabled(fooAllInOne.optionHeroNecroShroudPanic) then return end
	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local myHP = Entity.GetHealth(myHero)
	local myHPperc = (myHP / Entity.GetMaxHealth(myHero)) * 100

	if myHPperc <= Menu.GetValue(fooAllInOne.optionHeroNecroShroudPanicHP) then
		if ghostShroud and Ability.IsCastable(ghostShroud, myMana) then
			Ability.CastNoTarget(ghostShroud)
			return
		end
		if deathPulse and Ability.IsCastable(deathPulse, myMana) then
			Ability.CastNoTarget(deathPulse)
			return
		end
	end

end

function fooAllInOne.necroAutoFarmShroud(myHero, myMana, deathPulse, ghostShroud)

	if not Menu.IsEnabled(fooAllInOne.optionHeroNecroShroudFarm) then return end
	if not myHero then return end
	if not deathPulse then return end
		if Ability.GetLevel(deathPulse) < 1 then return end

	if not ghostShroud then return end
		if Ability.GetLevel(ghostShroud) < 1 then return end
		if not Ability.IsCastable(ghostShroud, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local deathPulseModifier = NPC.GetModifier(myHero, "modifier_necrolyte_death_pulse_counter")
	local deathPulseCounter = 0
		if deathPulseModifier then
			deathPulseCounter = Modifier.GetStackCount(deathPulseModifier)
		end

	if deathPulseCounter <= Menu.GetValue(fooAllInOne.optionHeroNecroShroudFarmCount) then return end
	if Menu.IsEnabled(fooAllInOne.optionHeroNecroShroudFarmSave) then
		if #Entity.GetHeroesInRadius(myHero, 600, Enum.TeamType.TEAM_ENEMY) > 0 then
			return
		end
	end
	local manaPerc = (NPC.GetMana(myHero) / NPC.GetMaxMana(myHero)) * 100
	local healthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100
	local treshold = Menu.GetValue(fooAllInOne.optionHeroNecroShroudFarmTreshold)
	if manaPerc <= treshold or healthPerc <= treshold then
		Ability.CastNoTarget(ghostShroud)
		return
	end

end

function fooAllInOne.necroAutoPulse(myHero, myMana, deathPulse)

	if not Menu.IsEnabled(fooAllInOne.optionHeroNecroPulse) then return end
	if not myHero then return end
	if not deathPulse then return end
		if Ability.GetLevel(deathPulse) < 1 then return end
		if not Ability.IsCastable(deathPulse, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroNecroPulseCreeps) then
		local tempTable = {}
		for _, creep in ipairs(NPC.GetUnitsInRadius(myHero, 450, Enum.TeamType.TEAM_ENEMY)) do
			if creep and Entity.IsNPC(creep) and not Entity.IsDormant(creep) and not NPC.IsWaitingToSpawn(creep) then
				local pulseDamage = Ability.GetDamage(deathPulse)
				local pulseTrueDamage = (1 - NPC.GetMagicalArmorValue(creep)) * (pulseDamage + pulseDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
				if NPC.IsLaneCreep(creep) then
					local attackerCount = 0
					if fooAllInOne.lastHitterTimingMap[creep] ~= nil then
						for k, l in pairs(fooAllInOne.lastHitterTimingMap[creep]) do
							attackerCount = attackerCount + 1
						end
					end
					local creepHP = Entity.GetHealth(creep) - attackerCount * 15
					if creepHP < pulseTrueDamage then
						table.insert(tempTable, creep)
					end
				end
				if NPC.IsCreep(creep) and not NPC.IsLaneCreep(creep) then
					local creepHP = Entity.GetHealth(creep)
					if creepHP < pulseTrueDamage then
						table.insert(tempTable, creep)
					end
				end
			end
		end

		if #tempTable >= Menu.GetValue(fooAllInOne.optionHeroNecroPulseCreepsCount) then
			if (myMana / NPC.GetMaxMana(myHero)) >= (Menu.GetValue(fooAllInOne.optionHeroNecroPulseCreepsMana) / 100) then
				Ability.CastNoTarget(deathPulse)
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroNecroPulseHeroes) then
		for _, hero in ipairs(NPC.GetHeroesInRadius(myHero, 450, Enum.TeamType.TEAM_ENEMY)) do
			local target = fooAllInOne.targetChecker(hero)
			if target then
				if not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					if (myMana / NPC.GetMaxMana(myHero)) >= (Menu.GetValue(fooAllInOne.optionHeroNecroPulseHeroesMana) / 100) then
						Ability.CastNoTarget(deathPulse)
						break
						return
					end
				end
			end
		end
	end
					
end

function fooAllInOne.necroAutoScythe(myHero, myMana, reapersScythe)

	if not Menu.IsEnabled(fooAllInOne.optionHeroNecroScythe) then return end
	if not myHero then return end
	if not reapersScythe then return end
		if Ability.GetLevel(reapersScythe) < 1 then return end
		if not Ability.IsCastable(reapersScythe, myMana) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then return end

	for _, hero in ipairs(NPC.GetHeroesInRadius(myHero, 575, Enum.TeamType.TEAM_ENEMY)) do
		if hero and Entity.IsHero(hero) and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) then 
			if Entity.IsAlive(hero) then
				local scytheDamage = (Entity.GetMaxHealth(hero) - Entity.GetHealth(hero)) * Ability.GetLevelSpecialValueForFloat(reapersScythe, "damage_per_health")
        			local scytheTrueDamage = (1 - NPC.GetMagicalArmorValue(hero)) * (scytheDamage + scytheDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
				if Entity.GetHealth(hero) < scytheTrueDamage then
					Ability.CastTarget(reapersScythe, hero)
					break
        				return
				end
			end
      		end		
	end

end

function fooAllInOne.necroComboSelector(myHero, myMana, enemy, deathPulse, reapersScythe)

	if not myHero then return end
	if not enemy then return end
	if os.clock() - fooAllInOne.lastTick < 0.55 + ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 400) then return end


	if not deathPulse then return end

	if Ability.SecondsSinceLastUse(deathPulse) > -1 and Ability.SecondsSinceLastUse(deathPulse) < 0.55 + ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 400) then return end

	if not reapersScythe then
		fooAllInOne.necroComboSelect = false
		return
	end

	if Ability.GetLevel(reapersScythe) < 1 then
		fooAllInOne.necroComboSelect = false
		return
	end

	if not Ability.IsCastable(reapersScythe, myMana) then
		fooAllInOne.necroComboSelect = false
		return
	end

	if Menu.GetValue(fooAllInOne.optionHeroNecroComboScythe) == 0 then
		fooAllInOne.necroComboSelect = false
		return
	else
		if Entity.GetHealth(enemy) > fooAllInOne.necroDMGwithoutUlt then
			fooAllInOne.necroComboSelect = true
			return
		else
			fooAllInOne.necroComboSelect = false
			return
		end
	end	

end

function fooAllInOne.necroComboWithoutUlt(myHero, myMana, enemy, deathPulse)

	if not myHero then return end
	if not enemy then return end

	if deathPulse and Ability.IsCastable(deathPulse, myMana) and NPC.IsEntityInRange(myHero, enemy, 450) then
		Ability.CastNoTarget(deathPulse)
		fooAllInOne.lastTick = os.clock()
		return
	end

end

function fooAllInOne.necroComboWithUlt(myHero, myMana, enemy, deathPulse, reapersScythe)

	if not myHero then return end
	if not enemy then return end

	if deathPulse and Ability.IsCastable(deathPulse, myMana) and NPC.IsEntityInRange(myHero, enemy, 450) then
		Ability.CastNoTarget(deathPulse)
		fooAllInOne.lastTick = os.clock()
		return
	end

	if reapersScythe and Ability.IsCastable(reapersScythe, myMana) and NPC.IsEntityInRange(myHero, enemy, 550) then
		if Menu.GetValue(fooAllInOne.optionHeroNecroComboScythe) == 1 then
			if not Ability.IsReady(deathPulse) then
				Ability.CastTarget(reapersScythe, enemy)
				fooAllInOne.lastTick = os.clock()
				return
			end
		elseif Menu.GetValue(fooAllInOne.optionHeroNecroComboScythe) == 2 then
			local scytheDamage = (Entity.GetMaxHealth(enemy) - Entity.GetHealth(enemy)) * Ability.GetLevelSpecialValueForFloat(reapersScythe, "damage_per_health")
        		local scytheTrueDamage = (1 - NPC.GetMagicalArmorValue(enemy)) * (scytheDamage + scytheDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
			local rightClickDamage = NPC.GetDamageMultiplierVersus(myHero, enemy) * ((NPC.GetMinDamage(myHero) + NPC.GetBonusDamage(myHero)) * NPC.GetArmorDamageMultiplier(enemy))
			local pulseExtraDamage = 0
				if deathPulse and Ability.SecondsSinceLastUse(deathPulse) > -1 and Ability.SecondsSinceLastUse(deathPulse) < (((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 400) + 0.05) then
					pulseExtraDamage = (1 - NPC.GetMagicalArmorValue(enemy)) * (Ability.GetDamage(deathPulse) + Ability.GetDamage(deathPulse) * (Hero.GetIntellectTotal(myHero) / 14 / 100))
				end
			if Entity.GetHealth(enemy) < (scytheTrueDamage + rightClickDamage + pulseExtraDamage) then
				Ability.CastTarget(reapersScythe, enemy)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

end

function fooAllInOne.necroComboTotalDamage(myHero, myMana, enemy, deathPulse, reapersScythe)

	if not myHero then return end
	if not enemy then return end
	if NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return end 

	local totalDamage = 0
	local totalDamageUlt = 0
	local veilAmp = 0
	local ebladeAmp = 0
	local reqMana = 0
	local reqManaUlt = 0

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end

	if veil and Ability.IsCastable(veil, myMana) then
		veilAmp = 0.25
		reqMana = reqMana + Ability.GetManaCost(veil)
	end

	if eBlade and Ability.IsCastable(eBlade, myMana) then
		local ebladedamage = Hero.GetIntellectTotal(myHero) * 2 + 75
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + veilAmp) * (ebladedamage + ebladedamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		ebladeAmp = 0.4
		reqMana = reqMana + Ability.GetManaCost(eBlade)
	end	

	if dagon and Ability.IsCastable(dagon, Ability.GetManaCost(dagon)) then
		local dagondmg = Ability.GetLevelSpecialValueFor(dagon, "damage")
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + veilAmp) * (1 + ebladeAmp) * (dagondmg + dagondmg * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(dagon)
	end

	if deathPulse and Ability.IsCastable(deathPulse, myMana) then
		local pulseDamage = Ability.GetDamage(deathPulse)
		totalDamage = totalDamage + (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + veilAmp) * (1 + ebladeAmp) * (pulseDamage + pulseDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		reqMana = reqMana + Ability.GetManaCost(deathPulse)
	end

	local rightClickDamage = NPC.GetDamageMultiplierVersus(myHero, enemy) * ((NPC.GetMinDamage(myHero) + NPC.GetBonusDamage(myHero)) * NPC.GetArmorDamageMultiplier(enemy))
	totalDamage = totalDamage + rightClickDamage

	local scytheOverallTrueDamage = 0
	local totalDamageUlt = totalDamage
	local reqManaUlt = reqMana
	if reapersScythe and Ability.IsCastable(reapersScythe, myMana) then
		local scytheDamage = (Entity.GetMaxHealth(enemy) - (Entity.GetHealth(enemy) - totalDamage - rightClickDamage)) * Ability.GetLevelSpecialValueForFloat(reapersScythe, "damage_per_health")
		local scytheTrueDamage = (1 - NPC.GetMagicalArmorValue(enemy)) * (1 + veilAmp) * (1 + ebladeAmp) * (scytheDamage + scytheDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
		scytheOverallTrueDamage = scytheTrueDamage + rightClickDamage
		totalDamageUlt = totalDamage + scytheOverallTrueDamage
		reqManaUlt = reqManaUlt + Ability.GetManaCost(reapersScythe)
	end

	if reqManaUlt > NPC.GetMana(myHero) and reqMana < NPC.GetMana(myHero) then
		totalDamageUlt = totalDamage
	end

	if reqMana < NPC.GetMana(myHero) then
		fooAllInOne.necroDMGwithoutUlt = totalDamage
		fooAllInOne.necroDMGwithUlt = totalDamageUlt
	end

end

function fooAllInOne.necroComboDrawDamage(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroNecroDrawDMG) then return end
	
	if fooAllInOne.necroDMGwithoutUlt == 0 then return end
	if fooAllInOne.necroDMGwithUlt == 0 then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))
		if not enemy then return end
		if not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then return end

	local pos = Entity.GetAbsOrigin(enemy)
	local posY = NPC.GetHealthBarOffset(enemy)
		pos:SetZ(pos:GetZ() + posY)
			
	local x, y, visible = Renderer.WorldToScreen(pos)

	if fooAllInOne.necroDMGwithoutUlt > 0 and fooAllInOne.necroDMGwithUlt > 0 then
		if visible then
			if Entity.GetHealth(enemy) > fooAllInOne.necroDMGwithoutUlt then
				Renderer.SetDrawColor(255,102,102,255)
			else
				Renderer.SetDrawColor(50,205,50,255)
			end
				Renderer.DrawText(fooAllInOne.skywrathFont, x-50, y-90, "DMG w/o Ult: " .. math.floor(fooAllInOne.necroDMGwithoutUlt), 0)
			if Entity.GetHealth(enemy) > fooAllInOne.necroDMGwithUlt then
				Renderer.SetDrawColor(255,102,102,255)
			else
				Renderer.SetDrawColor(50,205,50,255)
			end
				Renderer.DrawText(fooAllInOne.skywrathFont, x-50, y-75, "DMG w/ Ult: " .. math.floor(fooAllInOne.necroDMGwithUlt), 0)
		end
	end
		

end

function fooAllInOne.PACombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroPA) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local dagger = NPC.GetAbilityByIndex(myHero, 0)
	local phantomStrike = NPC.GetAbilityByIndex(myHero, 1)

	local myMana = NPC.GetMana(myHero)

	local daggerRange = Ability.GetCastRange(dagger)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
			if fooAllInOne.SleepReady(0.1) and dagger and Ability.IsCastable(dagger, myMana) then
				if NPC.IsEntityInRange(myHero, enemy, daggerRange - 5) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastTarget(dagger, enemy)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
			if fooAllInOne.SleepReady(0.1) and phantomStrike and Ability.IsCastable(phantomStrike, myMana) then
				if NPC.IsEntityInRange(myHero, enemy, 999) then
					Ability.CastTarget(phantomStrike, enemy)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end

	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)

	end
	
	local minHP = 99999
	local minHPenemy

	if Menu.IsEnabled(fooAllInOne.optionHeroPADagger) and fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then
		if fooAllInOne.Toggler then
			if NPC.GetMana(myHero) > (NPC.GetMaxMana(myHero) * (Menu.GetValue(fooAllInOne.optionHeroPADaggerThreshold) / 100)) then
				if dagger and Ability.IsCastable(dagger, myMana) then
					local daggerEnemies = NPC.GetHeroesInRadius(myHero, daggerRange - 1, Enum.TeamType.TEAM_ENEMY)
					for _, daggerEnemy in ipairs(daggerEnemies) do
						if daggerEnemy and fooAllInOne.targetChecker(daggerEnemy) ~= nil and not NPC.HasState(daggerEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							local enemyHP = Entity.GetHealth(daggerEnemy)
							if enemyHP < minHP then
								minHP = enemyHP
								minHPenemy = daggerEnemy
							end
						end
					end
				end
			end
		end
	end

	if minHPenemy and fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then
		if Menu.IsEnabled(fooAllInOne.optionHeroPADagger) then
			if fooAllInOne.Toggler then
				if not NPC.IsChannellingAbility(myHero) and not NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(myHero, "modifier_teleporting") then
					if fooAllInOne.SleepReady(0.3) and dagger and Ability.IsCastable(dagger, myMana) then
						Ability.CastTarget(dagger, minHPenemy)
						fooAllInOne.lastTick = os.clock()
						minHP = 99999
						minHPenemy = nil
						return
					end
				end
			end
		end
	end

end

function fooAllInOne.DrawPADaggerSwitch()

	local w, h = Renderer.GetScreenSize()
	Renderer.SetDrawColor(255, 0, 255)

	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroPADaggerToggleKey) then
		fooAllInOne.Toggler = not fooAllInOne.Toggler
		fooAllInOne.TogglerTime = os.clock()
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroPADaggerDraw) then
		if os.clock() - fooAllInOne.TogglerTime < 3 then
			if fooAllInOne.Toggler then
				Renderer.DrawTextCentered(fooAllInOne.font, w / 2, h / 2 + 300, "AUTO DAGGER ON", 1)
			else 
				Renderer.DrawTextCentered(fooAllInOne.font, w / 2, h / 2 + 300, "AUTO DAGGER OFF", 1)
			end
		end
	end

end

--function fooAllInOne.KunkkaCombo(myHero, enemy)
--
--	if not Menu.IsEnabled(fooAllInOne.optionHeroKunkka) then return end
--	if not NPC.IsEntityInRange(myHero, enemy, 1500)	then return end
--
--	local torrent = NPC.GetAbility(myHero, "kunkka_torrent")
--    	local xMark = NPC.GetAbilityByIndex(myHero, 2)
--	local kunkkaReturn = NPC.GetAbility(myHero, "kunkka_return")
--	local ship = NPC.GetAbilityByIndex(myHero, 3)
--
--	local blink = NPC.GetItem(myHero, "item_blink", true)
--    	
--	local myMana = NPC.GetMana(myHero)
--
--	local xMarkRange = 200 + 200 * Ability.GetLevel(xMark)
--	local xMarkModifier = NPC.GetModifier(enemy, "modifier_kunkka_x_marks_the_spot")
--Log.Write(xMarkRange)
--	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
--		if not NPC.IsEntityInRange(myHero, enemy, xMarkRange - 75) then
--			if blink and Ability.IsReady(blink) then
--				if NPC.IsEntityInRange(myHero, enemy, 1150) then
--					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(300))
--					return
--				end
--			end
--		else
--			if not NPC.HasModifier(enemy, "modifier_kunkka_x_marks_the_spot") then
--				if xMark and Ability.IsCastable(xMark, myMana) and not Ability.IsHidden(xMark) and Ability.IsCastable(torrent, myMana - 50) then
--					Ability.CastTarget(xMark, enemy)
--					fooAllInOne.lastTick = os.clock()
--					return
--				end
--			else
--				if ship and Ability.IsCastable(ship, myMana) then
--					Ability.CastPosition(ship, Entity.GetAbsOrigin(enemy))
--					fooAllInOne.lastCastTime = os.clock()
--					return	
--				end
--				if torrent and Ability.IsCastable(torrent, myMana) and os.clock() - fooAllInOne.lastCastTime > 1.6 then
--					Ability.CastPosition(torrent, Entity.GetAbsOrigin(enemy))
--					fooAllInOne.lastTick = os.clock()
--				--	fooAllInOne.lastCastTime = os.clock()
--					return
--				end
--				if kunkkaReturn and not Ability.IsHidden(kunkkaReturn) and not Ability.IsReady(ship) and not Ability.IsReady(torrent) then
--					if os.clock() - fooAllInOne.lastCastTime > 2.0 then
--						Ability.CastNoTarget(kunkkaReturn)
--						return
--					end
--				end
--			end
--		end
--	end
--
--end

function fooAllInOne.AntiMageCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroAntiMage) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local AMblink = NPC.GetAbilityByIndex(myHero, 1)
    	local manaVoid = NPC.GetAbilityByIndex(myHero, 3)
    	
	local myMana = NPC.GetMana(myHero)

	local blinkRange = Ability.GetLevelSpecialValueFor(AMblink, "blink_range")

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 250) then
			if AMblink and Ability.IsCastable(AMblink, myMana) and Menu.IsEnabled(fooAllInOne.optionHeroAntiMageBlink) then
				if NPC.IsEntityInRange(myHero, enemy, blinkRange - 105) then
					if NPC.GetTimeToFace(enemy, myHero) <= 0.05 then
						Ability.CastPosition(AMblink, Entity.GetAbsOrigin(enemy))
						return
					else
						Ability.CastPosition(AMblink, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(100))
						return
					end
				end
			end
		end

	fooAllInOne.itemUsage(myHero, enemy)
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	fooAllInOne.MantaIlluController(enemy, nil, myHero, myHero)

	end

	local maxManaDiff = 0
	local maxDMGTarget

	if manaVoid and Ability.IsCastable(manaVoid, myMana) and fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then
		if Menu.IsEnabled(fooAllInOne.optionHeroAntiMageVoid) then
			local voidEnemies = NPC.GetHeroesInRadius(myHero, 599, Enum.TeamType.TEAM_ENEMY)
			for _, voidEnemy in ipairs(voidEnemies) do
				if voidEnemy and not NPC.IsLinkensProtected(voidEnemy) then
					local enemyManaDiff = NPC.GetMaxMana(voidEnemy) - NPC.GetMana(voidEnemy)
					if #voidEnemies <= 1 then
						if not NPC.HasState(voidEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							maxManaDiff = 0
							maxDMGTarget = voidEnemy
							break
							return
						end
					else
						if enemyManaDiff > maxManaDiff and not NPC.HasState(voidEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
							maxManaDiff = enemyManaDiff
							maxDMGTarget = voidEnemy
						end
					end
				end
			end
		end
	end

	if maxDMGTarget ~= nil then
		if fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then
			local enemyHP = Entity.GetHealth(maxDMGTarget) + NPC.GetHealthRegen(maxDMGTarget)
			local enemiesInVoidRadius = NPC.GetHeroesInRadius(maxDMGTarget, 450, Enum.TeamType.TEAM_FRIEND)
			local enemyManaDiff = NPC.GetMaxMana(maxDMGTarget) - NPC.GetMana(maxDMGTarget)
			local voidDamage = enemyManaDiff * Ability.GetLevelSpecialValueForFloat(manaVoid, "mana_void_damage_per_mana")
			local totalVoidDamage = ((1 - NPC.GetMagicalArmorValue(maxDMGTarget)) * voidDamage) + (voidDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))
			if manaVoid and Ability.IsCastable(manaVoid, myMana) then
				if NPC.IsEntityInRange(myHero, maxDMGTarget, 599) then
					if totalVoidDamage > enemyHP then
						Ability.CastTarget(manaVoid, maxDMGTarget)
						maxManaDiff = 0
						maxDMGTarget = nil
						return
					end
					if #enemiesInVoidRadius >= 1 then
						for _, radiusTargets in ipairs(enemiesInVoidRadius) do
							if radiusTargets then
								local voidDamageRadius = enemyManaDiff * Ability.GetLevelSpecialValueForFloat(manaVoid, "mana_void_damage_per_mana")
								local totalVoidDamageRadius = ((1 - NPC.GetMagicalArmorValue(radiusTargets)) * voidDamageRadius) + (voidDamageRadius * (Hero.GetIntellectTotal(myHero) / 14 / 100))
								if totalVoidDamageRadius > Entity.GetHealth(radiusTargets) + NPC.GetHealthRegen(radiusTargets) and not NPC.HasState(radiusTargets, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
									Ability.CastTarget(manaVoid, maxDMGTarget)
									maxManaDiff = 0
									maxDMGTarget = nil
									break
									return
								end
							end
						end
					end
				end	
			end
		end
	end
				
end		

function fooAllInOne.tinyCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTiny) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end
    
    	local avalanche = NPC.GetAbilityByIndex(myHero, 0)
    	local toss = NPC.GetAbilityByIndex(myHero, 1)
    	local myMana = NPC.GetMana(myHero)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 275) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					return
				end
			end
		else
			fooAllInOne.itemUsage(myHero, enemy)
			if avalanche and Ability.IsCastable(avalanche, myMana) then 
				Ability.CastPosition(avalanche, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
			end
    			if fooAllInOne.SleepReady(Ability.GetCastPoint(avalanche)) and toss and Ability.IsCastable(toss, myMana) then 
				Ability.CastTarget(toss, enemy)
				return 
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
end

function fooAllInOne.WindRunnerCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroWindrunner) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local shackleShot = NPC.GetAbilityByIndex(myHero, 0)
	local windRun = NPC.GetAbilityByIndex(myHero, 2)
	local focusFire = NPC.GetAbilityByIndex(myHero, 3)
	local myMana = NPC.GetMana(myHero)
	
	local branch = NPC.GetItem(myHero, "item_branches", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)

	fooAllInOne.itemUsage(myHero, enemy)

	if fooAllInOne.canEnemyBeShackledWithTree(myHero, enemy) == true or fooAllInOne.getEnemyBeShackledWithNPC(myHero, enemy) ~= nil then
		fooAllInOne.enemyCanBeShackled = true
	else
		fooAllInOne.enemyCanBeShackled = false
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if fooAllInOne.getEnemyBeShackledWithNPC(myHero, enemy) ~= nil then
			if shackleShot and Ability.IsCastable(shackleShot, myMana) then
				Ability.CastTarget(shackleShot, fooAllInOne.getEnemyBeShackledWithNPC(myHero, enemy))
				return
			end
		elseif fooAllInOne.canEnemyBeShackledWithTree(myHero, enemy) == true then
			if shackleShot and Ability.IsCastable(shackleShot, myMana) then
				Ability.CastTarget(shackleShot, enemy)
				return
			end
		else
			if fooAllInOne.getEnemyShackledBestPosition(myHero, enemy, 1150):__tostring() ~= Vector():__tostring() then
				if blink and Ability.IsReady(blink) and Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerBlinkShackle) then
					Ability.CastPosition(blink, fooAllInOne.getEnemyShackledBestPosition(myHero, enemy, 1150))
					return
				end

			else
				if Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerBranchShackle) then
					if branch and NPC.IsEntityInRange(myHero, enemy, 750) then
						if blink and Ability.IsReady(blink) then	
							if shackleShot and Ability.IsCastable(shackleShot, myMana) then
								Ability.CastTarget(shackleShot, enemy)
								return
							end
							if blink and Ability.IsReady(blink) and not Ability.IsReady(shackleShot) then
								Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Rotated(Angle(0,45,0)):Normalized():Scaled(200))
								Ability.CastPosition(branch, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(150))
								return
							end
						end
					end
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

	if NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then

			local shackleMod = NPC.GetModifier(enemy, "modifier_windrunner_shackle_shot")
				if not shackleMod then return end
			local shackleTime = Modifier.GetCreationTime(shackleMod) + Modifier.GetDuration(shackleMod)

			if NPC.HasModifier(enemy, "modifier_windrunner_shackle_shot") and Modifier.GetDuration(shackleMod) >= 1.5 and Menu.IsEnabled(fooAllInOne.optionHeroWindrunnerUlt) then
				if focusFire and Ability.IsCastable(focusFire, myMana) then
					Ability.CastTarget(focusFire, enemy)
					return
				end
				if Menu.GetValue(fooAllInOne.optionHeroWindrunnerWind) > 0 then
					if windRun and Ability.IsCastable(windRun, myMana) and #NPC.GetHeroesInRadius(myHero, 600, Enum.TeamType.TEAM_ENEMY) >= Menu.GetValue(fooAllInOne.optionHeroWindrunnerWind) then
						Ability.CastNoTarget(windRun)
						return
					end
				end
			end
		end
	end
	
end

function fooAllInOne.windrunnerDrawShackleIndicator(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionWindrunnerDrawIndicator) then return end
	
	if fooAllInOne.enemyCanBeShackled == false then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))
		if not enemy then return end
		if not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then return end

	local pos = Entity.GetAbsOrigin(enemy)
	local posY = NPC.GetHealthBarOffset(enemy)
		pos:SetZ(pos:GetZ() + posY)
			
	local x, y, visible = Renderer.WorldToScreen(pos)

	if visible then
		Renderer.SetDrawColor(50,205,50,255)
		Renderer.DrawText(fooAllInOne.font, x-30, y-80, "shackle", 0)
	end
		
end

function fooAllInOne.TimberCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTimber) then return end
	
	if (os.clock() - fooAllInOne.lastTick) < fooAllInOne.delay then return end

	local whirlingDeath = NPC.GetAbilityByIndex(myHero, 0)
	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
	local chakram = NPC.GetAbility(myHero, "shredder_chakram")
	local chakramReturn = NPC.GetAbility(myHero, "shredder_return_chakram")
	local chakramAgha = NPC.GetAbility(myHero, "shredder_chakram_2")
	local chakramAghaReturn = NPC.GetAbility(myHero, "shredder_return_chakram_2")

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	
	local myMana = NPC.GetMana(myHero)

	local rangeChecker = 500
	if blink and Ability.IsReady(blink) then
		rangeChecker = 1150
	end

	if Menu.GetValue(fooAllInOne.optionHeroTimberWhirling) > 0 and fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then
		if enemy and NPC.IsEntityInRange(myHero, enemy, 270) then
			if whirlingDeath and Ability.IsCastable(whirlingDeath, myMana) then
				if (NPC.HasModifier(myHero, "modifier_shredder_timer_chain") and #Trees.InRadius(enemy, 270, true) > 0) then
					if #Trees.InRadius(myHero, 270, true) > 0 then
						Ability.CastNoTarget(whirlingDeath)
						fooAllInOne.makeDelay(0.1)
						return
					end
				else
					if Menu.GetValue(fooAllInOne.optionHeroTimberWhirling) == 2 then
						Ability.CastNoTarget(whirlingDeath)
						fooAllInOne.makeDelay(0.1)
						return
					else
						if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
							Ability.CastNoTarget(whirlingDeath)
							fooAllInOne.makeDelay(0.1)
							return
						end
					end
				end
			end
		end
	end

	fooAllInOne.itemUsage(myHero, enemy)
	
	if enemy and Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if fooAllInOne.TimberIsTreeInRangeForChain(myHero, enemy) ~= nil or fooAllInOne.TimberGetBestChainPos(myHero, enemy, rangeChecker):__tostring() ~= Vector():__tostring() then
			if fooAllInOne.TimberIsTreeInRangeForChain(myHero, enemy) ~= nil then
				if timberChain and Ability.IsCastable(timberChain, myMana) then
					Ability.CastPosition(timberChain, Entity.GetAbsOrigin(fooAllInOne.TimberIsTreeInRangeForChain(myHero, enemy)))
					fooAllInOne.lastCastTime3 = GameRules.GetGameTime() + (((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() + 275) / (1200 + Ability.GetLevel(timberChain) * 400))
					fooAllInOne.makeDelay(0.1)
					return
				end
			else
				if blink and Ability.IsReady(blink) and Menu.IsEnabled(fooAllInOne.optionHeroTimberBlink) then
					if fooAllInOne.TimberGetBestChainPos(myHero, enemy, rangeChecker):__tostring() ~= Vector():__tostring() then
						Ability.CastPosition(blink, fooAllInOne.TimberGetBestChainPos(myHero, enemy, 1150))
						return
					end
				elseif (not blink or (blink and not Ability.IsReady(blink)) or not Menu.IsEnabled(fooAllInOne.optionHeroTimberBlink)) and Ability.IsReady(timberChain) then
					if fooAllInOne.TimberGetBestChainPos(myHero, enemy, rangeChecker):__tostring() ~= Vector():__tostring() then
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, fooAllInOne.TimberGetBestChainPos(myHero, enemy, 500), myHero)
						return
					else
						if Ability.IsReady(timberChain) then
							fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
							return
						end
					end
				end
			end
		else
			if Menu.IsEnabled(fooAllInOne.optionHeroTimberUlt) and NPC.IsEntityInRange(myHero, enemy, 700) then
				if GameRules.GetGameTime() < fooAllInOne.lastCastTime3 then
					return
				else
					if not Ability.IsHidden(chakram) and not Ability.IsInAbilityPhase(timberChain) then
						if chakram and Ability.IsCastable(chakram, myMana) then
							local chakramPrediction = Ability.GetCastPoint(chakram) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 900) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
							Ability.CastPosition(chakram, fooAllInOne.castLinearPrediction(myHero, enemy, chakramPrediction))
							fooAllInOne.lastCastTime = 1
							fooAllInOne.makeDelay(0.3)
							return
						end
					elseif not Ability.IsHidden(chakramAgha) and Ability.IsHidden(chakram) and not Ability.IsInAbilityPhase(timberChain) then
						if chakramAgha and Ability.IsCastable(chakramAgha, myMana) then
							local chakramPrediction = Ability.GetCastPoint(chakram) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 900) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
							Ability.CastPosition(chakramAgha, fooAllInOne.castLinearPrediction(myHero, enemy, chakramPrediction))
							fooAllInOne.lastCastTime2 = 1
							fooAllInOne.makeDelay(0.3)
							return
						end
					end
				end
			end
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
		end
	end

	if enemy then
		if not Ability.IsHidden(chakramReturn) and fooAllInOne.lastCastTime == 1 and fooAllInOne.heroCanCastSpells(myHero) == true then
			if chakramReturn and Ability.IsCastable(chakramReturn, myMana) and (Ability.SecondsSinceLastUse(chakram) >= 1 and not NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff")) or (NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff") and Ability.SecondsSinceLastUse(chakram) >= (Menu.GetValue(fooAllInOne.optionHeroTimberUltTiming) * 0.5)) then
				Ability.CastNoTarget(chakramReturn)
				fooAllInOne.lastCastTime = 0
				fooAllInOne.makeDelay(0.3)
				return
			end
		end
		if not Ability.IsHidden(chakramAghaReturn) and fooAllInOne.lastCastTime2 == 1 and fooAllInOne.heroCanCastSpells(myHero) == true then
			if chakramAghaReturn and Ability.IsCastable(chakramAghaReturn, myMana) and (Ability.SecondsSinceLastUse(chakramAgha) >= 1 and not NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff")) or (NPC.HasModifier(enemy, "modifier_shredder_chakram_debuff") and Ability.SecondsSinceLastUse(chakramAgha) >= (Menu.GetValue(fooAllInOne.optionHeroTimberUltTiming) * 0.5)) then
				Ability.CastNoTarget(chakramAghaReturn)
				fooAllInOne.lastCastTime2 = 0
				fooAllInOne.makeDelay(0.3)
				return
			end
		end
	else
		if not Ability.IsHidden(chakramReturn) and fooAllInOne.lastCastTime == 1 and fooAllInOne.heroCanCastSpells(myHero) == true then
			if chakramReturn and Ability.IsCastable(chakramReturn, myMana) and Ability.SecondsSinceLastUse(chakram) >= 1 then
				Ability.CastNoTarget(chakramReturn)
				fooAllInOne.lastCastTime = 0
				fooAllInOne.makeDelay(0.1)
				return
			end
		end
		if not Ability.IsHidden(chakramAghaReturn) and fooAllInOne.lastCastTime2 == 1 and fooAllInOne.heroCanCastSpells(myHero) == true then
			if chakramAghaReturn and Ability.IsCastable(chakramAghaReturn, myMana) and Ability.SecondsSinceLastUse(chakramAgha) >= 1 then
				Ability.CastNoTarget(chakramAghaReturn)
				fooAllInOne.lastCastTime2 = 0
				fooAllInOne.makeDelay(0.1)
				return
			end
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionHeroTimberPanicKey) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if fooAllInOne.TimberPanic(myHero) ~= nil then
			Ability.CastPosition(timberChain, Entity.GetAbsOrigin(fooAllInOne.TimberPanic(myHero)))
			return
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionHeroTimberFastMoveKey) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if fooAllInOne.TimberFastMove(myHero) ~= nil then
			Ability.CastPosition(timberChain, Entity.GetAbsOrigin(fooAllInOne.TimberFastMove(myHero)))
			return
		else
			fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Input.GetWorldCursorPos(), myHero)
			return
		end
	end		

end

function fooAllInOne.TimberFastMove(myHero)

	if not myHero then return end

	local myMana = NPC.GetMana(myHero)
	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return end
		if not Ability.IsCastable(timberChain, myMana) then return end

	local chainCastRange = Ability.GetCastRange(timberChain)

	local cursorPos = Input.GetWorldCursorPos()

	local chainTree
	local minDis = 99999

	if next(fooAllInOne.TimberGetTreesFastMoveCursor(myHero)) ~= nil then
		chainTree = fooAllInOne.TimberGetTreesFastMoveCursor(myHero)[1][2]
	end

	if chainTree ~= nil then
		return chainTree
	end
	return

end

function fooAllInOne.TimberPanic(myHero)

	if not myHero then return end

	local myMana = NPC.GetMana(myHero)

	local timberChain = NPC.GetAbilityByIndex(myHero, 1)
		if not timberChain then return end
		if not Ability.IsCastable(timberChain, myMana) then return end

	local chainCastRange = Ability.GetCastRange(timberChain)

	local chainTree
	local minDis = 99999
	local maxDis = 0

	if Menu.GetValue(fooAllInOne.optionHeroTimberPanicDir) < 2 then
		if Menu.GetValue(fooAllInOne.optionHeroTimberPanicDir) == 0 then
			if next(fooAllInOne.TimberGetEscapeChainTreesFountain(myHero)) ~= nil then
				chainTree = fooAllInOne.TimberGetEscapeChainTreesFountain(myHero)[1][2]
			end
		else
			if next(fooAllInOne.TimberGetEscapeChainTrees(myHero)) ~= nil then
				chainTree = fooAllInOne.TimberGetEscapeChainTrees(myHero)[1][2]
			end
		end
	else
		local tree = Input.GetNearestTreeToCursor(true)
		if tree ~= nil then
			local dismyHeroToTree = (Entity.GetAbsOrigin(tree) - Entity.GetAbsOrigin(myHero)):Length2D()
			if dismyHeroToTree < chainCastRange then
				chainTree = tree
			else
				if fooAllInOne.TimberFastMove(myHero) ~= nil then
					chainTree = fooAllInOne.TimberFastMove(myHero)
				end
			end
		end
	end

	if chainTree ~= nil then
		return chainTree
	end
	return

end

function fooAllInOne.EmberCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroEmber) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local chains = NPC.GetAbility(myHero, "ember_spirit_searing_chains")
	local fist = NPC.GetAbility(myHero, "ember_spirit_sleight_of_fist")
	local flameGuard = NPC.GetAbility(myHero, "ember_spirit_flame_guard")
	local activeRemnant = NPC.GetAbilityByIndex(myHero, 3)
	local remnant = NPC.GetAbility(myHero, "ember_spirit_fire_remnant")
	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	local remnantModifier = NPC.GetModifier(myHero, "modifier_ember_spirit_fire_remnant_charge_counter")

	local fistRange = 650
		if fist then
			fistRange = fistRange + Ability.GetLevelSpecialValueFor(fist, "radius")
		end
		
	fooAllInOne.itemUsage(myHero, enemy)

	local myPos = Entity.GetAbsOrigin(myHero)
	if NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") then
		if chains and Ability.IsCastable(chains, myMana) then
			if NPC.IsEntityInRange(myHero, enemy, 85) then
				Ability.CastNoTarget(chains)
			end
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, fistRange) then
			if blink and Ability.IsReady(blink) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.IsEntityInRange(myHero, enemy, 1150 + fistRange) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(math.abs((Entity.GetAbs(Origin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() - 1150)))))
				return
			end
		else
			
			if fist and Ability.IsCastable(fist, myMana) then
				fooAllInOne.noItemCastFor(0.5)
				if NPC.IsEntityInRange(myHero, enemy, 650) then
					Ability.CastPosition(fist, Entity.GetAbsOrigin(enemy))
				else
					Ability.CastPosition(fist, (Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(690)))
				end
			end

			if flameGuard and Ability.IsCastable(flameGuard, myMana) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				Ability.CastNoTarget(flameGuard)
			end
	
			if remnant and Ability.IsReady(remnant) and not NPC.HasModifier(myHero, "modifier_ember_spirit_sleight_of_fist_caster_invulnerability") and NPC.GetMana(myHero) >= Ability.GetManaCost(activeRemnant) and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				local remnantCharges = Modifier.GetStackCount(remnantModifier)
				if Menu.GetValue(fooAllInOne.optionHeroEmberUlt) == 0 then
					if remnantCharges == 3 then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()			
					end
					if remnantCharges == 2 then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
					if remnantCharges == 1 then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
				end
				if Menu.GetValue(fooAllInOne.optionHeroEmberUlt) == 1 then
					if remnantCharges > 2 and fooAllInOne.SleepReady(3) then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
					if remnantCharges >= 2 and fooAllInOne.SleepReady(3) then
						Ability.CastPosition(remnant, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
					end
				end
			end
			if activeRemnant and Ability.IsCastable(activeRemnant, myMana) and NPC.HasModifier(myHero, "modifier_ember_spirit_fire_remnant_timer") and NPC.HasModifier(enemy, "modifier_ember_spirit_searing_chains") then
				for i = 1, NPCs.Count() do 
				local npc = NPCs.Get(i)
					if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
						if Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero) then
							if NPC.GetUnitName(npc) == "npc_dota_ember_spirit_remnant" then
								if NPC.IsEntityInRange(npc, enemy, 350) then
									Ability.CastPosition(activeRemnant, Entity.GetAbsOrigin(npc))
									break
								end
							end
						end
					end
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end	
end

function fooAllInOne.UrsaCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroUrsa) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local earthShock = NPC.GetAbilityByIndex(myHero, 0)
	local overPower = NPC.GetAbilityByIndex(myHero, 1)
	local enrage = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local earthShockOffset = 315
		if NPC.IsRunning(enemy) then
			earthShockOffset = 200
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if overPower and Ability.IsCastable(overPower, myMana) and NPC.IsEntityInRange(myHero, enemy, 1200) then
			Ability.CastNoTarget(overPower)
			fooAllInOne.lastTick = os.clock()
		end
		if fooAllInOne.SleepReady(Ability.GetCastPoint(overPower)) then
			if not NPC.IsEntityInRange(myHero, enemy, earthShockOffset) then
				if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1150) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
					return
				end
			else
				if earthShock and Ability.IsCastable(earthShock, myMana) then
					Ability.CastNoTarget(earthShock)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroUrsaEnrage) then
		if enrage and Ability.IsCastable(enrage, myMana) then
			if fooAllInOne.isHeroChannelling(myHero) == false and fooAllInOne.IsHeroInvisible(myHero) == false then		
				if (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) <= (Menu.GetValue(fooAllInOne.optionHeroUrsaEnrageHP) / 100) and #NPC.GetHeroesInRadius(myHero, 650, Enum.TeamType.TEAM_ENEMY) >= Menu.GetValue(fooAllInOne.optionHeroUrsaEnrageEnemies) then
					if fooAllInOne.SleepReady(Ability.GetCastPoint(earthShock)) then
						Ability.CastNoTarget(enrage)
						return
					end
				end
			end
		end
	end
end

function fooAllInOne.TACombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroTA) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local refraction = NPC.GetAbilityByIndex(myHero, 0)
	local meld = NPC.GetAbilityByIndex(myHero, 1)
	local psionicTrap = NPC.GetAbilityByIndex(myHero, 4)
	local trap = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local myAttackRange = NPC.GetAttackRange(myHero)
		if NPC.HasItem(myHero, "item_dragon_lance", true) or NPC.HasItem(myHero, "item_hurricane_pike", true) then
			myAttackRange = myAttackRange + 140
		end

	local refractionModifier = NPC.GetModifier(myHero, "modifier_templar_assassin_refraction_damage")
	local meldModifier = NPC.GetModifier(myHero, "modifier_templar_assassin_meld")

	if Menu.IsEnabled(fooAllInOne.optionHeroTAHarass) then
		if Menu.IsKeyDown(fooAllInOne.optionHeroTAHarassKey) then
			if fooAllInOne.TApsiBladesSpill(myHero, enemy, myAttackRange) ~= nil then
				local spillNPC = fooAllInOne.TApsiBladesSpill(myHero, enemy, myAttackRange)
				fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", spillNPC, nil)
				return
			else
				if fooAllInOne.TApsiBladesSpillBestPos(myHero, enemy, myAttackRange, Menu.GetValue(fooAllInOne.optionHeroTAHarassRange)):__tostring() ~= Vector():__tostring() then
					local movePos = fooAllInOne.TApsiBladesSpillBestPos(myHero, enemy, myAttackRange, Menu.GetValue(fooAllInOne.optionHeroTAHarassRange))
					fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, movePos)
					return
				end
			end
		end
	end		

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if NPC.IsEntityInRange(myHero, enemy, (1200 + myAttackRange/2)) then
			if refraction and Ability.IsCastable(refraction, myMana) then
				Ability.CastNoTarget(refraction)
			end
			if psionicTrap and Ability.IsCastable(psionicTrap, myMana) then
				Ability.CastPosition(psionicTrap, fooAllInOne.castPrediction(myHero, enemy, Ability.GetCastPoint(psionicTrap) + 0.25 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)))
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) and trap and Ability.IsReady(trap) and Ability.SecondsSinceLastUse(psionicTrap) > 0 and Ability.SecondsSinceLastUse(psionicTrap) < 1 then
				Ability.CastNoTarget(trap)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
		if not NPC.IsEntityInRange(myHero, enemy, myAttackRange) then
			if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) then
				if fooAllInOne.SleepReady(0.1) and blink and Ability.IsReady(blink) and Menu.IsEnabled(fooAllInOne.optionHeroTABlink) and NPC.IsEntityInRange(myHero, enemy, (1150 + myAttackRange/2)) then
					Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(myAttackRange/2)))
					return
				end
			end
		else
			if fooAllInOne.SleepReady(Ability.GetCastPoint(psionicTrap)) and meld and Ability.IsCastable(meld, myMana) then
				fooAllInOne.noItemCastFor(0.1)
				Ability.CastNoTarget(meld)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(0.1) and NPC.HasModifier(myHero, "modifier_templar_assassin_meld") then
				Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
		
end

function fooAllInOne.isEnemyInSpillRange(myHero, spillNPC, enemy, spillRange)

	if not spillNPC then return false end
	if not enemy then return false end

	if Entity.IsSameTeam(myHero, spillNPC) then
		if Entity.GetHealth(spillNPC) > 0.5 * Entity.GetMaxHealth(spillNPC) then
			return false 
		end
	end

	if NPC.IsRunning(spillNPC) then return false end

	local enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.75 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
		enemyPos:SetZ(0)

	local spillNPCpos = Entity.GetAbsOrigin(spillNPC)
		spillNPCpos:SetZ(0)

	local myPos = 	Entity.GetAbsOrigin(myHero)
		myPos:SetZ(0)

	if (spillNPCpos - enemyPos):Length2D() > spillRange then
		return false
	end

	local vecmyHeroTospillNPC = spillNPCpos - myPos
	local vecspillNPCToEnemy = enemyPos - spillNPCpos

	local searchPoint = spillNPCpos + vecmyHeroTospillNPC:Normalized():Scaled(vecspillNPCToEnemy:Length2D())

	if math.floor((enemyPos - searchPoint):Length2D()) <= 37 then
		return true
	end

	return false

end

function fooAllInOne.TApsiBladesSpillBestPos(myHero, enemy, myAttackRange, searchRange)

	if not myHero then return Vector() end
	if not enemy then return Vector() end

	local myMana = NPC.GetMana(myHero)
	local psiBlades = NPC.GetAbility(myHero, "templar_assassin_psi_blades")
		if not psiBlades then return Vector() end
		if Ability.GetLevel(psiBlades) < 1 then return Vector() end

	local spillRange = Ability.GetLevelSpecialValueFor(psiBlades, "attack_spill_range")

	local enemyPos = fooAllInOne.castPrediction(myHero, enemy, 0.75 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))

	local npcs = Entity.GetUnitsInRadius(myHero, myAttackRange+searchRange, Enum.TeamType.TEAM_BOTH)
		if next(npcs) == nil then return Vector() end

		local spillPos = Vector()
		local minRange = 99999
			
		for _, targetNPC in ipairs(npcs) do
			if targetNPC then
				if Entity.IsNPC(targetNPC) and not Entity.IsDormant(targetNPC) and (NPC.IsCreep(targetNPC) or NPC.IsLaneCreep(targetNPC) or NPC.IsNeutral(targetNPC)) and Entity.IsAlive(targetNPC) and not NPC.IsRunning(targetNPC) then
					local myDisToNPC = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(targetNPC)):Length()
					local myDisToEnemy = (Entity.GetAbsOrigin(myHero) - enemyPos):Length()
					local disEnemyToNPC = (enemyPos - Entity.GetAbsOrigin(targetNPC)):Length()
					if disEnemyToNPC < spillRange - 50 and myDisToNPC < myDisToEnemy then
						if ((Entity.IsSameTeam(myHero, targetNPC) and Entity.GetHealth(targetNPC) < 0.5 * Entity.GetMaxHealth(targetNPC)) or not Entity.IsSameTeam(myHero, targetNPC)) then
							local vecEnemyTospillNPC = Entity.GetAbsOrigin(targetNPC) - enemyPos
							local adjustedNPCPos = Entity.GetAbsOrigin(targetNPC) + vecEnemyTospillNPC:Normalized():Scaled(100)
							local searchPos = adjustedNPCPos + vecEnemyTospillNPC:Normalized():Scaled(myAttackRange - 105)
							local closestPoint = fooAllInOne.GetClosestPoint(adjustedNPCPos, searchPos, Entity.GetAbsOrigin(myHero), true)
							local myDisToClostestPoint = (Entity.GetAbsOrigin(myHero) - closestPoint):Length()
							if myDisToClostestPoint < searchRange then
								if myDisToClostestPoint < minRange then
									spillPos = closestPoint
									minRange = myDisToClostestPoint
								end
							end
						end
					end
				end
			end
		end

		if spillPos:__tostring() ~= Vector():__tostring() and minRange > 25 then
			return spillPos
		end

	return Vector()

end

function fooAllInOne.TApsiBladesSpill(myHero, enemy, myAttackRange)

	if not myHero then return end
	if not enemy then return end

	local myMana = NPC.GetMana(myHero)
	local psiBlades = NPC.GetAbility(myHero, "templar_assassin_psi_blades")
		if not psiBlades then return end
		if Ability.GetLevel(psiBlades) < 1 then return end

	local spillRange = Ability.GetLevelSpecialValueFor(psiBlades, "attack_spill_range")

	local npcs = Entity.GetUnitsInRadius(myHero, myAttackRange, Enum.TeamType.TEAM_BOTH)
		if next(npcs) == nil then return end

		local spillNPC
			
		for _, targetNPC in ipairs(npcs) do
			if targetNPC then
				if Entity.IsNPC(targetNPC) and not Entity.IsDormant(targetNPC) and (NPC.IsCreep(targetNPC) or NPC.IsLaneCreep(targetNPC) or NPC.IsNeutral(targetNPC)) and Entity.IsAlive(targetNPC) then
					if fooAllInOne.isEnemyInSpillRange(myHero, targetNPC, enemy, spillRange) == true then
						spillNPC = targetNPC
					end
				end
			end
		end

		if spillNPC then
			return spillNPC
		end
	
	return

end

function fooAllInOne.LegionCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroLegion) then return end

	local odds = NPC.GetAbilityByIndex(myHero, 0)
	local pressTheAttack = NPC.GetAbilityByIndex(myHero, 1)
    	local duel = NPC.GetAbilityByIndex(myHero, 3)

	local Blademail = NPC.GetItem(myHero, "item_blade_mail", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
	local armlet = NPC.GetItem(myHero, "item_armlet", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if enemy and Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then

		if not NPC.IsEntityInRange(myHero, enemy, 150) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1199) then
					if Blademail and Ability.IsCastable(Blademail, myMana) and Ability.IsCastable(duel, myMana) then
						Ability.CastNoTarget(Blademail)
						return
					end
					if fooAllInOne.SleepReady(0.6) and armlet and Ability.GetToggleState(armlet) == false and Ability.IsCastable(duel, myMana) then
						Ability.Toggle(armlet)
						fooAllInOne.lastTick = os.clock()
						return
					end
					if pressTheAttack and Ability.IsCastable(pressTheAttack, myMana) then
						Ability.CastTarget(pressTheAttack, myHero)
						fooAllInOne.lastTick = os.clock()
						return
					end
					if fooAllInOne.SleepReady(Ability.GetCastPoint(pressTheAttack)) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
						return
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				if fooAllInOne.SleepReady(0.1) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		else
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				if fooAllInOne.SleepReady(0.1) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0, 0, 0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.lastTick = os.clock()
					return
				end
			else	
				if Blademail and Ability.IsCastable(Blademail, myMana) and Ability.IsCastable(duel, myMana) then
					Ability.CastNoTarget(Blademail)
					return
				end
				if fooAllInOne.SleepReady(0.6) and armlet and Ability.GetToggleState(armlet) == false and Ability.IsCastable(duel, myMana) then
					Ability.Toggle(armlet)
					fooAllInOne.lastTick = os.clock()
					return
				end
				if pressTheAttack and Ability.IsCastable(pressTheAttack, myMana) then
					Ability.CastTarget(pressTheAttack, myHero)
					fooAllInOne.lastTick = os.clock()
					return
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(pressTheAttack)) then
					if NPC.IsLinkensProtected(enemy) then
						if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
							Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
							return
						end
					else
						if duel and Ability.IsCastable(duel, myMana) then
							Ability.CastTarget(duel, enemy)
							return
						end
					end
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

	local duelDuration = 0
		if NPC.HasItem(myHero, "item_ultimate_scepter", true) or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
			if duel and Ability.GetLevel(duel) > 0 then
				duelDuration = Ability.GetLevelSpecialValueForFloat(duel, "duration_scepter")
			end
		else
			if duel and Ability.GetLevel(duel) > 0 then
				duelDuration = Ability.GetLevelSpecialValueForFloat(duel, "duration")
			end
		end
	
	if duel and armlet and Menu.IsEnabled(fooAllInOne.optionHeroLegionArmletOff) then
		if Ability.SecondsSinceLastUse(duel) > 0 and Ability.SecondsSinceLastUse(duel) < duelDuration + 3 then
			if Entity.GetHealth(myHero) >= 0.30 * Entity.GetMaxHealth(myHero) then
				if #Entity.GetHeroesInRadius(myHero, 700, Enum.TeamType.TEAM_ENEMY) < 1 then
					if fooAllInOne.SleepReady(0.6) and Ability.GetToggleState(armlet) == true and not NPC.HasModifier(myHero, "modifier_legion_commander_duel") then
						Ability.Toggle(armlet)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroLegionAutoSave) then
		fooAllInOne.LegionSaveAlly(myHero, myMana, pressTheAttack)
	end	

end

function fooAllInOne.LegionSaveAlly(myHero, myMana, pressTheAttack)

	if not myHero then return end
	if not pressTheAttack then return end
		if not Ability.IsCastable(pressTheAttack, myMana) then return end

	if fooAllInOne.heroCanCastItems(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	local teamMatesAround = NPC.GetHeroesInRadius(myHero, 690, Enum.TeamType.TEAM_FRIEND)
	if next(teamMatesAround) ~= nil then
		for _, ally in ipairs(teamMatesAround) do
			if ally and Entity.IsHero(ally) and not NPC.IsIllusion(ally) and Entity.IsAlive(ally) then
				if fooAllInOne.IsNPCinDanger(myHero, ally) then
					Ability.CastTarget(pressTheAttack, ally)
					break
					return
				end
			end
		end
	end

end

function fooAllInOne.SlardarCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSlardar) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local sprint = NPC.GetAbilityByIndex(myHero, 0)
	local crush = NPC.GetAbilityByIndex(myHero, 1)
	local haze = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local crushRadius = 300
		if NPC.IsRunning(enemy) then
			crushRadius = 200
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, crushRadius) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1150) then
					if Menu.GetValue(fooAllInOne.optionHeroSlardarStyle) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
						return
					else
						Ability.CastPosition(blink, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 350, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 330))
						return
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				if fooAllInOne.SleepReady(0.1) then
					Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		else
			
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
				if fooAllInOne.SleepReady(0.1) then
					Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
					fooAllInOne.lastTick = os.clock()
					return
				end
			else
				
				if crush and Ability.IsCastable(crush, myMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastNoTarget(crush)
					fooAllInOne.lastTick = os.clock()
					return
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(crush)) and NPC.IsLinkensProtected(enemy) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
						return
					end
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(crush)) and haze and Ability.IsCastable(haze, myMana) and NPC.HasModifier(enemy, "modifier_stunned") then
					Ability.CastTarget(haze, enemy)
					return
				end
				if not NPC.IsStunned(enemy) and not Ability.IsReady(crush) then
					if NPC.GetMoveSpeed(enemy) + 20 > NPC.GetMoveSpeed(myHero) then
						if sprint and Ability.IsCastable(sprint, myMana) then
							Ability.CastNoTarget(sprint)
							return
						end
					end
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
end

function fooAllInOne.ClinkzCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkz) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local strafe = NPC.GetAbilityByIndex(myHero, 0)
	local searingArrows = NPC.GetAbilityByIndex(myHero, 1)
	local skeletonWalk = NPC.GetAbilityByIndex(myHero, 2)
	local deathPact = NPC.GetAbilityByIndex(myHero, 3)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)
	
	local clinkzAttackRange = NPC.GetAttackRange(myHero)
		if NPC.HasModifier(myHero, "modifier_item_dragon_lance") or NPC.HasItem(myHero, "item_hurricane_pike", true) then
			clinkzAttackRange = clinkzAttackRange + 140
		end

	if Menu.IsKeyDown(fooAllInOne.optionHeroClinkzHarassKey) then
		fooAllInOne.ClinkzAutoHarass(myHero, myMana, clinkzAttackRange, searingArrows)
		Engine.ExecuteCommand("dota_range_display " .. clinkzAttackRange)
	else
		Engine.ExecuteCommand("dota_range_display 0")
	end
	
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if NPC.IsEntityInRange(myHero, enemy, clinkzAttackRange) then
			if strafe and Ability.IsCastable(strafe, myMana) and fooAllInOne.heroCanCastSpells(myHero) == true then
				Ability.CastNoTarget(strafe)
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end					
end

function fooAllInOne.ClinkzAutoHarass(myHero, myMana, clinkzAttackRange, searingArrows)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkzHarass) then return end

	if not searingArrows then return end
		if Ability.GetLevel(searingArrows) < 1 then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	for _, hero in ipairs(NPC.GetHeroesInRadius(myHero, clinkzAttackRange, Enum.TeamType.TEAM_ENEMY)) do
		if hero and Entity.IsHero(hero) and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) then 
			if Entity.IsAlive(hero) then
        			Ability.CastTarget(searingArrows, hero)
				break
        			return
			end
      		end		
	end

end

function fooAllInOne.ClinkzAutoUlt(myHero)

	if not myHero then return end

	if not Menu.IsEnabled(fooAllInOne.optionHeroClinkz) then return end
	if (os.clock() - fooAllInOne.lastTick) < fooAllInOne.delay then return end

	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	
	local myMana = NPC.GetMana(myHero)

	local deathPact = NPC.GetAbilityByIndex(myHero, 3)
		if not deathPact then return end
		if not Ability.IsCastable(deathPact, myMana) then return end

	local maxHPcreep
	local maxHP = 0
	for _, creeps in ipairs(NPC.GetUnitsInRadius(myHero, 380, Enum.TeamType.TEAM_ENEMY)) do
		if creeps then
			if Entity.IsHero(creeps) then 
				return 
			end
      			if fooAllInOne.IsCreepAncient(creeps) == false and (NPC.IsCreep(creeps) or NPC.IsLaneCreep(creeps)) and Entity.GetMaxHealth(creeps) >= 550 and Entity.GetHealth(creeps) >= maxHP then
           			maxHPcreep = creeps
            			maxHP = Entity.GetMaxHealth(creeps)
        		end
   		end
	end

	if next(NPC.GetUnitsInRadius(myHero, 380, Enum.TeamType.TEAM_ENEMY)) == nil then
		maxHP = 0
	end

	if maxHPcreep then
		if not NPC.HasModifier(myHero, "modifier_clinkz_death_pact") then
			Ability.CastTarget(deathPact, maxHPcreep)
			fooAllInOne.makeDelay(Ability.GetCastPoint(deathPact))
			return
		end
	end

end

function fooAllInOne.QoPCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroQoP) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local shadowStrike = NPC.GetAbilityByIndex(myHero, 0)
	local qopBlink = NPC.GetAbilityByIndex(myHero, 1)
	local screamOfPain = NPC.GetAbilityByIndex(myHero, 2)
	local sonicWave = NPC.GetAbilityByIndex(myHero, 3)

	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.GetValue(fooAllInOne.optionHeroQoPAutoUlt) > 0 then
		fooAllInOne.QoPComboUltKS(myHero, sonicWave, aghanims, myMana)
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 425) then
			if Menu.IsEnabled(fooAllInOne.optionHeroQoPblink) then
				if qopBlink and Ability.IsCastable(qopBlink, myMana) and NPC.IsEntityInRange(myHero, enemy, 1500) then
					Ability.CastPosition(qopBlink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(350)))
					fooAllInOne.lastTick = os.clock()
					return
				end
			end		
		else
			if NPC.IsEntityInRange(myHero, enemy, Ability.GetCastRange(shadowStrike) + NPC.GetCastRangeBonus(myHero)) then
				if fooAllInOne.SleepReady(0.1) and shadowStrike and Ability.IsCastable(shadowStrike, myMana) then
					Ability.CastTarget(shadowStrike, enemy)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
			if fooAllInOne.SleepReady(0.1) and screamOfPain and Ability.IsCastable(screamOfPain, myMana) then
				Ability.CastNoTarget(screamOfPain)
				return
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

end

function fooAllInOne.QoPComboUltKS(myHero, sonicWave, aghanims, myMana)

	if not myHero then return end

	if not sonicWave then return end
		if not Ability.IsCastable(sonicWave, myMana) then return end

	if Menu.GetValue(fooAllInOne.optionHeroQoPAutoUlt) == 0	then return end

	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end

	for _, hero in ipairs(Entity.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)) do
		local target = fooAllInOne.targetChecker(hero)
		if target then
			if NPC.GetUnitName(target) == "npc_dota_hero_skeleton_king" then
				local reincarnation = NPC.GetAbility(target, "skeleton_king_reincarnation")
				if reincarnation and Ability.IsReady(reincarnation) then
					break
					return
				end
			end

			local sonicDamage
			if aghanims or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
				sonicDamage = Ability.GetLevelSpecialValueFor(sonicWave, "damage_scepter")
			else
				sonicDamage = Ability.GetLevelSpecialValueFor(sonicWave, "damage")
			end
			if Menu.GetValue(fooAllInOne.optionHeroQoPAutoUlt) == 1 then
				if aghanims or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
					if Entity.GetHealth(target) <= sonicDamage then
						Ability.CastPosition(sonicWave, (Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(600)))
						break
						return
					end
				end
			elseif Menu.GetValue(fooAllInOne.optionHeroQoPAutoUlt) == 2 then
				if Entity.GetHealth(target) <= sonicDamage then
					Ability.CastPosition(sonicWave, (Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(600)))
					break
					return
				end
			end
		end
	end

end

function fooAllInOne.SvenCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroSven) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local stormHammer = NPC.GetAbilityByIndex(myHero, 0)
	local warCry = NPC.GetAbilityByIndex(myHero, 2)
	local godsStrength = NPC.GetAbilityByIndex(myHero, 3)

	local blink = NPC.GetItem(myHero, "item_blink", true)
	local maskOfMadness = NPC.GetItem(myHero, "item_mask_of_madness", true)

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 then
		if not NPC.IsEntityInRange(myHero, enemy, 450) then
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1150) and fooAllInOne.heroCanCastSpells(myHero) == true then
					if warCry and Ability.IsCastable(warCry, myMana) then
						Ability.CastNoTarget(warCry)
						return
					end
					if godsStrength and Ability.IsCastable(godsStrength, myMana) then
						Ability.CastNoTarget(godsStrength)
						fooAllInOne.lastTick = os.clock()
						return
					end
					if fooAllInOne.SleepReady(0.05) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy))
						return
					end
				end
			end
			if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") and fooAllInOne.heroCanCastSpells(myHero) == true then
				if fooAllInOne.SleepReady(0.1) then
					Player.AttackTarget(Players.GetLocal(), myHero, enemy, false)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		else
			if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				
				if NPC.IsLinkensProtected(enemy) then
					if fooAllInOne.LinkensBreakerNew(myHero) ~= nil then
						Ability.CastTarget(NPC.GetItem(myHero, fooAllInOne.LinkensBreakerNew(myHero), true), enemy)
						return
					end
				end
				if stormHammer and Ability.IsCastable(stormHammer, myMana) and not (NPC.IsLinkensProtected(enemy) or NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE)) and fooAllInOne.heroCanCastSpells(myHero) == true then
					Ability.CastTarget(stormHammer, enemy)
					fooAllInOne.lastTick = os.clock()
					return
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(stormHammer)) and warCry and Ability.IsCastable(warCry, myMana) and fooAllInOne.heroCanCastSpells(myHero) == true then
					Ability.CastNoTarget(warCry)
					return
				end
				if fooAllInOne.SleepReady(Ability.GetCastPoint(stormHammer)) and godsStrength and Ability.IsCastable(godsStrength, myMana) and fooAllInOne.heroCanCastSpells(myHero) == true then
					Ability.CastNoTarget(godsStrength)
					fooAllInOne.lastTick = os.clock()
					return
				end
				if not (Ability.IsCastable(stormHammer, myMana) and Ability.IsCastable(warCry, myMana) and Ability.IsCastable(godsStrength, myMana)) then
					if fooAllInOne.SleepReady(0.4) and maskOfMadness and Ability.IsCastable(maskOfMadness, myMana) then
						Ability.CastNoTarget(maskOfMadness)
						return
					end
				end
			end
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end

end

function fooAllInOne.VisageCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroVisage) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local graveChill = NPC.GetAbilityByIndex(myHero, 0)
	local soulAssumption = NPC.GetAbilityByIndex(myHero, 1)
	local soulMaxStacks = Ability.GetLevelSpecialValueFor(soulAssumption, "stack_limit")
	local myMana = NPC.GetMana(myHero)

	local soulModifier = NPC.GetModifier(myHero, "modifier_visage_soul_assumption")
	local soulStackCounter 
		if soulModifier then
			soulStackCounter = Modifier.GetStackCount(soulModifier)
		end
	
	local familiars = NPC.GetAbilityByIndex(myHero, 3)
	local familiarsLevel = Ability.GetLevel(familiars)

	if Menu.IsKeyDown(fooAllInOne.optionHeroVisageInstStunKey) then
		if fooAllInOne.VisageInstStunLockTarget == nil then
			if enemy and NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then
				fooAllInOne.VisageInstStunLockTarget = enemy
			else
				fooAllInOne.VisageInstStunLockTarget = nil
			end
		end
	else
		fooAllInOne.VisageInstStunLockTarget = nil
	end

	local familiarEntityTable = {}
	for i = 1, NPCs.Count() do
	local npc = NPCs.Get(i)
		if familiars then
			if npc and npc ~= myHero and Entity.IsSameTeam(myHero, npc) then
				if (Entity.GetOwner(myHero) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, myHero)) then
					if NPC.GetUnitName(npc) == "npc_dota_visage_familiar" .. familiarsLevel then
						if not (NPC.HasModifier(npc, "modifier_visage_summonfamiliars_timer") or NPC.HasModifier(npc, "modifier_rooted")) then
							if Entity.IsAlive(npc) then
								if npc ~= nil then
									table.insert(familiarEntityTable, npc)
								end
							end
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroVisageKS) then
		fooAllInOne.VisageSoulAssumptionKS(myHero, myMana, soulAssumption, soulStackCounter)
	end

	if not Menu.IsKeyDown(fooAllInOne.optionHeroVisagePanicKey) then
		fooAllInOne.VisagePanicTarget = nil
	end

	if next(familiarEntityTable) ~= nil then

		for _, familiarAttack in ipairs(familiarEntityTable) do
			if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
				if familiarAttack and not NPC.IsEntityInRange(familiarAttack, enemy, NPC.GetAttackRange(familiarAttack)) then
					fooAllInOne.GenericAttackIssuer2("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, familiarAttack)
				end
			end
			if Menu.IsKeyDown(fooAllInOne.optionHeroVisageInstStunKey) then
				if familiarAttack and not NPC.IsEntityInRange(familiarAttack, enemy, NPC.GetAttackRange(familiarAttack)) then
					fooAllInOne.GenericAttackIssuer2("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", fooAllInOne.VisageInstStunLockTarget, nil, familiarAttack)
				end
			end
		end

		for _, familiarStun in ipairs(familiarEntityTable) do
			if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
				if familiarStun and (os.clock() - fooAllInOne.ControlledUnitCastTime) >= (Ability.GetLevelSpecialValueForFloat(NPC.GetAbilityByIndex(familiarStun, 0), "stun_duration") - 0.1 - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
					fooAllInOne.VisageFamiliarControl(myHero, enemy, familiarStun, soulAssumption, soulMaxStacks, soulStackCounter, NPC.GetAbilityByIndex(familiarStun, 0), myMana)
					break
				end
			end
			if Menu.IsKeyDown(fooAllInOne.optionHeroVisageInstStunKey) then
				if familiarStun and (os.clock() - fooAllInOne.ControlledUnitCastTime) >= (Ability.GetLevelSpecialValueForFloat(NPC.GetAbilityByIndex(familiarStun, 0), "stun_duration") - 0.1 - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)) then
					fooAllInOne.VisageFamiliarInstantStun(myHero, fooAllInOne.VisageInstStunLockTarget, familiarStun, NPC.GetAbilityByIndex(familiarStun, 0), myMana)
					break
				end
			end

		end

		for _, familiarSave in ipairs(familiarEntityTable) do
			if Menu.IsEnabled(fooAllInOne.optionHeroVisageFamiliarSave) then
				if familiarSave and Entity.GetHealth(familiarSave) < 0.5 * Entity.GetMaxHealth(familiarSave) then
					fooAllInOne.VisageFamiliarAutoSaver(myHero, familiarSave, NPC.GetAbilityByIndex(familiarSave, 0))
					break
					return
				end
			end
		end	

		for _, familiarCancel in ipairs(familiarEntityTable) do
			if Menu.IsEnabled(fooAllInOne.optionHeroVisageFamiliarCancel) then
				if familiarCancel and (os.clock() - fooAllInOne.ControlledUnitCastTime) >= (Ability.GetLevelSpecialValueForFloat(NPC.GetAbilityByIndex(familiarCancel, 0), "stun_duration")) then
					fooAllInOne.VisageFamiliarCancelChannelling(myHero, familiarCancel, NPC.GetAbilityByIndex(familiarCancel, 0))
					break
					return
				end
			end
		end	
		
		for _, familiarPanic in pairs(familiarEntityTable) do
			if Menu.IsKeyDown(fooAllInOne.optionHeroVisagePanicKey) then
				if familiarPanic then
					fooAllInOne.VisageFamiliarPanicStun(myHero, familiarPanic, NPC.GetAbilityByIndex(familiarPanic, 0))
				end
			end
		end

	end
	

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
			if graveChill and Ability.IsCastable(graveChill, myMana) then
				Ability.CastTarget(graveChill, enemy)
				fooAllInOne.lastTick = os.clock()
			end
			if fooAllInOne.SleepReady(Ability.GetCastPoint(graveChill)) and soulAssumption and Ability.IsCastable(soulAssumption, myMana) then
				if soulMaxStacks <= soulStackCounter then
					Ability.CastTarget(soulAssumption, enemy)
				end
			end
			if not Ability.IsReady(graveChill) then
				if not Ability.IsReady(soulAssumption) or soulStackCounter < soulMaxStacks then
					if fooAllInOne.SleepReady(0.2) then
						Player.AttackTarget(Players.GetLocal(), myHero, enemy)
						fooAllInOne.lastTick = os.clock()
					end
				end
			end	
		end
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
end

function fooAllInOne.VisageFamiliarControl(myHero, enemy, familiarEntity, soulAssumption, soulMaxStacks, soulStackCounter, stoneForm, myMana)

	if not familiarEntity then return end
	if not Entity.IsAlive(familiarEntity) then return end

	local familiarDMGmod = NPC.GetModifier(familiarEntity, "modifier_visage_summon_familiars_damage_charge")
	local familiarDMGcharges 
		if familiarDMGmod then
			familiarDMGcharges  = Modifier.GetStackCount(familiarDMGmod)
		end

	local stunRange = 250
		if NPC.IsRunning(enemy) then
			stunRange = 75
		end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			if stoneForm and Ability.IsReady(stoneForm) then
				if familiarDMGcharges < Menu.GetValue(fooAllInOne.optionHeroVisageDMGStacks) then
					if not NPC.HasModifier(enemy, "modifier_rooted") or not NPC.HasModifier(enemy, "modifier_sheepstick_debuff") then
						if NPC.IsEntityInRange(familiarEntity, enemy, stunRange) then
							fooAllInOne.ControlledUnitCastTime = os.clock()
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, enemy, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
							return
						else
							if os.clock() - fooAllInOne.lastCastTime2 > 0.1 then
								Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(75), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
								fooAllInOne.lastCastTime2 = os.clock()
								return
							end
						end
					end
				end
			end
		if soulAssumption and Ability.IsCastable(soulAssumption, myMana) and NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)-50) then
			if soulMaxStacks <= soulStackCounter then
				Ability.CastTarget(soulAssumption, enemy)
			end
		end
	end
end

function fooAllInOne.VisageFamiliarInstantStun(myHero, enemy, familiarEntity, stoneForm, myMana)

	if not myHero then return end
	if not enemy then return end

	if not familiarEntity then return end
	if not Entity.IsAlive(familiarEntity) then return end

	if not stoneForm then return end
		if not Ability.IsReady(stoneForm) then return end

	local stunRange = 250
		if NPC.IsRunning(enemy) then
			stunRange = 75
		end

	if Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
		if stoneForm and Ability.IsReady(stoneForm) then
			if not NPC.HasModifier(enemy, "modifier_rooted") or not NPC.HasModifier(enemy, "modifier_sheepstick_debuff") then
				if not NPC.IsEntityInRange(familiarEntity, enemy, stunRange) then
					if os.clock() - fooAllInOne.lastCastTime2 > 0.1 then
						NPC.MoveTo(familiarEntity, Entity.GetAbsOrigin(enemy) + Entity.GetRotation(enemy):GetForward():Normalized():Scaled(75), false, false)
						fooAllInOne.lastCastTime2 = os.clock()
						return
					end
				else
					fooAllInOne.ControlledUnitCastTime = os.clock()
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, enemy, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
					return
				end
			end
		end
	end

end

function fooAllInOne.VisageFamiliarPanicStun(myHero, familiarEntity, stoneForm)

	if not myHero then return end
	if not familiarEntity then return end

	if not stoneForm then return end

	for _, hero in ipairs(Entity.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)) do
		local target = fooAllInOne.targetChecker(hero)
		if target and Entity.IsAlive(target) and not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			if fooAllInOne.VisagePanicTarget == nil or (fooAllInOne.VisagePanicTarget ~= nil and NPC.GetUnitName(target) ~= fooAllInOne.VisagePanicTarget) and not NPC.IsStunned(target) then

				if stoneForm and Ability.IsReady(stoneForm) then
					if not NPC.HasModifier(target, "modifier_rooted") or not NPC.HasModifier(target, "modifier_sheepstick_debuff") then
					local stunRange = 250
						if NPC.IsRunning(target) then
							stunRange = 75
						end
						if not NPC.IsEntityInRange(familiarEntity, target, stunRange) then
							fooAllInOne.GenericAttackIssuer2("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", target, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(75), familiarEntity)
							return
						else
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET, myHero, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
							fooAllInOne.VisagePanicTarget = NPC.GetUnitName(target)
							return
						end
					end
				end
			end
		end
	end

	if not Ability.IsReady(stoneForm) and not NPC.HasModifier(familiarEntity, "modifier_rooted") then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET, myHero, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
	end
	
end

function fooAllInOne.VisageSoulAssumptionKS(myHero, myMana, soulAssumption, soulStackCounter)

	if not myHero then return end

	if not soulAssumption then return end
		if not Ability.IsCastable(soulAssumption, myMana) then return end

	if not soulStackCounter then return end
	if soulStackCounter <= 1 then return end

	local soulAssumptionDMG = (20 + soulStackCounter * 65) * (1 + (Hero.GetIntellectTotal(myHero) / 14 / 100))

	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end

	for _, hero in ipairs(Entity.GetHeroesInRadius(myHero, Ability.GetCastRange(soulAssumption) - 15, Enum.TeamType.TEAM_ENEMY)) do
		local target = fooAllInOne.targetChecker(hero)
		if target and Entity.IsAlive(target) and not NPC.IsLinkensProtected(target) and not NPC.HasState(target, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			if Entity.GetHealth(target) <= soulAssumptionDMG * (1 - NPC.GetMagicalArmorValue(target)) then
				Ability.CastTarget(soulAssumption, target)
				break
				return
			end
		end
	end

end

function fooAllInOne.VisageFamiliarAutoSaver(myHero, familiarEntity, stoneForm)

	if not myHero then return end
	if not familiarEntity then return end
	if not Entity.IsAlive(familiarEntity) then return end

	if not stoneForm then return end
		if not Ability.IsReady(stoneForm) then return end

	 if Entity.GetHealth(familiarEntity) < Entity.GetMaxHealth(familiarEntity) * 0.33 then
	 	if stoneForm and Ability.IsReady(stoneForm) and not Ability.IsInAbilityPhase(stoneForm) and not NPC.IsStunned(familiarEntity) and not NPC.IsSilenced(familiarEntity) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET, myHero, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity, true)
			return
		end
	end	

end

function fooAllInOne.VisageFamiliarCancelChannelling(myHero, familiarEntity, stoneForm)

	if not myHero then return end
	if not familiarEntity then return end
	if not Entity.IsAlive(familiarEntity) then return end

	if not stoneForm then return end
		if not Ability.IsReady(stoneForm) then return end

	local channellingTable = {
		npc_dota_hero_bane = { "bane_fiends_grip", { 5, 5, 5 } },
		npc_dota_hero_crystal_maiden = { "crystal_maiden_freezing_field", { 10, 10, 10} },
		npc_dota_hero_enigma = { "enigma_black_hole", { 4, 4, 4 } },
		npc_dota_hero_oracle = { "oracle_fortunes_end", { 2.5, 2.5, 2.5, 2.5 } },
		npc_dota_hero_pudge = { "pudge_dismember", { 3, 3, 3 } },
		npc_dota_hero_pugna = { "pugna_life_drain", { 10, 10, 10 } },
		npc_dota_hero_sand_king = { "sandking_epicenter", { 2, 2, 2} },
		npc_dota_hero_shadow_shaman = { "shadow_shaman_shackles", { 2.75, 3.5, 4.25, 5 } },
		npc_dota_hero_tinker = { "tinker_rearm", { 3, 1.5, 0.75 } },
		npc_dota_hero_warlock = { "warlock_upheaval", { 16, 16, 16, 16 } },
		npc_dota_hero_witch_doctor = { "witch_doctor_death_ward", { 8, 8, 8} }
				}
	
	local stunRange = 300

	local cancelEnemies = NPC.GetHeroesInRadius(myHero, 1000, Enum.TeamType.TEAM_ENEMY)
	for _, cancelEnemy in ipairs(cancelEnemies) do
		if cancelEnemy and not NPC.IsDormant(cancelEnemy) and not NPC.IsIllusion(cancelEnemy) and Entity.IsAlive(cancelEnemy) then
			if not NPC.HasState(cancelEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				for i, v in pairs(channellingTable) do
					if (NPC.GetUnitName(cancelEnemy) == i and Ability.IsChannelling(NPC.GetAbility(cancelEnemy, v[1]))) then
						local channellingStartTime = Ability.GetChannelStartTime(NPC.GetAbility(cancelEnemy, v[1]))
						local channellingEndTime = channellingStartTime + v[2][Ability.GetLevel(NPC.GetAbility(cancelEnemy, v[1]))]
						local disToEnemy = (Entity.GetAbsOrigin(familiarEntity) - Entity.GetAbsOrigin(cancelEnemy)):Length2D() - 250
						local timeToStun = (disToEnemy / 430) + 0.6
						if stoneForm and Ability.IsReady(stoneForm) then
							if GameRules.GetGameTime() < channellingEndTime - timeToStun then
								if not NPC.IsEntityInRange(familiarEntity, cancelEnemy, stunRange) then
									if os.clock() - fooAllInOne.lastCastTime2 > 0.1 then
										NPC.MoveTo(familiarEntity, Entity.GetAbsOrigin(cancelEnemy), false, false)
										fooAllInOne.lastCastTime2 = os.clock()
										return
									end
								else
									fooAllInOne.ControlledUnitCastTime = os.clock()
									Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
									break
									return
								end
							end
						end
					elseif NPC.HasModifier(cancelEnemy, "modifier_teleporting") then
						local teleportCreationTime = Modifier.GetCreationTime(NPC.GetModifier(cancelEnemy, "modifier_teleporting"))
						local teleportEndTime = teleportCreationTime + 3
						local disToEnemy = (Entity.GetAbsOrigin(familiarEntity) - Entity.GetAbsOrigin(cancelEnemy)):Length2D() - 250
						local timeToStun = (disToEnemy / 430) + 0.6
						if stoneForm and Ability.IsReady(stoneForm) then
							if GameRules.GetGameTime() < teleportEndTime - timeToStun then
								if not NPC.IsEntityInRange(familiarEntity, cancelEnemy, stunRange) then
									if os.clock() - fooAllInOne.lastCastTime2 > 0.1 then
										NPC.MoveTo(familiarEntity, Entity.GetAbsOrigin(cancelEnemy), false, false)
										fooAllInOne.lastCastTime2 = os.clock()
										return
									end
								else
									fooAllInOne.ControlledUnitCastTime = os.clock()
									Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), stoneForm, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, familiarEntity)
									break
									return
								end
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.ArcWardenCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroArcWarden) then return end

	local flux = NPC.GetAbilityByIndex(myHero, 0)
	local magneticField = NPC.GetAbilityByIndex(myHero, 1)
	local sparkWraith = NPC.GetAbilityByIndex(myHero, 2)
	local tempestDouble = NPC.GetAbilityByIndex(myHero, 3)

	local dragonLance = NPC.GetItem(myHero, "item_dragon_lance", true)
	local hurricanePike = NPC.GetItem(myHero, "item_hurricane_pike", true)
	local arcWardenAttackRange = NPC.GetAttackRange(myHero)
	if dragonLance or hurricanePike then
		arcWardenAttackRange = NPC.GetAttackRange(myHero) + 140
	end

	local myMana = NPC.GetMana(myHero)
	
	for i = 1, NPCs.Count() do
        local npc = NPCs.Get(i)
		if tempestDouble then
			if npc and npc ~= myHero then
				if NPC.GetUnitName(npc) == "npc_dota_hero_arc_warden" then
					if NPC.HasModifier(npc, "modifier_arc_warden_tempest_double") then
						if npc ~= nil then
							if Entity.IsAlive(npc) then
								fooAllInOne.TempestDoubleHandler(myHero, enemy, npc, tempestDouble, myMana, arcWardenAttackRange)
							end
						end
					end
				end
			end
		end
	end

	local necronomicon = NPC.GetItem(myHero, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(myHero, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	fooAllInOne.itemUsage(myHero, enemy)
	
	if Menu.IsKeyDown(fooAllInOne.optionArcWardenTempestKey) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if tempestDouble and Ability.IsCastable(tempestDouble, myMana) then
			Ability.CastNoTarget(tempestDouble)
			return
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenTempest) then
		if Menu.IsKeyDown(fooAllInOne.optionArcWardenPushKey) and fooAllInOne.heroCanCastSpells(myHero) == true then
			if fooAllInOne.ArcWardenPort(myHero) ~= nil then
				if tempestDouble and Ability.IsCastable(tempestDouble, myMana) then
					Ability.CastNoTarget(tempestDouble)
					return
				end
			end
		end
	end
	
	if enemy and NPC.IsEntityInRange(myHero, enemy, 1200) then
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and fooAllInOne.heroCanCastSpells(myHero) == true then
			if not NPC.IsEntityInRange(myHero, enemy, arcWardenAttackRange - 25) then
				if fooAllInOne.SleepReady(0.2) then
				--	if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
				--		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, NPC.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
				--		fooAllInOne.lastTick = os.clock()
				--	end
					if NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
					end
				end
			else
				if fooAllInOne.SleepReady(0.2) and NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk") then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
					fooAllInOne.noItemCastFor(0.3)
					fooAllInOne.lastTick = os.clock()
				end
				if not (NPC.HasModifier(myHero, "modifier_item_invisibility_edge_windwalk") or NPC.HasModifier(myHero, "modifier_item_silver_edge_windwalk")) then
					
					if tempestDouble and Ability.IsCastable(tempestDouble, myMana) then
						Ability.CastNoTarget(tempestDouble)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
				
					if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenFlux) and fooAllInOne.SleepReady(0.2) and flux and Ability.IsCastable(flux, myMana) and #NPC.GetHeroesInRadius(enemy, 225, Enum.TeamType.TEAM_FRIEND) < 1 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						Ability.CastTarget(flux, enemy)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
					
					if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenMagnetic) and fooAllInOne.SleepReady(0.2) and magneticField and Ability.IsCastable(magneticField, myMana) and not NPC.HasModifier(myHero, "modifier_arc_warden_magnetic_field") then
						Ability.CastPosition(magneticField, Entity.GetAbsOrigin(myHero))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
					if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenSpark) and fooAllInOne.SleepReady(0.2) and sparkWraith and Ability.IsCastable(sparkWraith, myMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
						local sparkPrediction = 2.3 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
						Ability.CastPosition(sparkWraith, fooAllInOne.castPrediction(myHero, enemy, sparkPrediction))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.3)
						return
					end
					if necronomicon and Ability.IsCastable(necronomicon, myMana) then
						Ability.CastNoTarget(necronomicon)
					end
					for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, myHero)) do
						fooAllInOne.NecronomiconController(necro, enemy, nil)
					end
					if #fooAllInOne.GetIllusionEntityTable(myHero, myHero) > 0 then
						fooAllInOne.MantaIlluController(enemy, nil, myHero, myHero)
					end
				end
			end
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)	
		end
	end	
end

function fooAllInOne.TempestDoubleHandler(myHero, enemy, tempestDoubleEntity, tempestDouble, myMana, arcWardenAttackRange)
	
	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end
	if os.clock() - fooAllInOne.ControlledUnitPauseTime < 3.1 then return end

	if tempestDoubleEntity then
		fooAllInOne.ArcWardenEntity = tempestDoubleEntity
	end

	if fooAllInOne.heroCanCastSpells(tempestDoubleEntity) == false then return end

	local travelBoots1 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots", true)
	local travelBoots2 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots_2", true)
	local wardenMana = NPC.GetMana(tempestDoubleEntity)

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		if enemy and Entity.GetHealth(enemy) > 0 then
			fooAllInOne.ArcWardenFight(myHero, enemy, tempestDoubleEntity, arcWardenAttackRange)
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionArcWardenTempestKey) then
		fooAllInOne.ArcWardenDoubleCombo(myHero, tempestDoubleEntity, enemy, arcWardenAttackRange)
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenTempest) then
		if Menu.IsKeyDown(fooAllInOne.optionArcWardenPushKey) then
			if fooAllInOne.ArcWardenPort(myHero) ~= nil then
				if travelBoots1 and Ability.IsCastable(travelBoots1, wardenMana) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.ArcWardenPort(myHero), travelBoots1, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
					fooAllInOne.ControlledUnitPauseTime = os.clock()
					return
				end
				if travelBoots2 and Ability.IsCastable(travelBoots2, wardenMana) then
					Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.ArcWardenPort(myHero), travelBoots2, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
					fooAllInOne.ControlledUnitPauseTime = os.clock()
					return
				end
			end
		end
	end
			
	if not Menu.IsKeyDown(fooAllInOne.optionArcWardenTempestKey) then
		if not NPC.HasModifier(tempestDoubleEntity ,"modifier_teleporting") then
			if NPC.HasItem(myHero, "item_travel_boots", true) or NPC.HasItem(myHero, "item_travel_boots_2", true) then
				if not ((travelBoots1 and Ability.IsReady(travelBoots1)) or (travelBoots2 and Ability.IsReady(travelBoots2))) then
					fooAllInOne.ArcWardenTPPush(myHero, tempestDoubleEntity, arcWardenAttackRange)
				end
			end
		end
	end

	if not NPC.HasModifier(tempestDoubleEntity ,"modifier_teleporting") then
		if not Menu.IsKeyDown(fooAllInOne.optionArcWardenPushKey) then
			fooAllInOne.utilityItemMidas(tempestDoubleEntity, NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true), 40)
		end
	end
end	

function fooAllInOne.ArcWardenFight(myHero, enemy, tempestDoubleEntity, arcWardenAttackRange)

	if not tempestDoubleEntity then return end
	if not enemy then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end

	if fooAllInOne.heroCanCastSpells(tempestDoubleEntity) == false then return end

	local flux = NPC.GetAbilityByIndex(tempestDoubleEntity, 0)
	local magneticField = NPC.GetAbilityByIndex(tempestDoubleEntity, 1)
	local sparkWraith = NPC.GetAbilityByIndex(tempestDoubleEntity, 2)

	local blink = NPC.GetItem(tempestDoubleEntity, "item_blink", true)
	local silverEdge = NPC.GetItem(tempestDoubleEntity, "item_silver_edge", true)
	local bkb = NPC.GetItem(tempestDoubleEntity, "item_black_king_bar", true)

	local diffusalBlade = NPC.GetItem(tempestDoubleEntity, "item_diffusal_blade", true)
	if not diffusalBlade then
		for i = 2, 2 do
			diffusalBlade = NPC.GetItem(tempestDoubleEntity, "item_diffusal_blade_" .. i, true)
			if diffusalBlade then 
				break 
			end
		end
	end

	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end	 

	local wardenMana = NPC.GetMana(tempestDoubleEntity)

	if silverEdge and Ability.IsCastable(silverEdge, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), silverEdge, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "silverEdge", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
		fooAllInOne.noItemCastFor(0.5)
	end

	fooAllInOne.itemUsage(tempestDoubleEntity, enemy)

	if not NPC.IsEntityInRange(tempestDoubleEntity, enemy, arcWardenAttackRange - 25) then
		if blink and Ability.IsReady(blink) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(250)), blink, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "blink", "DOTA_UNIT_ORDER_CAST_POSITION")
		end
		if not blink or (blink and not Ability.IsReady(blink)) then
			fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, NPC.GetAbsOrigin(enemy), tempestDoubleEntity)
		end
	else
		
		if NPC.HasModifier(tempestDoubleEntity, "modifier_item_silver_edge_windwalk") then
			fooAllInOne.noItemCastFor(0.3)
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, enemy, Vector(0,0,0), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "attack", "DOTA_UNIT_ORDER_ATTACK_TARGET")
			return
		end

		if  NPC.IsLinkensProtected(enemy) and (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(flux) and flux and Ability.IsCastable(flux, wardenMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, enemy, Vector(0,0,0), flux, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "flux", "DOTA_UNIT_ORDER_CAST_TARGET")
			return
		end			
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and diffusalBlade and Ability.IsReady(diffusalBlade) and Item.GetCurrentCharges(diffusalBlade) >= 1 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, enemy, Vector(0,0,0), diffusalBlade, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "diffusalBlade", "DOTA_UNIT_ORDER_CAST_TARGET")
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and necronomicon and Ability.IsCastable(necronomicon, wardenMana) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), necronomicon, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "necrobook", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and bkb and Ability.IsReady(bkb) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), bkb, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "bkb", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
		end		
	
		if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenFlux) and (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(flux) and flux and Ability.IsCastable(flux, wardenMana) and #NPC.GetHeroesInRadius(enemy, 225, Enum.TeamType.TEAM_FRIEND) < 1 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, enemy, Vector(0,0,0), flux, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "flux", "DOTA_UNIT_ORDER_CAST_TARGET")
			return
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(magneticField) and magneticField and Ability.IsCastable(magneticField, wardenMana) and not NPC.HasModifier(tempestDoubleEntity, "modifier_arc_warden_magnetic_field") and not Ability.IsInAbilityPhase(NPC.GetAbilityByIndex(myHero, 1)) then
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(tempestDoubleEntity) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(tempestDoubleEntity)):Normalized():Scaled(50), magneticField, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
			return
		end
		if Menu.IsEnabled(fooAllInOne.optionHeroArcWardenSpark) and (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(sparkWraith) and sparkWraith and Ability.IsCastable(sparkWraith, wardenMana) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
			local sparkPrediction = 2.3 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
			Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, fooAllInOne.castPrediction(tempestDoubleEntity, enemy, sparkPrediction), sparkWraith, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
			fooAllInOne.ControlledUnitCastTime = os.clock()
			fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "sparkWraith", "DOTA_UNIT_ORDER_CAST_POSITION")
			return
		end
		if (os.clock() - fooAllInOne.ControlledUnitCastTime) > 0.5 then
			fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, tempestDoubleEntity)
		end

		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, enemy, nil)
		end

		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(enemy, nil, myHero, tempestDoubleEntity)
		end
	end
end
	
function fooAllInOne.ArcWardenPort(myHero)

	if not Menu.IsEnabled(fooAllInOne.optionHeroArcWardenPush) then return end

	local enemyFountainPos = fooAllInOne.GetEnemyFountainPos(myHero)
	local myFountainPos = fooAllInOne.GetMyFountainPos(myHero)

	if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPStyle) == 1 then
		local targetCreep
		local maxDistance = 99999
		if NPC.HasItem(myHero, "item_travel_boots", true) or NPC.HasItem(myHero, "item_travel_boots_2", true) then
			for i = 1, NPCs.Count() do 
			local npc = NPCs.Get(i)
    				if npc and Entity.IsSameTeam(myHero, npc) and Entity.IsAlive(npc) and NPC.IsLaneCreep(npc) and NPC.IsRanged(npc) and not NPC.IsDormant(npc) and not NPC.IsWaitingToSpawn(npc) then
					if npc ~= nil then
						local creepPosition = Entity.GetAbsOrigin(npc)
						local distanceToMouse = (creepPosition - Input.GetWorldCursorPos()):Length2D()
						if distanceToMouse < maxDistance then
							targetCreep = npc
							maxDistance = distanceToMouse
						end
					end
				end
			end
		end

		if targetCreep == nil then
			maxDistance = 99999
		end

		if targetCreep then
			return Entity.GetAbsOrigin(targetCreep)
		end
	end	

	if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPStyle) == 0 then
		local targetCreep
		local pushDistance = 99999
		if NPC.HasItem(myHero, "item_travel_boots", true) or NPC.HasItem(myHero, "item_travel_boots_2", true) then
			for i = 1, NPCs.Count() do 
			local npc = NPCs.Get(i)
    				if npc and Entity.IsSameTeam(myHero, npc) and NPC.IsLaneCreep(npc) and NPC.IsRanged(npc) and not NPC.IsDormant(npc) and not NPC.IsWaitingToSpawn(npc) then
					if #NPC.GetUnitsInRadius(npc, 1200, Enum.TeamType.TEAM_ENEMY) >= 3 and #NPC.GetHeroesInRadius(npc, 900, Enum.TeamType.TEAM_ENEMY) <= 1  and #NPC.GetHeroesInRadius(npc, 1000, Enum.TeamType.TEAM_FRIEND) <= 1 then
						if (Entity.GetHealth(npc) / Entity.GetMaxHealth(npc)) >= 0.8 and #NPC.GetUnitsInRadius(npc, 500, Enum.TeamType.TEAM_FRIEND) >= 2 then	
							if npc ~= nil then
								if (Entity.GetAbsOrigin(npc) - Entity.GetAbsOrigin(myHero)):Length2D() > 3000 then
									if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPSelect) == 0 then
										if (Entity.GetAbsOrigin(npc) - enemyFountainPos):Length2D() < pushDistance then
											targetCreep = npc
											pushDistance = (Entity.GetAbsOrigin(npc) - enemyFountainPos):Length2D()
											break
										end
									end
									if Menu.GetValue(fooAllInOne.optionHeroArcWardenPushTPSelect) == 1 then
										if (Entity.GetAbsOrigin(npc) - myFountainPos):Length2D() < pushDistance then
											targetCreep = npc
											pushDistance = (Entity.GetAbsOrigin(npc) - myFountainPos):Length2D()
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end

		if targetCreep == nil then
			pushDistance = 99999
		end

		if targetCreep ~= nil then
			return Entity.GetAbsOrigin(targetCreep)
		end
	end
end

function fooAllInOne.ArcWardenDoubleCombo(myHero, tempestDoubleEntity, enemy, arcWardenAttackRange)

	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end

	local wardenMana = NPC.GetMana(tempestDoubleEntity)

	fooAllInOne.utilityItemMidas(tempestDoubleEntity, NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true), 40)

	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	local mjollnir = NPC.GetItem(tempestDoubleEntity, "item_mjollnir", true)

	if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and necronomicon and Ability.IsCastable(necronomicon, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), necronomicon, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.ControlledUnitCastTime = os.clock()
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "necronomicon", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
	end
	if NPC.HasModifier(tempestDoubleEntity, "modifier_kill") then
		local tempestDieTime = Modifier.GetDieTime(NPC.GetModifier(tempestDoubleEntity, "modifier_kill"))
		if tempestDieTime - GameRules.GetGameTime() < 2.5 then
			if mjollnir and Ability.IsCastable(mjollnir, wardenMana) then
				for _, allyCreep in ipairs(Entity.GetUnitsInRadius(tempestDoubleEntity, 825, Enum.TeamType.TEAM_FRIEND)) do
					if allyCreep and Entity.IsAlive(allyCreep) and NPC.IsLaneCreep(allyCreep) and not NPC.IsRanged(allyCreep) and Entity.GetHealth(allyCreep) > Entity.GetMaxHealth(allyCreep) * 0.6 then
						if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, allyCreep, Vector(0,0,0), mjollnir, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
							fooAllInOne.ControlledUnitCastTime = os.clock()
						end
					end
				end
			end
		end
	end

	local targetHero
	local enemyHeroHealth = 99999
	local targetCreep
	local enemyCreepHealth = 99999

	if enemy and NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 200, 0) then
		targetHero = enemy
	else targetHero = nil
	end
	if not targetHero then
		for i, heroes in ipairs(NPC.GetHeroesInRadius(tempestDoubleEntity, 1499, Enum.TeamType.TEAM_ENEMY)) do
			if heroes then
        			if Entity.IsAlive(heroes) and not Entity.IsDormant(heroes) and not NPC.IsIllusion(heroes) then
					if NPC.IsPositionInRange(heroes, Input.GetWorldCursorPos(), 200, 0) then
						targetHero = heroes
						enemyHeroHealth = 99999
					else
						if Entity.GetHealth(heroes) < enemyHeroHealth then
							targetHero = heroes
							enemyHeroHealth = Entity.GetHealth(heroes)
						end
					end
				end
			end
		end
		if #NPC.GetHeroesInRadius(tempestDoubleEntity, 1499, Enum.TeamType.TEAM_ENEMY) < 1 then
			for i = 1, NPCs.Count() do 
			local creeps = NPCs.Get(i)
				if creeps and Entity.IsNPC(creeps) and not Entity.IsSameTeam(myHero, creeps) then
					if NPC.IsEntityInRange(tempestDoubleEntity, creeps, 1499) then
						if Entity.IsAlive(creeps) and not Entity.IsDormant(creeps) and NPC.IsKillable(creeps) and not NPC.IsWaitingToSpawn(creeps) then
							if Entity.GetHealth(creeps) < enemyCreepHealth then
								if creeps ~= nil then
									targetCreep = creeps
									enemyCreepHealth = Entity.GetHealth(creeps)
								end
							end
						end
					end
				end
			end
		end
	end

	if #NPC.GetUnitsInRadius(tempestDoubleEntity, 1500, Enum.TeamType.TEAM_ENEMY) < 1 then
		targetHero = nil
		enemyHeroHealth = 99999
		targetCreep = nil
		enemyCreepHealth = 99999
	end

	if targetHero then
		targetCreep = nil
		enemyCreepHealth = 99999
	end
	
	if targetHero then
		fooAllInOne.ArcWardenFight(myHero, targetHero, tempestDoubleEntity, arcWardenAttackRange)
		if not NPC.IsLinkensProtected(targetHero) then
			fooAllInOne.itemUsageSmartOrder(tempestDoubleEntity, targetHero, true)
		end
	end

	if targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", targetCreep, nil, tempestDoubleEntity)

		if #NPC.GetUnitsInRadius(tempestDoubleEntity, 600, Enum.TeamType.TEAM_ENEMY) > 3 then
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 1)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 1) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 1), wardenMana) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(tempestDoubleEntity), NPC.GetAbilityByIndex(tempestDoubleEntity, 1), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 2)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 2) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 2), wardenMana) and not NPC.IsStructure(targetCreep) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(targetCreep), NPC.GetAbilityByIndex(tempestDoubleEntity, 2), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
		end
	
		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end
		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end		
	end

	if not targetHero and not targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), tempestDoubleEntity)

		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end

		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end
	end	
end

function fooAllInOne.ArcWardenTPPush(myHero, tempestDoubleEntity, arcWardenAttackRange)
	
	if not tempestDoubleEntity then return end
	if not Entity.IsAlive(tempestDoubleEntity) then return end
	if tempestDoubleEntity == myHero then return end
	if (NPC.GetAbsOrigin(myHero) - NPC.GetAbsOrigin(tempestDoubleEntity)):Length2D() < 500 then return end

	local wardenMana = NPC.GetMana(tempestDoubleEntity)
	local mantaStyle = NPC.GetItem(tempestDoubleEntity, "item_manta", true)

	fooAllInOne.utilityItemMidas(tempestDoubleEntity, NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true), 40)

	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	local mjollnir = NPC.GetItem(tempestDoubleEntity, "item_mjollnir", true)

	if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and necronomicon and Ability.IsCastable(necronomicon, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), necronomicon, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.ControlledUnitCastTime = os.clock()
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "necronomicon", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
	end
	if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() and mantaStyle and Ability.IsCastable(mantaStyle, wardenMana) then
		Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_NO_TARGET, target, Vector(0,0,0), mantaStyle, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
		fooAllInOne.ControlledUnitCastTime = os.clock()
		fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "mantaStyle", "DOTA_UNIT_ORDER_CAST_NO_TARGET")
	end
	if NPC.HasModifier(tempestDoubleEntity, "modifier_kill") then
		local tempestDieTime = Modifier.GetDieTime(NPC.GetModifier(tempestDoubleEntity, "modifier_kill"))
		if tempestDieTime - GameRules.GetGameTime() < 2.5 then
			if mjollnir and Ability.IsCastable(mjollnir, wardenMana) then
				for _, allyCreep in ipairs(Entity.GetUnitsInRadius(tempestDoubleEntity, 825, Enum.TeamType.TEAM_FRIEND)) do
					if allyCreep and Entity.IsAlive(allyCreep) and NPC.IsLaneCreep(allyCreep) and not NPC.IsRanged(allyCreep) and Entity.GetHealth(allyCreep) > Entity.GetMaxHealth(allyCreep) * 0.6 then
						if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.GetAvgLatency() then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_TARGET, allyCreep, Vector(0,0,0), mjollnir, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
							fooAllInOne.ControlledUnitCastTime = os.clock()
						end
					end
				end
			end
		end
	end

	local targetHero
	local enemyHeroHealth = 99999
	local targetCreep
	local enemyCreepHealth = 99999
	for i, heroes in ipairs(NPC.GetHeroesInRadius(tempestDoubleEntity, 799, Enum.TeamType.TEAM_ENEMY)) do
		if heroes then
        		if Entity.IsAlive(heroes) and not Entity.IsDormant(heroes) and not NPC.HasState(heroes, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.IsIllusion(heroes) then
				if Entity.GetHealth(heroes) < enemyHeroHealth then
					targetHero = heroes
					enemyHeroHealth = Entity.GetHealth(heroes)
				end
			end
		end
	end
	if #NPC.GetHeroesInRadius(tempestDoubleEntity, 799, Enum.TeamType.TEAM_ENEMY) < 1 then
		for i = 1, NPCs.Count() do 
		local creeps = NPCs.Get(i)
			if creeps and Entity.IsNPC(creeps) and not Entity.IsSameTeam(myHero, creeps) then
				if NPC.IsEntityInRange(tempestDoubleEntity, creeps, 799) then
					if Entity.IsAlive(creeps) and not Entity.IsDormant(creeps) and NPC.IsKillable(creeps) and not NPC.IsWaitingToSpawn(creeps) then
						if Entity.GetHealth(creeps) < enemyCreepHealth then
							if creeps ~= nil then
								targetCreep = creeps
								enemyCreepHealth = Entity.GetHealth(creeps)
							end
						end
					end
				end
			end
		end
	end
	
	if #NPC.GetUnitsInRadius(tempestDoubleEntity, 800, Enum.TeamType.TEAM_ENEMY) < 1 then
		targetHero = nil
		enemyHeroHealth = 99999
		targetCreep = nil
		enemyCreepHealth = 99999
	end
	
	if targetHero then
		fooAllInOne.ArcWardenFight(myHero, targetHero, tempestDoubleEntity, arcWardenAttackRange)
		if not NPC.IsLinkensProtected(targetHero) then
			fooAllInOne.itemUsageSmartOrder(tempestDoubleEntity, targetHero, true)
		end
	end

	if targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", targetCreep, nil, tempestDoubleEntity)

		if #NPC.GetUnitsInRadius(tempestDoubleEntity, 600, Enum.TeamType.TEAM_ENEMY) > 3 then
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 1)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 1) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 1), wardenMana) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(tempestDoubleEntity), NPC.GetAbilityByIndex(tempestDoubleEntity, 1), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
			if (os.clock() - fooAllInOne.ControlledUnitCastTime) > fooAllInOne.CastAnimationDelay(NPC.GetAbilityByIndex(tempestDoubleEntity, 2)) and NPC.GetAbilityByIndex(tempestDoubleEntity, 2) and Ability.IsCastable(NPC.GetAbilityByIndex(tempestDoubleEntity, 2), wardenMana) and not NPC.IsStructure(targetCreep) then
				Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_CAST_POSITION, target, Entity.GetAbsOrigin(targetCreep), NPC.GetAbilityByIndex(tempestDoubleEntity, 2), Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, tempestDoubleEntity)
				fooAllInOne.Debugger(GameRules.GetGameTime(), tempestDoubleEntity, "magneticField", "DOTA_UNIT_ORDER_CAST_POSITION")
				fooAllInOne.ControlledUnitCastTime = os.clock()
				return
			end
		end
		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end
		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end		
	end

	if not targetHero and not targetCreep then

		fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), tempestDoubleEntity)

		for _, necro in ipairs(fooAllInOne.GetNecronomiconEntityTable(myHero, tempestDoubleEntity)) do
			fooAllInOne.NecronomiconController(necro, nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity))
		end

		if #fooAllInOne.GetIllusionEntityTable(myHero, tempestDoubleEntity) > 0 then
			fooAllInOne.MantaIlluController(nil, fooAllInOne.GenericLanePusher(tempestDoubleEntity), myHero, tempestDoubleEntity)
		end
	end
end

function fooAllInOne.drawArcWardenIndicators(tempestDoubleEntity)

	if not Menu.IsEnabled(fooAllInOne.optionHeroArcWardenDraw) then return end
	if not tempestDoubleEntity then return end

	local travelBoots1 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots", true)
	local travelBoots2 = NPC.GetItem(tempestDoubleEntity, "item_travel_boots_2", true)
	local midas = NPC.GetItem(tempestDoubleEntity, "item_hand_of_midas", true)
	local necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon", true)
	if not necronomicon then
		for i = 2, 3 do
			necronomicon = NPC.GetItem(tempestDoubleEntity, "item_necronomicon_" .. i, true)
			if necronomicon then 
				break 
			end
		end
	end

	local tempTable = {}
	if travelBoots1 then
		table.insert(tempTable, travelBoots1)
	end
	if travelBoots2 then
		table.insert(tempTable, travelBoots2)
	end
	if midas then
		table.insert(tempTable, midas)
	end
	if necronomicon then
		table.insert(tempTable, necronomicon)
	end

	local w, h = Renderer.GetScreenSize()
	for i, item in ipairs(tempTable) do 
		fooAllInOne.drawArcWardenCooldowns(item, w, h, i-1)
	end

end

function fooAllInOne.drawArcWardenCooldowns(item, w, h, index)

	if item then
		if math.floor(Ability.GetCooldownTimeLeft(item)) > 0 then
			Renderer.SetDrawColor(255, 0, 0)
			Renderer.DrawText(fooAllInOne.font, (w-300) + Menu.GetValue(fooAllInOne.optionHeroArcWardenXPos), 300 + Menu.GetValue(fooAllInOne.optionHeroArcWardenYPos) + (index*25) + 5, Ability.GetName(item).." - "..math.floor(Ability.GetCooldownTimeLeft(item)), 1)
		else
			Renderer.SetDrawColor(0, 255, 0)
			Renderer.DrawText(fooAllInOne.font, (w-300) + Menu.GetValue(fooAllInOne.optionHeroArcWardenXPos), 300 + Menu.GetValue(fooAllInOne.optionHeroArcWardenYPos) + (index*25) + 5, Ability.GetName(item).." - "..math.floor(Ability.GetCooldownTimeLeft(item)), 1)
		end	
	end

end
		
function fooAllInOne.MorphCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroMorphling) then return end

	local waveForm = NPC.GetAbilityByIndex(myHero, 0)
	local adaptiveStrike = NPC.GetAbilityByIndex(myHero, 1)
	local morphReplicate = NPC.GetAbility(myHero, "morphling_replicate")
	local morphSwitchToReplicate = NPC.GetAbility(myHero, "morphling_morph_replicate")

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	fooAllInOne.GetMorphShotgunDMG(myHero, myMana, enemy)
	fooAllInOne.MorphSelectCombo(myHero, enemy)
	fooAllInOne.MorphReplicateEscape(myHero, myMana, morphReplicate, morphSwitchToReplicate)

	if fooAllInOne.MorphAutoReplicateControl == true then
		fooAllInOne.MorphSendReplicateToBase(myHero, myMana, morphReplicate)
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		Engine.ExecuteCommand("dota_range_display 800")
	else
		Engine.ExecuteCommand("dota_range_display 0")
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroMorphHPBalance) then
		fooAllInOne.MorphBalaceHP(myHero, myMana)
	end

	if enemy and Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 800) then
			if blink and Ability.IsReady(blink) and NPC.IsEntityInRange(myHero, enemy, 1550) then
				Ability.CastPosition(blink, (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(300)))
				return
			end
		else
			if NPC.HasItem(myHero, "item_ethereal_blade", true) then
				if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_ethereal_blade", true)) > 0.1 then
					if fooAllInOne.morphlingComboSelect == false then
						fooAllInOne.MorphComboWithoutWave(myHero, myMana, enemy, adaptiveStrike)
					else
						fooAllInOne.MorphComboWithWave(myHero, myMana, enemy, adaptiveStrike, waveForm)
					end
				end
			else
				if not fooAllInOne.morphlingComboSelect then
					fooAllInOne.MorphComboWithoutWave(myHero, myMana, enemy, adaptiveStrike)
				else
					fooAllInOne.MorphComboWithWave(myHero, myMana, enemy, adaptiveStrike, waveForm)
				end
			end
		end
	fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)	
	end
end

function fooAllInOne.MorphSendReplicateToBase(myHero, myMana, morphReplicate)

	if not myHero then return end
	if not morphReplicate then return end
		if Ability.GetLevel(morphReplicate) < 1 then return end

	local castRange = Ability.GetCastRange(morphReplicate) - 10

	if Ability.IsCastable(morphReplicate, myMana) then
		for _, target in ipairs(Entity.GetHeroesInRadius(myHero, castRange, Enum.TeamType.TEAM_FRIEND)) do
			if target and not NPC.IsIllusion(target) then
				if Entity.GetHealth(target) >= Entity.GetMaxHealth(target) * 0.5 then
					Ability.CastTarget(morphReplicate, target)
					break
					return
				end
			end
		end
	else
		local replicateEntity = fooAllInOne.MorphGetCloneEntity(myHero, morphReplicate)
		if replicateEntity then
			if not NPC.IsPositionInRange(replicateEntity, fooAllInOne.GetMyFountainPos(myHero), 1500, 0) then
				fooAllInOne.GenericAttackIssuer2("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, fooAllInOne.GetMyFountainPos(myHero), replicateEntity)	
			else
				return
			end
		end
	end

end

function fooAllInOne.MorphReplicateEscape(myHero, myMana, morphReplicate, morphSwitchToReplicate)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroMorphlingEscape) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if not morphReplicate then return end
		if Ability.GetLevel(morphReplicate) < 1 then return end

	if not Ability.IsHidden(morphReplicate) then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not morphSwitchToReplicate then return end
		if not Ability.IsCastable(morphSwitchToReplicate, myMana) then return end

	local replicateTimerMod = NPC.GetModifier(myHero, "modifier_morphling_replicate_timer")
		if not replicateTimerMod then return end
			if Modifier.GetDieTime(replicateTimerMod) - GameRules.GetGameTime() < 0.1 then return end

	local healthPerc = (Entity.GetHealth(myHero) / Entity.GetMaxHealth(myHero)) * 100

	if healthPerc <= Menu.GetValue(fooAllInOne.optionHeroMorphlingEscapeHP) then
		Ability.CastNoTarget(morphSwitchToReplicate)
		return
	end

end

function fooAllInOne.MorphGetCloneEntity(myHero, morphReplicate)

	if not myHero then return end
	if not morphReplicate then return end
		if Ability.GetLevel(morphReplicate) < 1 then return end

	local replicateTimerMod = NPC.GetModifier(myHero, "modifier_morphling_replicate_timer")
		if not replicateTimerMod then return end
			if Modifier.GetDieTime(replicateTimerMod) - GameRules.GetGameTime() < 0.1 then return end

	local replicateEntity
	for i = 1, NPCs.Count() do
		local npc = NPCs.Get(i)
		if Entity.IsSameTeam(myHero, npc) then
			if npc ~= myHero then
				if NPC.HasModifier(npc, "modifier_illusion") then
					if NPC.HasModifier(npc, "modifier_morphling_replicate_timer") then
						if npc ~= nil then
							replicateEntity = npc
							break
						end
					end
				end
			end
		end
	end

	if replicateEntity ~= nil then
		return replicateEntity
	end

end

function fooAllInOne.MorphComboWithWave(myHero, myMana, enemy, adaptiveStrike, waveForm)

	if not myHero then return end
	if not enemy then return end
	if not adaptiveStrike or not waveForm then return end
	if Ability.GetLevel(adaptiveStrike) < 1 or Ability.GetLevel(waveForm) < 1 then return end

	if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
		Ability.CastTarget(adaptiveStrike, enemy)
		fooAllInOne.lastTick = os.clock()
		return
	end
	if fooAllInOne.SleepReady(0.1) and waveForm and Ability.IsCastable(waveForm, myMana) and not Ability.IsReady(adaptiveStrike) then
		Ability.CastPosition(waveForm, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(99))
		return
	end

	return

end

function fooAllInOne.MorphComboWithoutWave(myHero, myMana, enemy, adaptiveStrike)

	if not myHero then return end
	if not enemy then return end
	if not adaptiveStrike then return end
	if Ability.GetLevel(adaptiveStrike) < 1 then return end

	if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
		Ability.CastTarget(adaptiveStrike, enemy)
		return
	end

	return

end

function fooAllInOne.GetMorphShotgunDMG(myHero, myMana, enemy)

	if not myHero then return end
	if not enemy then return end
	if not NPC.GetUnitName(myHero) == "npc_dota_hero_morphling" then return end

	local waveForm = NPC.GetAbilityByIndex(myHero, 0)
	local adaptiveStrike = NPC.GetAbilityByIndex(myHero, 1)

	local waveFormLevel
	if waveForm then
		waveFormLevel = Ability.GetLevel(waveForm)
	end
	local waveFormDMG
	if waveForm and Ability.IsCastable(waveForm, myMana) then
		waveFormDMG = 100 + 75 * (waveFormLevel - 1)
	elseif not waveForm or (waveForm and not Ability.IsCastable(waveForm, myMana)) then
		waveFormDMG = 0
	end

	local adaptiveStrikeLevel
	if adaptiveStrike then
		adaptiveStrikeLevel = Ability.GetLevel(adaptiveStrike)
	end
	local adaptiveStrikeDMG
	if adaptiveStrike and Ability.IsCastable(adaptiveStrike, myMana) then
		local basicDamage = 100
		local myAgility = Hero.GetAgilityTotal(myHero)
		local myStrength = Hero.GetStrengthTotal(myHero)
		local minMultiplier = 0.25
		local maxMultiplier = 0.5 + 0.5 * (adaptiveStrikeLevel - 1)

		local ratio = myAgility / myStrength
		local minRatio = 2/3
		local maxRatio = 3/2
		local multiplier = minMultiplier+(maxMultiplier-minMultiplier)*(ratio-minRatio)/(maxRatio-minRatio)
		multiplier = multiplier > maxMultiplier and maxMultiplier or multiplier
		multiplier = multiplier < minMultiplier and minMultiplier or multiplier

		adaptiveStrikeDMG = basicDamage + myAgility * multiplier
	elseif not adaptiveStrike or (adaptiveStrike and not Ability.IsCastable(adaptiveStrike, myMana)) then
		adaptiveStrikeDMG = 0
	end
	
	local eBlade = NPC.GetItem(myHero, "item_ethereal_blade", true)
	local eBladeDMG
	if eBlade and Ability.IsCastable(eBlade, myMana) then
		local myAgility = Hero.GetAgilityTotal(myHero)
		eBladeDMG = (2 * myAgility + 75)
	elseif not eBlade or (eBlade and not Ability.IsCastable(eBlade, myMana)) then
		eBladeDMG = 0
	end

	local dagon = NPC.GetItem(myHero, "item_dagon", true)
		if not dagon then
			for i = 2, 5 do
				dagon = NPC.GetItem(myHero, "item_dagon_" .. i, true)
				if dagon then break end
			end
		end
	local dagonDMG = 0
	if dagon and Ability.IsCastable(dagon, myMana) then
		dagonDMG = Ability.GetLevelSpecialValueFor(dagon, "damage")
	end

	local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)

	local overAllDMG = waveFormDMG + adaptiveStrikeDMG + eBladeDMG + dagonDMG
	if veil and Ability.IsCastable(veil, myMana) then
		overAllDMG = overAllDMG * 1.25
	end
	if eBlade and Ability.IsCastable(eBlade, myMana) then
		overAllDMG = overAllDMG * 1.4
	end

	local overAllDMGwoWave = adaptiveStrikeDMG + eBladeDMG + dagonDMG
	if veil and Ability.IsCastable(veil, myMana) then
		overAllDMGwoWave = overAllDMGwoWave * 1.25
	end
	if eBlade and Ability.IsCastable(eBlade, myMana) then
		overAllDMGwoWave = overAllDMGwoWave * 1.4
	end
	
	local trueOverallDMG = math.floor((1 - NPC.GetMagicalArmorValue(enemy)) * overAllDMG + overAllDMG * (Hero.GetIntellectTotal(myHero) / 14 / 100))
	local trueOverallDMGwoWave = math.floor((1 - NPC.GetMagicalArmorValue(enemy)) * overAllDMGwoWave + overAllDMGwoWave * (Hero.GetIntellectTotal(myHero) / 14 / 100))

	fooAllInOne.morphlingTotalDMG = trueOverallDMG - 35
	fooAllInOne.morphlingTotalDMGwoWave = trueOverallDMGwoWave - 35
	

end

function fooAllInOne.MorphBalaceHP(myHero, myMana)

	if not myHero then return end
	
	if os.clock() - fooAllInOne.MorphBalaceTimer < 0.5 then return end

	if NPC.IsSilenced(myHero) then return end

	local targetHP
	if fooAllInOne.MorphBalanceSelectedHP > 0 then
		targetHP = fooAllInOne.MorphBalanceSelectedHP
	end

	if not targetHP then return end

	local morphAGI = NPC.GetAbility(myHero, "morphling_morph_agi")
	local morphSTR = NPC.GetAbility(myHero, "morphling_morph_str")

		if not morphAGI or not morphSTR then return end
		if Ability.GetLevel(morphAGI) < 1 then return end

	local myHP = Entity.GetHealth(myHero)
	local myMAXHP = Entity.GetMaxHealth(myHero)

	local shouldToggleAGI = false
	local shouldToggleStr = false
	local allowedDeviation = Menu.GetValue(fooAllInOne.optionHeroMorphHPBalanceDeviation)

	if not NPC.HasModifier(myHero, "modifier_fountain_aura_buff") then
		if targetHP - myHP >= allowedDeviation then
			if Hero.GetAgility(myHero) > 1 then
				shouldToggleStr = true
			else
				shouldToggleStr = false
			end
		else
			shouldToggleStr = false
		end

		if myMAXHP - targetHP >= allowedDeviation and (myHP - targetHP) >= allowedDeviation then
			if Hero.GetStrength(myHero) > 1 then
				shouldToggleAGI = true
			else
				shouldToggleAGI = false
			end
		else
			shouldToggleAGI = false
		end

		if myMana < 35 then
			shouldToggleAGI = false
			shouldToggleStr = false
		end
	else
		if myMAXHP - myHP <= 50 then
			if myMAXHP - targetHP >= 50 then
				shouldToggleAGI = true
			elseif targetHP - myHP >= 50 then
				shouldToggleStr = true
			else
				shouldToggleAGI = false
				shouldToggleStr = false
			end
		end
	end
	

	if shouldToggleStr then
		if not Ability.GetToggleState(morphSTR) then
			Ability.Toggle(morphSTR)
			fooAllInOne.MorphBalaceTimer = os.clock()
			return
		end
	else
		if Ability.GetToggleState(morphSTR) then
			Ability.Toggle(morphSTR)
			fooAllInOne.MorphBalaceTimer = os.clock()
			return
		end
	end

	if shouldToggleAGI then
		if not Ability.GetToggleState(morphAGI) then
			Ability.Toggle(morphAGI)
			fooAllInOne.MorphBalaceTimer = os.clock()
			return
		end
	else
		if Ability.GetToggleState(morphAGI) then
			Ability.Toggle(morphAGI)
			fooAllInOne.MorphBalaceTimer = os.clock()
			return
		end
	end
				
end

function fooAllInOne.MorphDrawBalanceBoard(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroMorphDrawBoard) then return end

	local maxMorphAGI = math.floor(Hero.GetAgility(myHero))
	local maxMorphSTR = math.floor(Hero.GetStrength(myHero))

	local currentMAXHP = Entity.GetMaxHealth(myHero)

	local minHP = currentMAXHP - maxMorphSTR * 20
	local maxHP = currentMAXHP + maxMorphAGI * 20

	local w, h = Renderer.GetScreenSize()
	Renderer.SetDrawColor(255, 255, 255)

	local startX = w - 300 - Menu.GetValue(fooAllInOne.optionHeroMorphDrawBoardXPos)
	local startY = 300 + Menu.GetValue(fooAllInOne.optionHeroMorphDrawBoardYPos)
	
	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroMorphBoardToggleKey) then
		fooAllInOne.Toggler = not fooAllInOne.Toggler
	end

	if not fooAllInOne.Toggler then return end
		
	 -- black background
	Renderer.SetDrawColor(0, 0, 0, 150)
	Renderer.DrawFilledRect(startX-1, startY, 202, 25)

	-- replicateControlBox
	Renderer.SetDrawColor(0, 0, 0, 150)
	Renderer.DrawFilledRect(startX+35, startY-20, 120, 15)
	Renderer.SetDrawColor(0, 0, 0, 255)
	Renderer.DrawOutlineRect(startX+35, startY-20, 120, 15)
	local hoveringOverReplicateBox = Input.IsCursorInRect(startX+35, startY-20, 120, 15)

	-- black border
	Renderer.SetDrawColor(0, 0, 0, 255)
	Renderer.DrawOutlineRect(startX-1, startY, 202, 25)

	-- min/max HP
	Renderer.SetDrawColor(0, 255, 0, 150)
	Renderer.DrawText(fooAllInOne.font, startX-25, startY-25, minHP, 0)
	Renderer.SetDrawColor(255, 0, 0, 150)
	Renderer.DrawText(fooAllInOne.font, startX+175, startY-25, maxHP, 0)

	-- colored rect
	for i = 1, 20 do
		Renderer.SetDrawColor(25 + i*10, 230 - i*10, 0, 150)
		Renderer.DrawFilledRect(startX + (i-1)*10 , startY+1, 10, 23)
	end

	-- hovering rects
	local hoveringTable = {}
	if next(hoveringTable) == nil then
		for i = 1, 20 do
			hoveringTable[i] = Input.IsCursorInRect(startX + (i-1)*10 , startY+1, 10, 23)
		end
	end

	local HPsteps = math.floor((maxHP - minHP) / 20)

	if Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		for i, v in ipairs(hoveringTable) do
			if hoveringTable[1] == true then
				fooAllInOne.MorphBalanceSelectedHP = minHP
				fooAllInOne.MorphBalanceSelected = 1
			elseif hoveringTable[20] == true then
				fooAllInOne.MorphBalanceSelectedHP = maxHP
				fooAllInOne.MorphBalanceSelected = 20
			else
				if v == true then
					fooAllInOne.MorphBalanceSelectedHP = minHP + HPsteps*i
					fooAllInOne.MorphBalanceSelected = i
				end
			end		
		end
		if hoveringOverReplicateBox == true then
			fooAllInOne.MorphAutoReplicateControl = not fooAllInOne.MorphAutoReplicateControl
		end	
	end

	if fooAllInOne.MorphBalanceSelected > 0 then
		Renderer.SetDrawColor(0, 0, 0, 200)
		Renderer.DrawFilledRect(startX+3+10*(fooAllInOne.MorphBalanceSelected-1), startY, 4, 30)
		Renderer.DrawTextCenteredX(fooAllInOne.font, startX+3+10*(fooAllInOne.MorphBalanceSelected-1), startY+30, fooAllInOne.MorphBalanceSelectedHP, 0)
	end

	if fooAllInOne.MorphAutoReplicateControl == true then
		Renderer.SetDrawColor(0, 255, 0, 150)
		Renderer.DrawText(fooAllInOne.skywrathFont, startX+42, startY-20, "auto replicate to base", 0)
	else
		Renderer.SetDrawColor(255, 0, 0, 150)
		Renderer.DrawText(fooAllInOne.skywrathFont, startX+42, startY-20, "auto replicate to base", 0)
	end
end

function fooAllInOne.MorphSelectCombo(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local adaptiveStrike = NPC.GetAbilityByIndex(myHero, 1)

	if adaptiveStrike and Ability.SecondsSinceLastUse(adaptiveStrike) > -1 and Ability.SecondsSinceLastUse(adaptiveStrike) < ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1150) + 0.25 then
		return
	end

	if Entity.GetHealth(enemy) >= fooAllInOne.morphlingTotalDMGwoWave then
		fooAllInOne.morphlingComboSelect = true
	else
		fooAllInOne.morphlingComboSelect = false
	end
	return

end		

function fooAllInOne.drawMorphlingKillIndicator(myHero)

	if not myHero then return end
	
	if fooAllInOne.morphlingTotalDMG == 0 then return end

	local enemy = fooAllInOne.targetChecker(Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY))
		if not enemy then return end
		if not NPC.IsPositionInRange(enemy, Input.GetWorldCursorPos(), 500, 0) then return end

	local pos = Entity.GetAbsOrigin(enemy)
	local posY = NPC.GetHealthBarOffset(enemy)
		pos:SetZ(pos:GetZ() + posY)
			
	local x, y, visible = Renderer.WorldToScreen(pos)

	if fooAllInOne.morphlingTotalDMG > 0 then
		if visible then
			if Entity.GetHealth(enemy) > fooAllInOne.morphlingTotalDMG then
				Renderer.SetDrawColor(255,102,102,255)
			else
				Renderer.SetDrawColor(50,205,50,255)
			end
				Renderer.DrawText(fooAllInOne.skywrathFont, x-50, y-70, "Shotgun DMG:  " .. math.floor(fooAllInOne.morphlingTotalDMG), 0)
		end
	end

end

function fooAllInOne.PuckCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroPuck) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 3000)	then return end

	local illusoryOrb = NPC.GetAbilityByIndex(myHero, 0)
	local etherealJaunt = NPC.GetAbility(myHero, "puck_ethereal_jaunt")
	local waningRift = NPC.GetAbilityByIndex(myHero, 1)
	local phaseShift = NPC.GetAbility(myHero, "puck_phase_shift")
	local dreamCoil = NPC.GetAbility(myHero, "puck_dream_coil")

	local blink = NPC.GetItem(myHero, "item_blink", true)

	local myMana = NPC.GetMana(myHero)
	fooAllInOne.itemUsage(myHero, enemy)

	local orbIsFlying = false
	if illusoryOrb and Ability.SecondsSinceLastUse(illusoryOrb) > 0 and Ability.SecondsSinceLastUse(illusoryOrb) <= 2.995 then
		orbIsFlying = true
	end

	if orbIsFlying then
		fooAllInOne.lastPosition = Vector(0, 0, 0)
	end
		
	if Menu.IsEnabled(fooAllInOne.optionHeroPuckPanic) then
		if Menu.IsKeyDownOnce(fooAllInOne.optionHeroPuckPanicKey) then
			fooAllInOne.GenericUpValue = false
		end
		if Menu.IsKeyDown(fooAllInOne.optionHeroPuckPanicKey) then
			fooAllInOne.PuckPanic(myHero, enemy, myMana, orbIsFlying)
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroPuckDefend) then
		fooAllInOne.PuckDefend(myHero, enemy, myMana, waningRift)
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.GetHealth(enemy) > 0 and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and fooAllInOne.heroCanCastSpells(myHero) == true then
		if not NPC.IsEntityInRange(myHero, enemy, 375) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1000) then
					fooAllInOne.lastPosition = Entity.GetAbsOrigin(myHero)
					if Menu.GetValue(fooAllInOne.optionHeroPuckJump) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(175))
						return
					else
						if #NPCs.InRadius(Entity.GetAbsOrigin(enemy), 375, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY) <= 1 then
							Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(175))
							return
						else
							Ability.CastPosition(blink, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 375, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 350))
							return
						end
					end
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end

			if not blink and Menu.IsEnabled(fooAllInOne.optionHeroPuckOrbInit) then
				if fooAllInOne.SleepReady(0.15) and illusoryOrb and Ability.IsCastable(illusoryOrb, myMana) then
					local orbPrediction = Ability.GetCastPoint(illusoryOrb) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 651) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
					Ability.CastPosition(illusoryOrb, fooAllInOne.castLinearPrediction(myHero, enemy, orbPrediction))
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.PuckOrbCastTime = GameRules.GetGameTime()
					return
				end
				if etherealJaunt and Ability.IsReady(etherealJaunt) then
					for _, v in ipairs(fooAllInOne.PuckOrbHitSim) do
						local origin = v[1]
						local velocity = v[2]
						local orbPos = origin + velocity:Scaled(GameRules.GetGameTime() - fooAllInOne.PuckOrbCastTime)
						if NPC.IsPositionInRange(enemy, orbPos, 150, 0) then
							Ability.CastNoTarget(etherealJaunt)
							fooAllInOne.PuckOrbHitSim = {}
							return
						end
					end
				end		
			end
		else
			if not Ability.IsChannelling(phaseShift) or NPC.HasModifier(myHero, "modifier_eul_cyclone") then
				if fooAllInOne.SleepReady(0.15) and waningRift and Ability.IsCastable(waningRift, myMana) then 
					Ability.CastNoTarget(waningRift)
					fooAllInOne.lastTick = os.clock()
				end
				if Menu.IsKeyDown(fooAllInOne.optionHeroPuckComboAltKey) then	
					if fooAllInOne.SleepReady(0.15) and dreamCoil and Ability.IsCastable(dreamCoil, myMana) then
						Ability.CastPosition(dreamCoil, fooAllInOne.getBestPosition(NPCs.InRadius(Entity.GetAbsOrigin(enemy), 375, Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY), 350))
						fooAllInOne.lastTick = os.clock()
					end
				end
				if fooAllInOne.SleepReady(0.15) and illusoryOrb and Ability.IsCastable(illusoryOrb, myMana) then
					if fooAllInOne.lastPosition:__tostring() ~= Vector(0, 0, 0):__tostring() then
						Ability.CastPosition(illusoryOrb, Entity.GetAbsOrigin(myHero) + (fooAllInOne.lastPosition - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(500))
						fooAllInOne.lastTick = os.clock()
						return
					end
					if fooAllInOne.lastPosition:__tostring() == Vector(0, 0, 0):__tostring() then
						Ability.CastPosition(illusoryOrb, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(500))
						fooAllInOne.lastTick = os.clock()
						return
					end
				end			
			else
				fooAllInOne.GenericUpValue = false
				fooAllInOne.PuckPanic(myHero, enemy, myMana, orbIsFlying)
			end
		end
	fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)	
	end
end

function fooAllInOne.PuckPanic(myHero, enemy, myMana, orbIsFlying)

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end

	local illusoryOrb = NPC.GetAbilityByIndex(myHero, 0)
	local etherealJaunt = NPC.GetAbility(myHero, "puck_ethereal_jaunt")
	local phaseShift = NPC.GetAbility(myHero, "puck_phase_shift")

	local blink = NPC.GetItem(myHero, "item_blink", true)
	local euls = NPC.GetItem(myHero, "item_cyclone", true)

	local orbFlyingTimeLeft = 0
		if orbIsFlying then
			orbFlyingTimeLeft = 2.995 - Ability.SecondsSinceLastUse(illusoryOrb)
		end

	if NPC.IsSilenced(myHero) then
		if not fooAllInOne.GenericUpValue then
			if blink and Ability.IsReady(blink) then
				if Menu.GetValue(fooAllInOne.optionHeroPuckPanicDirection) == 0 then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (fooAllInOne.GetMyFountainPos(myHero) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(1150))
					fooAllInOne.GenericUpValue = true
					return
				else
					Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(1150))
					fooAllInOne.GenericUpValue = true
					return
				end
			end
			if (blink and Ability.GetCooldownTimeLeft(blink) <= 2.5) or (illusoryOrb and Ability.GetCooldownTimeLeft(illusoryOrb) <= 2.5) or (phaseShift and blink and Ability.GetCooldownTimeLeft(blink) <= 2.5 + Ability.GetLevelSpecialValueForFloat(phaseShift, "duration")) then
				if euls and Ability.IsCastable(euls, myMana) then
					Ability.CastTarget(euls, myHero)
					return
				end
			end
		end
		if (not euls or (euls and not Ability.IsCastable(euls, myMana))) and (not blink or (blink and not Ability.IsReady(blink))) then
			return
		end	
	else
		if not fooAllInOne.GenericUpValue and not Ability.IsChannelling(phaseShift) then
			if illusoryOrb and Ability.SecondsSinceLastUse(illusoryOrb) > 0 and Ability.SecondsSinceLastUse(illusoryOrb) <= 2.995 then
				if Ability.SecondsSinceLastUse(illusoryOrb) > 0 and Ability.SecondsSinceLastUse(illusoryOrb) <= 1.25 then
					if phaseShift and Ability.IsReady(phaseShift) then
						Ability.CastNoTarget(phaseShift)
						return
					end
				end
				if Ability.SecondsSinceLastUse(illusoryOrb) > 1.25 and Ability.SecondsSinceLastUse(illusoryOrb) <= 2.995 then
					if etherealJaunt and Ability.IsReady(etherealJaunt) then
						Ability.CastNoTarget(etherealJaunt)
						fooAllInOne.GenericUpValue = true
						return
					end
				end
			end		
			if blink then
				if Ability.IsReady(blink) then
					if Menu.GetValue(fooAllInOne.optionHeroPuckPanicDirection) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (fooAllInOne.GetMyFountainPos(myHero) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(1150))
						fooAllInOne.GenericUpValue = true
						return
					else
						Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(1150))
						fooAllInOne.GenericUpValue = true
						return
					end
				end
				if Ability.GetCooldownTimeLeft(blink) > 0.1 and Ability.GetCooldownTimeLeft(blink) < Ability.GetLevelSpecialValueForFloat(phaseShift, "duration") then
					if phaseShift and Ability.IsReady(phaseShift) then
						Ability.CastNoTarget(phaseShift)
						return
					end
				end
			end
			if illusoryOrb and Ability.IsCastable(illusoryOrb, myMana) and (phaseShift and Ability.IsReady(phaseShift)) then
				if Menu.GetValue(fooAllInOne.optionHeroPuckPanicDirection) == 0 then
					Ability.CastPosition(illusoryOrb, Entity.GetAbsOrigin(myHero) + (fooAllInOne.GetMyFountainPos(myHero) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(500))
					Ability.CastNoTarget(phaseShift, true)
					return
				else
					Ability.CastPosition(illusoryOrb, Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(500))
					Ability.CastNoTarget(phaseShift, true)
					return
				end
			end
			if euls and Ability.IsCastable(euls, myMana) then
				if (blink and Ability.GetCooldownTimeLeft(blink) > Ability.GetLevelSpecialValueForFloat(phaseShift, "duration") and Ability.GetCooldownTimeLeft(blink) <= Ability.GetLevelSpecialValueForFloat(phaseShift, "duration") + 2.5) or (illusoryOrb and Ability.GetCooldownTimeLeft(illusoryOrb) > 0 and Ability.GetCooldownTimeLeft(illusoryOrb) < 2.5 and phaseShift and Ability.GetCooldownTimeLeft(phaseShift) < 2.5) then
					Ability.CastTarget(euls, myHero)
					return
				end
			end	
		end
	end

	if Ability.IsChannelling(phaseShift) then
		if not fooAllInOne.GenericUpValue then
			if orbIsFlying then
				local phaseShiftTimeLeft = math.max(Ability.GetChannelStartTime(phaseShift) + Ability.GetLevelSpecialValueForFloat(phaseShift, "duration") - GameRules.GetGameTime(), 0)
				if etherealJaunt and Ability.IsReady(etherealJaunt) then
					if phaseShiftTimeLeft > orbFlyingTimeLeft then
						if orbFlyingTimeLeft / 2.995 <= 0.25 then
							Ability.CastNoTarget(etherealJaunt)
							fooAllInOne.GenericUpValue = true
							return
						end
					else
						if phaseShiftTimeLeft / Ability.GetLevelSpecialValueForFloat(phaseShift, "duration") <= 0.25 then
							Ability.CastNoTarget(etherealJaunt)
							fooAllInOne.GenericUpValue = true
							return
						end
					end
						
				end
			end
			if not orbIsFlying then
				if blink and Ability.IsReady(blink) then
					if Menu.GetValue(fooAllInOne.optionHeroPuckPanicDirection) == 0 then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (fooAllInOne.GetMyFountainPos(myHero) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(1150))
						fooAllInOne.GenericUpValue = true
						return
					else
						Ability.CastPosition(blink, Entity.GetAbsOrigin(myHero) + (Input.GetWorldCursorPos() - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(1150))
						fooAllInOne.GenericUpValue = true
						return
					end
				end
			end
			
		end
	end				
end


function fooAllInOne.PuckDefend(myHero, enemy, myMana, waningRift)

	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not waningRift then return end
	if not Ability.IsCastable(waningRift, myMana) then return end

	for _, heroes in ipairs(NPC.GetHeroesInRadius(myHero, 400, Enum.TeamType.TEAM_ENEMY)) do
		if heroes and not NPC.IsDormant(heroes) and Entity.IsAlive(heroes) then
			local enemyDagger = NPC.GetItem(heroes, "item_blink", true)
			if enemyDagger and NPC.IsEntityInRange(myHero, heroes, 375) and Ability.GetCooldownTimeLeft(enemyDagger) >= 9 and Ability.SecondsSinceLastUse(enemyDagger) > 0 and Ability.SecondsSinceLastUse(enemyDagger) <= 1 then
				if waningRift and Ability.IsCastable(waningRift, myMana) and not NPC.HasState(heroes, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
					Ability.CastNoTarget(waningRift)
					break
					return
				end
			end
		end
	end
end

function fooAllInOne.ZuusCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroZuus) then return end

  	local arc = NPC.GetAbilityByIndex(myHero, 0)
 	local bolt = NPC.GetAbilityByIndex(myHero, 1)
 	local static = NPC.GetAbilityByIndex(myHero, 2)
 	local wrath = NPC.GetAbilityByIndex(myHero, 4)
	local nimbus = NPC.GetAbilityByIndex(myHero, 3)

	local lens = NPC.GetItem(myHero, "item_aether_lens", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)

	local bonusTalentRange = NPC.GetAbility(myHero, "special_bonus_cast_range_200")
  	local arcBonusTalentDamage = NPC.GetAbility(myHero, "special_bonus_unique_zeus_2")
  	local staticBonusTalentDamage = NPC.GetAbility(myHero, "special_bonus_unique_zeus")
	local spellAmplification = Hero.GetIntellectTotal(myHero)  / 14 / 100

	local arcCastRange = 850
  	local boltCastRange = 700
  	local staticCastRange = 1200

	if lens then
    		arcCastRange = arcCastRange + 220
    		boltCastRange = boltCastRange + 220
    		staticCastRange = staticCastRange + 220
    		spellAmplification = spellAmplification + 6
  	end

	local arcDamage = Ability.GetDamage(arc) * (1 + spellAmplification / 100)
  	local boltDamage = Ability.GetDamage(bolt) * (1 + spellAmplification / 100)
	local staticDamage = 0
	if static and Ability.GetLevel(static) > 0 then
		staticDamage = 2 + (2 * Ability.GetLevel(static))
	end
  	local wrathDamage = (225 + (100 * (Ability.GetLevel(wrath) - 1))) * (1 + spellAmplification / 100)

	if arcBonusTalentDamage and Ability.GetLevel(arcBonusTalentDamage) > 0 then
    		arcDamage = arcDamage + (75 * (1 + spellAmplification / 100))
  	end

	if bonusTalentRange and Ability.GetLevel(bonusTalentRange) > 0 then
    		arcCastRange = arcCastRange + 200
    		boltCastRange = boltCastRange + 200
    		staticCastRange = staticCastRange + 200
  	end

	if staticBonusTalentDamage and Ability.GetLevel(staticBonusTalentDamage) > 0 then
      		staticDamage = staticDamage + 2
    	end

	local myMana = NPC.GetMana(myHero)

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsKeyDown(fooAllInOne.optionHeroZuusFarmKey) then
		fooAllInOne.ZuusArcFarm(myHero, myMana, arc, arcDamage, arcCastRange, staticDamage)
	end

	if Menu.IsKeyDown(fooAllInOne.optionHeroZuusHarassKey) then
		fooAllInOne.ZuusArcHarass(myHero, myMana, arc, arcCastRange)
	end

	if Menu.IsKeyDown(fooAllInOne.optionHeroZuusFarmKey) or Menu.IsKeyDown(fooAllInOne.optionHeroZuusHarassKey) then
		Engine.ExecuteCommand("dota_range_display " .. tostring(arcCastRange))
	else
		Engine.ExecuteCommand("dota_range_display 0")
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroZuusKillsteal) then
		fooAllInOne.ZuusFullKillSteal(myHero, myMana, arc, bolt, static, wrath, arcCastRange, boltCastRange, staticCastRange, arcDamage, boltDamage, staticDamage, wrathDamage, refresher, nimbus)
	end
	
	if enemy and NPC.IsEntityInRange(myHero, enemy, 2000) then	
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.IsAlive(enemy) and fooAllInOne.heroCanCastSpells(myHero) == true then
			if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
				if not NPC.IsEntityInRange(myHero, enemy, boltCastRange) then
					if blink and Ability.IsReady(blink) and Menu.IsEnabled(fooAllInOne.optionHeroZuusBlink) then
						if NPC.IsEntityInRange(myHero, enemy, 1900) then
							Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(750))
							return
						else
							if fooAllInOne.SleepReady(0.5) then
								Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
					if not blink or (blink and not Ability.IsReady(blink)) or not Menu.IsEnabled(fooAllInOne.optionHeroZuusBlink) then
						if fooAllInOne.SleepReady(0.5) then
							NPC.MoveTo(myHero, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(boltCastRange - 75), false, false)
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
					if arc and Ability.IsCastable(arc, myMana) and NPC.IsEntityInRange(myHero, enemy, arcCastRange) then
						Ability.CastTarget(arc, enemy)
						fooAllInOne.lastTick = os.clock()
					end	
				else
					if arc and Ability.IsCastable(arc, myMana) then
						Ability.CastTarget(arc, enemy)
						fooAllInOne.lastTick = os.clock()
					end
					if fooAllInOne.SleepReady(Ability.GetCastPoint(arc)) and bolt and Ability.IsCastable(bolt, myMana) then
						Ability.CastTarget(bolt, enemy)
						fooAllInOne.lastTick = os.clock()
					end
				end
			end
			if Menu.IsEnabled(fooAllInOne.optionHeroZuusRightClick) then
				fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
			end
		end
	end

end

function fooAllInOne.ZuusArcHarass(myHero, myMana, arc, arcCastRange)

	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not arc then return end
		if not Ability.IsCastable(arc, myMana) then return end

	local targetHero
	local minHP = 99999

	if (myMana / NPC.GetMaxMana(myHero)) >= (Menu.GetValue(fooAllInOne.optionHeroZuusHarassMana) / 100) then
		for _, hero in ipairs(NPC.GetHeroesInRadius(myHero, arcCastRange - 25, Enum.TeamType.TEAM_ENEMY)) do
			if hero and Entity.IsHero(hero) and not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) then
				if Entity.IsAlive(hero) then
					if Entity.GetHealth(hero) < minHP then
						targetHero = hero
						minHP = Entity.GetHealth(hero)
					end
				end
			end
		end
	end

	if targetHero then
		Ability.CastTarget(arc, targetHero)
        	return
	else
		if (myMana / NPC.GetMaxMana(myHero)) >= (Menu.GetValue(fooAllInOne.optionHeroZuusHarassMana) / 100) then
			for _, npc in ipairs(NPC.GetUnitsInRadius(myHero, arcCastRange - 25, Enum.TeamType.TEAM_ENEMY)) do
				if npc and not Entity.IsDormant(npc) and not Entity.IsHero(npc) and NPC.IsCreep(npc) then 
					if Entity.IsAlive(npc) and not NPC.IsWaitingToSpawn(npc) then
        					Ability.CastTarget(arc, npc)
						break
        					return
					end
				end	
			end
      		end		
	end

end

function fooAllInOne.ZuusArcFarm(myHero, myMana, arc, arcDamage, arcCastRange, staticDamage)

	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not arc then return end
		if not Ability.IsCastable(arc, myMana) then return end

	for _, npc in ipairs(NPC.GetUnitsInRadius(myHero, arcCastRange - 25, Enum.TeamType.TEAM_ENEMY)) do

		if npc and not Entity.IsDormant(npc) and not Entity.IsHero(npc) and NPC.IsCreep(npc) then 
			if Entity.IsAlive(npc) and not NPC.IsWaitingToSpawn(npc) then
      				if Entity.GetHealth(npc) < (arcDamage + (Entity.GetHealth(npc) * (staticDamage / 100))) * NPC.GetMagicalArmorDamageMultiplier(npc) then
        				Ability.CastTarget(arc, npc)
					break
        				return
				end
			end
      		end		
	end

end

function fooAllInOne.ZuusFullKillSteal(myHero, myMana, arc, bolt, static, wrath, arcCastRange, boltCastRange, staticCastRange, arcDamage, boltDamage, staticDamage, wrathDamage, refresher, nimbus)

	if not myHero then return end
	
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	for i = 1, Heroes.Count() do
	local enemies = Heroes.Get(i)
		if enemies ~= nil and Entity.IsHero(enemies) and not Entity.IsSameTeam(myHero, enemies) then
			local enemy = fooAllInOne.targetChecker(enemies)
			if enemy then
				if Ability.GetLevel(static) > 0 and NPC.IsEntityInRange(myHero, enemy, staticCastRange-25, 0) then
          				boltDamage  = boltDamage + (Entity.GetHealth(enemy) * (staticDamage / 100))
          				arcDamage = arcDamage + (Entity.GetHealth(enemy) * (staticDamage / 100))
        			end
        			boltDamage = NPC.GetMagicalArmorDamageMultiplier(enemy) * boltDamage
        			arcDamage = NPC.GetMagicalArmorDamageMultiplier(enemy) * arcDamage
        			wrathDamage = NPC.GetMagicalArmorDamageMultiplier(enemy) * wrathDamage
				if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
        				if fooAllInOne.ZuusWrathCount(myHero, myMana, wrath, wrathDamage, static, staticDamage, staticCastRange, false) == true and wrath and Ability.IsCastable(wrath, myMana) then
            					Ability.CastNoTarget(wrath) 
            					return
          				end
					if refresher and Ability.IsCastable(refresher, myMana) then
						if fooAllInOne.ZuusWrathCount(myHero, myMana, wrath, wrathDamage, static, staticDamage, staticCastRange, true) == true and wrath and Ability.IsCastable(wrath, myMana) then
            						Ability.CastNoTarget(wrath)
							Ability.CastNoTarget(refresher, true)
            						return
						end
					end
					if nimbus and not Ability.IsHidden(nimbus) and Ability.IsCastable(nimbus, myMana) then
						if not NPC.IsPositionInRange(myHero, Entity.GetAbsOrigin(enemy), arcCastRange, 0) then
							if Entity.GetHealth(enemy) <= boltDamage then
								Ability.CastPosition(nimbus, Entity.GetAbsOrigin(enemy))
								return
							end
						end
					end
					if not NPC.IsLinkensProtected(enemy) and Entity.GetHealth(enemy) <= arcDamage and arc and Ability.IsCastable(arc, myMana) and NPC.IsPositionInRange(myHero, Entity.GetAbsOrigin(enemy), arcCastRange, 0) then
            					Ability.CastTarget(arc, enemy) 
            					return 
         				end
        				if not NPC.IsLinkensProtected(enemy) and Entity.GetHealth(enemy) <= boltDamage and bolt and Ability.IsCastable(bolt, myMana) and NPC.IsPositionInRange(myHero, Entity.GetAbsOrigin(enemy), boltCastRange, 0) then
            					Ability.CastTarget(bolt, enemy) 
           	 				return
          				end
        				if not NPC.IsLinkensProtected(enemy) and Entity.GetHealth(enemy) <= (boltDamage + arcDamage) and arc and bolt and Ability.IsCastable(bolt, myMana - 80) and Ability.IsCastable(arc, myMana) and NPC.IsPositionInRange(myHero, Entity.GetAbsOrigin(enemy), boltCastRange, 0) then
            					Ability.CastTarget(bolt, enemy)
						Ability.CastTarget(arc, enemy, true)
            					return 
          				end
          			end
			end
		end
	end

end

function fooAllInOne.ZuusWrathCount(myHero, myMana, wrath, wrathDamage, static, staticDamage, staticCastRange, doubleUlt)

	if not myHero then return false end
	if not wrath then return false end
		if not Ability.IsReady(wrath) then return false end
		if not Ability.IsCastable(wrath, myMana) then return false end

	local count = 0
	local countRefresher = 0
	for i = 1, Heroes.Count(), 1 do
	local enemies = Heroes.Get(i)
		if enemies ~= nil and Entity.IsHero(enemies) and not Entity.IsSameTeam(myHero, enemies) then
			local enemy = fooAllInOne.targetChecker(enemies)
			if enemy then
				if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
					if not doubleUlt then
						if Ability.GetLevel(static) > 0 and NPC.IsEntityInRange(myHero, enemy, staticCastRange-25, 0) then
							if Entity.GetHealth(enemy) <= (wrathDamage + (Entity.GetHealth(enemy) * (staticDamage / 100))) then
								count = count + 1
							end
						else
							if Entity.GetHealth(enemy) <= wrathDamage then
								count = count + 1
							end
						end
					else
						if Ability.GetLevel(static) > 0 and NPC.IsEntityInRange(myHero, enemy, staticCastRange-25, 0) then
							if Entity.GetHealth(enemy) <= (wrathDamage + (Entity.GetHealth(enemy) * (staticDamage / 100))) * 2 then
								countRefresher = countRefresher + 1
							end
						else
							if Entity.GetHealth(enemy) <= wrathDamage * 2 then
								countRefresher = countRefresher + 1
							end
						end	
					end
				end
			end
		end
	end

	if count > 0 and doubleUlt == false then
		if count >= Menu.GetValue(fooAllInOne.optionHeroZuusUltCount) then
			return true
		end
	end

	if countRefresher > 0 and doubleUlt == true and myMana > (Ability.GetManaCost(wrath) * 2 + 375) then
		if countRefresher >= Menu.GetValue(fooAllInOne.optionHeroZuusUltCountRefresher) then
			return true
		end
	end

	return false

end

function fooAllInOne.ProphetHelper(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroProphet) then return end
	
	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroProphetToggleKey) then
		fooAllInOne.Toggler = not fooAllInOne.Toggler
		fooAllInOne.TogglerTime = os.clock()
	end

	fooAllInOne.itemUsage(myHero, enemy)

	if enemy and NPC.IsEntityInRange(myHero, enemy, 2000) then	
		if Menu.IsKeyDown(fooAllInOne.optionComboKey) and Entity.IsAlive(enemy) and fooAllInOne.heroCanCastItems(myHero) == true then
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
		end
	end
	
	local treantEntities = {}
	if fooAllInOne.Toggler then
		for i = 1, NPCs.Count() do 
		local npc = NPCs.Get(i)
			if npc and Entity.IsSameTeam(myHero, npc) and Entity.IsAlive(npc) then
				if npc ~= myHero then
					if Entity.GetOwner(npc) == myHero then
						if npc ~= nil then
							if NPC.GetUnitName(npc) == "npc_dota_furion_treant" then
								if npc ~= nil then
									fooAllInOne.GenericAttackIssuer2("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE", nil, fooAllInOne.GenericLanePusher(npc), npc)
								end
							end	
						end
					end
				end
			end
		end
	end
			
end

function fooAllInOne.DrawProphetHelperSwitch()

	local w, h = Renderer.GetScreenSize()
	Renderer.SetDrawColor(255, 0, 255)

	if os.clock() - fooAllInOne.TogglerTime < 3 then
		if fooAllInOne.Toggler then
			Renderer.DrawTextCentered(fooAllInOne.font, w / 2, h / 2 + 300, "LANE PUSH ON", 1)
		else 
			Renderer.DrawTextCentered(fooAllInOne.font, w / 2, h / 2 + 300, "LANE PUSH OFF", 1)
		end
	end

end

function fooAllInOne.DrawProphetAwareness(myHero)

	if not myHero then return end
	local w, h = Renderer.GetScreenSize()
	Renderer.SetDrawColor(255, 255, 255)

	for i = 1, Heroes.Count() do 
	local hero = Heroes.Get(i)
		if hero and not Entity.IsSameTeam(myHero, hero) and Entity.IsAlive(hero) then
			if not Entity.IsDormant(hero) and not NPC.IsIllusion(hero) then
				if Entity.GetHealth(hero) / Entity.GetMaxHealth(hero) <= 0.20 then
					Renderer.DrawTextCentered(fooAllInOne.font, w / 2, h / 2 + 300, "POSSIBLE PORT TARGET", 1)
					fooAllInOne.DrawProphetAwarenessMinimap(hero)
				end
			end
		end
	end
end

function fooAllInOne.DrawProphetAwarenessMinimap(hero)

	if not hero then return end
	if not Menu.IsEnabled(fooAllInOne.optionProphetDrawKSminimap) then return end

	local w, h = Renderer.GetScreenSize()
	local targetPos = Entity.GetAbsOrigin(hero)
	Renderer.SetDrawColor(255, 255, 255)

	position = fooAllInOne:WorldToMiniMap(targetPos, w, h)
	Renderer.DrawText(fooAllInOne.font, position:GetX(), position:GetY(), "X", 1)

end

function fooAllInOne.InvokerCombo(myHero, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroInvoker) then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end

	if os.clock() - fooAllInOne.invokerCaptureGhostwalkActivation < 1.0 then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then
		return
	end

	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
	local emp = NPC.GetAbility(myHero, "invoker_emp")
	local tornado = NPC.GetAbility(myHero, "invoker_tornado")
	local ghostWalk = NPC.GetAbility(myHero, "invoker_ghost_walk")
	local deafeningBlast = NPC.GetAbility(myHero, "invoker_deafening_blast")
	local chaosMeteor = NPC.GetAbility(myHero, "invoker_chaos_meteor")
	local iceWall = NPC.GetAbility(myHero, "invoker_ice_wall")
	local coldSnap = NPC.GetAbility(myHero, "invoker_cold_snap")
	local alacrity = NPC.GetAbility(myHero, "invoker_alacrity")
	local forgeSpirit = NPC.GetAbility(myHero, "invoker_forge_spirit")

	local invoke = NPC.GetAbility(myHero, "invoker_invoke")
	local myMana = NPC.GetMana(myHero)
	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)
	local blink = NPC.GetItem(myHero, "item_blink", true)
		if not Menu.IsEnabled(fooAllInOne.optionHeroInvokerBlink) then
			blink = nil
		end
	
	local euls = NPC.GetItem(myHero, "item_cyclone", true)

	local invokeTranslator = {
		"invoker_tornado",
		"invoker_emp",
		"invoker_chaos_meteor", 
		"invoker_deafening_blast",
		"invoker_sun_strike",
		"invoker_ice_wall",
		"invoker_cold_snap",
		"invoker_forge_spirit",
		"invoker_alacrity"
			}

	if Menu.IsKeyDown(fooAllInOne.optionHeroInvokerAltKey) and Menu.IsKeyDown(fooAllInOne.optionComboKey) then
		if fooAllInOne.InvokerComboSelector == 1 then
			fooAllInOne.PreInvokeSkills = {{coldSnap, forgeSpirit}}
		elseif fooAllInOne.InvokerComboSelector == 2 then
			fooAllInOne.PreInvokeSkills = {{coldSnap, forgeSpirit}}
		elseif fooAllInOne.InvokerComboSelector == 3 then
			fooAllInOne.PreInvokeSkills = {{emp, tornado}}
		elseif fooAllInOne.InvokerComboSelector == 4 then
			fooAllInOne.PreInvokeSkills = {{chaosMeteor, tornado}}
		elseif fooAllInOne.InvokerComboSelector == 5 then
			fooAllInOne.PreInvokeSkills = {{chaosMeteor, sunStrike}}
		elseif fooAllInOne.InvokerComboSelector == 6 then
			fooAllInOne.PreInvokeSkills = {{emp, tornado}}
		elseif fooAllInOne.InvokerComboSelector == 7 then
			fooAllInOne.PreInvokeSkills = {{sunStrike, tornado}}
		elseif fooAllInOne.InvokerComboSelector == 8 then
			fooAllInOne.PreInvokeSkills = {{sunStrike, tornado}}
		elseif fooAllInOne.InvokerComboSelector == 9 then
			fooAllInOne.PreInvokeSkills = {{emp, tornado}}
		elseif fooAllInOne.InvokerComboSelector == 10 then
			fooAllInOne.PreInvokeSkills = {{deafeningBlast, chaosMeteor}}
		elseif fooAllInOne.InvokerComboSelector == 12 then
			if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) <= 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)])}}
				elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])}}
				elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)])}}
				else
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])}}
				end
			end
		elseif fooAllInOne.InvokerComboSelector == 13 then
			if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) <= 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)])}}
				elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])}}
				elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)])}}
				else
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])}}
				end
			end
		elseif fooAllInOne.InvokerComboSelector == 14 then
			if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) <= 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)])}}
				elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])}}
				elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 9 then
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)])}}
				else
					fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])}}
				end
			end
		end
	end
	
	if fooAllInOne.getInvokerGhostWalkKey == nil then
		fooAllInOne.getInvokerGhostWalkKey = Config.ReadString("", "Ghost Walk Key0", defaultValue)
	end

	if Input.IsKeyDownOnce(fooAllInOne.getInvokerGhostWalkKey) then
		fooAllInOne.invokerCaptureGhostwalkActivation = os.clock()
	end
	
	if next(fooAllInOne.PreInvokeSkills) ~= nil then
		fooAllInOne.InvokerPreInvoke(myHero, myMana, invoke)
	end
	
	if Menu.IsKeyDown(fooAllInOne.optionHeroInvokerIcewallKey) then
		fooAllInOne.InvokerFastIceWall(myHero, myMana, invoke, enemy)
	end

	if Menu.IsKeyDown(fooAllInOne.optionHeroInvokerAlacrityKey) then
		fooAllInOne.InvokerFastAlacrity(myHero, myMana, invoke, enemy)
	end	

	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroInvokerCustom1Key) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 12 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) <= 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)])}}
						fooAllInOne.InvokerComboSelector = 12
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])}}
						fooAllInOne.InvokerComboSelector = 12
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)])}}
						fooAllInOne.InvokerComboSelector = 12
					else
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])}}
						fooAllInOne.InvokerComboSelector = 12
					end
				else
					fooAllInOne.InvokerComboSelector = 0
				end	
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 12 then
				fooAllInOne.InvokerComboSelector = 12
			end
		end
	end

	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroInvokerCustom2Key) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 13 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) <= 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)])}}
						fooAllInOne.InvokerComboSelector = 13
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])}}
						fooAllInOne.InvokerComboSelector = 13
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)])}}
						fooAllInOne.InvokerComboSelector = 13
					else
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])}}
						fooAllInOne.InvokerComboSelector = 13
					end
				else
					fooAllInOne.InvokerComboSelector = 0
				end		
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 13 then
				fooAllInOne.InvokerComboSelector = 13
			end
		end
	end

	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroInvokerCustom3Key) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 14 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) <= 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)])}}
						fooAllInOne.InvokerComboSelector = 14
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])}}
						fooAllInOne.InvokerComboSelector = 14
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)])}}
						fooAllInOne.InvokerComboSelector = 14
					else
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])}}
						fooAllInOne.InvokerComboSelector = 14
					end
				else
					fooAllInOne.InvokerComboSelector = 0
				end		
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 14 then
				fooAllInOne.InvokerComboSelector = 14
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerCancelEnable) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerCancelTPFog) then
			fooAllInOne.InvokerCancelTPingInFog(myHero, myMana, enemy, invoke, tornado)
		end
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerCancelBara) then
			fooAllInOne.InvokerCancelBaraCharge(myHero, myMana, enemy, invoke, coldSnap, tornado, deafeningBlast)
		end
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerCancelChannelling) then
			fooAllInOne.InvokerCancelVisibleChannellingAbilities(myHero, myMana, enemy, invoke, coldSnap, tornado)
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionKillStealInvokerTPpartice) then
		fooAllInOne.EnemyHPTracker(myHero)
	end

	if fooAllInOne.getInvokerSettings == nil then
		fooAllInOne.getInvokerSettings = Menu.GetValue(fooAllInOne.optionHeroInvokerDisableBuildInGetOption)
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerDisableBuildIn) then
		if fooAllInOne.getInvokerSettings > 0 then
			if Menu.IsKeyDown(fooAllInOne.optionComboKey) then
    				Menu.SetValue(fooAllInOne.optionHeroInvokerDisableBuildInGetOption, 0)
			else
				Menu.SetValue(fooAllInOne.optionHeroInvokerDisableBuildInGetOption, 1)
			end
		end
	end

	if Menu.IsKeyDown(fooAllInOne.optionComboKey) and not Menu.IsKeyDown(fooAllInOne.optionHeroInvokerAltKey) then
		if enemy and Entity.GetHealth(enemy) > 0 then
			if NPC.IsEntityInRange(myHero, enemy, 1500) and not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				if fooAllInOne.InvokerComboSelector == 0 then
					fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
				elseif fooAllInOne.InvokerComboSelector == 1 then
					fooAllInOne.InvokerComboCSAlacritySpirit(myHero, myMana, enemy, coldSnap, alacrity, forgeSpirit, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 2 then
					fooAllInOne.InvokerComboCSSpiritSunstrike(myHero, myMana, enemy, coldSnap, forgeSpirit, sunStrike, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 3 then
					fooAllInOne.InvokerComboTornadoEmpIcewall(myHero, myMana, enemy, tornado, emp, iceWall, coldSnap, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 4 then
					fooAllInOne.InvokerComboTornadoMeteorBlast(myHero, myMana, enemy, tornado, chaosMeteor, deafeningBlast, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 5 then
					fooAllInOne.InvokerComboEulsSunstrikeMeteorBlast(myHero, myMana, enemy, sunStrike, chaosMeteor, deafeningBlast, blink, euls, invoke)
				elseif fooAllInOne.InvokerComboSelector == 6 then
					fooAllInOne.InvokerComboAghaTornadoEmpMeteorBlast(myHero, myMana, enemy, tornado, emp, chaosMeteor, deafeningBlast, aghanims, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 7 then
					fooAllInOne.InvokerComboAghaTornadoSunstrikeMeteorBlast(myHero, myMana, enemy, tornado, sunStrike, chaosMeteor, deafeningBlast, aghanims, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 8 then
					fooAllInOne.InvokerComboRefresherAghaTornadoSunstrikeMeteorBlast(myHero, myMana, enemy, tornado, sunStrike, chaosMeteor, deafeningBlast, aghanims, refresher, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 9 then
					fooAllInOne.InvokerComboRefresherAghaTornadoEmpMeteorBlast(myHero, myMana, enemy, tornado, emp, chaosMeteor, deafeningBlast, aghanims, refresher, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 10 then
					fooAllInOne.InvokerComboRefresherAghaBlastMeteorSunstrike(myHero, myMana, enemy, deafeningBlast, chaosMeteor, sunStrike, blink, aghanims, refresher, invoke)
				elseif fooAllInOne.InvokerComboSelector == 11 then
					fooAllInOne.InvokerComboDynamicMode(myHero, myMana, enemy, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 12 then
					fooAllInOne.InvokerComboCustomMode(myHero, myMana, enemy, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 13 then
					fooAllInOne.InvokerComboCustomMode(myHero, myMana, enemy, blink, invoke)
				elseif fooAllInOne.InvokerComboSelector == 14 then
					fooAllInOne.InvokerComboCustomMode(myHero, myMana, enemy, blink, invoke)
				end
			else
				fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
			end
		end
	end

end

function fooAllInOne.InvokerIceWallHelper(myHero, enemy, iceWall, myMana)
	
	if not myHero then return end
	if not enemy then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end

	if not iceWall then return end
	if not Ability.IsReady(iceWall) or not Ability.IsCastable(iceWall, myMana) or not fooAllInOne.InvokerIsAbilityInvoked(myHero, iceWall) then return end
	if not NPC.IsEntityInRange(myHero, enemy, 600) then return end

	local betaRad = math.acos(200 / (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D())
	local beta = betaRad * 180 / math.pi
	local delta = math.acos((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Dot(Entity.GetRotation(myHero):GetForward()) / (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() * (Entity.GetRotation(myHero):GetForward()):Length2D()) * 180 / math.pi

	if NPC.IsEntityInRange(myHero, enemy, 275) then
		Ability.CastNoTarget(iceWall)
		return
	else
		if math.abs(delta - beta) > 7.5 then
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(5):Rotated(Angle(0, beta, 0)))
			return
		else
			Ability.CastNoTarget(iceWall)
			return
		end
	end

end		

function fooAllInOne.InvokerComboCSAlacritySpirit(myHero, myMana, enemy, coldSnap, alacrity, forgeSpirit, blink, invoke)

	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	fooAllInOne.itemUsage(myHero, enemy)

	if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_cold_snap", "invoker_forge_spirit") and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + 400) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(400))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
				return
			end
		else
			if fooAllInOne.SleepReady(0.05) and coldSnap and Ability.IsCastable(coldSnap, myMana) then
				Ability.CastTarget(coldSnap, enemy)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(0.05) and forgeSpirit and Ability.IsCastable(forgeSpirit, myMana) then
				Ability.CastNoTarget(forgeSpirit)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, alacrity) then
				fooAllInOne.invokerInvokeAbility(myHero, alacrity)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end
	if not Ability.IsReady(coldSnap) and not Ability.IsReady(forgeSpirit) then
		if fooAllInOne.SleepReady(0.05) and alacrity and Ability.IsCastable(alacrity, myMana) then
			Ability.CastTarget(alacrity, myHero)
			fooAllInOne.lastTick = os.clock()
			return
		end
	end

	fooAllInOne.invokerForgedSpiritController(myHero, enemy)

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(coldSnap) and not Ability.IsReady(forgeSpirit) and not Ability.IsReady(alacrity) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	return


end

function fooAllInOne.InvokerComboCSSpiritSunstrike(myHero, myMana, enemy, coldSnap, forgeSpirit, sunStrike, blink, invoke)

	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	fooAllInOne.itemUsage(myHero, enemy)

	if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_cold_snap", "invoker_forge_spirit") and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + 400) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(400))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
				return
			end
		else
			if fooAllInOne.SleepReady(0.05) and coldSnap and Ability.IsCastable(coldSnap, myMana) then
				Ability.CastTarget(coldSnap, enemy)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if not Ability.IsReady(coldSnap) and fooAllInOne.SleepReady(0.05) and forgeSpirit and Ability.IsCastable(forgeSpirit, myMana) then
				Ability.CastNoTarget(forgeSpirit)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if not Ability.IsReady(forgeSpirit) and fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
				fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end
	
	fooAllInOne.invokerForgedSpiritController(myHero, enemy)

	if not Ability.IsReady(coldSnap) and not Ability.IsReady(forgeSpirit) then
		if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
			if not Entity.IsTurning(enemy) then
				Ability.CastPosition(sunStrike, fooAllInOne.castPrediction(myHero, enemy, Ability.GetCastPoint(NPC.GetAbility(myHero, "invoker_sun_strike")) + 1.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(coldSnap) and not Ability.IsReady(forgeSpirit) and not Ability.IsReady(sunStrike) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	return

end


function fooAllInOne.InvokerComboTornadoEmpIcewall(myHero, myMana, enemy, tornado, emp, iceWall, coldSnap, blink, invoke)

	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	local rangeChecker
		if 400 + (400 * Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1))) < 1000 then
			rangeChecker = 400 + (400 * Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)))
		else
			rangeChecker = 1000
		end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
		fooAllInOne.itemUsage(myHero, enemy)
	else
		if not Ability.IsReady(tornado) then
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(emp), Ability.GetName(tornado)) and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, 1000) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					fooAllInOne.noItemCastFor(0.5)
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(600))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.5)
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
				fooAllInOne.noItemCastFor(0.5)
				return
			end
		else
			local travelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
			local tornadoTiming = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + travelTime
			if tornadoTiming < 2.9 then
				if fooAllInOne.SleepReady(0.05) and emp and Ability.IsCastable(emp, myMana) then
					if NPC.IsEntityInRange(myHero, enemy, 925) then
						Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.lastCastTime = os.clock()
						return
					else
						Ability.CastPosition(emp, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(925))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.lastCastTime = os.clock()
						return
					end
				end
				if not Ability.IsReady(emp) then
					if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
						if os.clock() - fooAllInOne.lastCastTime <= 2.9 - tornadoTiming - 0.5 then
							fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
							return
						else	
							if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
								local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
								Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
								fooAllInOne.lastTick = os.clock()
								fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
								return
							else
								Ability.CastPosition(tornado, Input.GetWorldCursorPos())
								fooAllInOne.lastTick = os.clock()
								fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
								return
							end
						end
					end
				end
			else
				if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
						local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
						Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.lastCastTime = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					else
						Ability.CastPosition(tornado, Input.GetWorldCursorPos())
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.lastCastTime = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					end
				end
				if fooAllInOne.SleepReady(0.05) and emp and Ability.IsCastable(emp, myMana) then
					local travelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
					local tornadoTiming = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + travelTime
					if os.clock() - fooAllInOne.lastCastTime > tornadoTiming - 2.9 + 0.05 then
						if NPC.IsEntityInRange(myHero, enemy, 925) then
							Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy))
							fooAllInOne.lastTick = os.clock()
							return
						else
							Ability.CastPosition(emp, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(925))
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			end
			if not Ability.IsReady(emp) and not Ability.IsReady(tornado) and NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				local distance = math.abs((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - 550)
				local timeToTarget = distance / NPC.GetMoveSpeed(myHero)
				if GameRules.GetGameTime() + timeToTarget <= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) then
					if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, iceWall) then
						fooAllInOne.invokerInvokeAbility(myHero, iceWall)
						fooAllInOne.lastTick = os.clock()
						return
					end
				else
					if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, coldSnap) then
						fooAllInOne.invokerInvokeAbility(myHero, coldSnap)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
		end
	end

	if not Ability.IsReady(tornado) and not Ability.IsReady(emp) then
		if fooAllInOne.InvokerIsAbilityInvoked(myHero, iceWall) then
			if fooAllInOne.SleepReady(0.05) and iceWall and Ability.IsCastable(iceWall, myMana) then
				if not NPC.IsEntityInRange(myHero, enemy, 550) then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(500), myHero)
				else
					fooAllInOne.InvokerIceWallHelper(myHero, enemy, iceWall, myMana)
				--	Ability.CastNoTarget(iceWall)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
		if fooAllInOne.InvokerIsAbilityInvoked(myHero, coldSnap) then
			if fooAllInOne.SleepReady(0.05) and coldSnap and Ability.IsCastable(coldSnap, myMana) then
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero) - 25), myHero)
					end
				else
					Ability.CastTarget(coldSnap, enemy)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(tornado) and not Ability.IsReady(emp) and (not Ability.IsReady(coldSnap) or not Ability.IsReady(iceWall)) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return

end

function fooAllInOne.InvokerComboTornadoMeteorBlast(myHero, myMana, enemy, tornado, chaosMeteor, deafeningBlast, blink, invoke)

	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
		fooAllInOne.itemUsage(myHero, enemy)
	else
		if not Ability.IsReady(tornado) then
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end	

	if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(chaosMeteor), Ability.GetName(tornado)) and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, 950) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					fooAllInOne.noItemCastFor(0.5)
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(600))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.5)
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
				fooAllInOne.noItemCastFor(0.5)
				return
			end
		else
			local travelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
			local tornadoTiming = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + travelTime
			if tornadoTiming < 1.3 then
				if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
					Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(250))
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.lastCastTime = os.clock()
					return
				end
				if not Ability.IsReady(chaosMeteor) then
					if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
						if os.clock() - fooAllInOne.lastCastTime <= 1.3 - tornadoTiming then
							fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
							return
						else	
							if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
								local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
								Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
								fooAllInOne.lastTick = os.clock()
								return
							else
								Ability.CastPosition(tornado, Input.GetWorldCursorPos())
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
				end
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					if fooAllInOne.SleepReady(0.05) and not Ability.IsReady(tornado) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
						fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			else
				if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
						local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
						Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					else
						Ability.CastPosition(tornado, Input.GetWorldCursorPos())
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					end
				end
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					if fooAllInOne.SleepReady(0.05) and not Ability.IsReady(tornado) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
						fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
		end
	end

	if not Ability.IsReady(tornado) then
		if Ability.IsReady(chaosMeteor) and NPC.HasModifier(enemy, "modifier_invoker_tornado") then
			local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - NPC.GetAttackRange(myHero)
				if distance < 0 then
					distance = 0
				end
			local timeToPosition = distance / NPC.GetMoveSpeed(myHero)
			if GameRules.GetGameTime() + timeToPosition < Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
				if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)), myHero)	
				else
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
						if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
							Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			else
				if not NPC.IsEntityInRange(myHero, enemy, 950) then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(950), myHero)	
				else
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
						if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
							Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			end
		else
			if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
						Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						return
					end
				else
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(tornado) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return

end

function fooAllInOne.InvokerComboEulsSunstrikeMeteorBlast(myHero, myMana, enemy, sunStrike, chaosMeteor, deafeningBlast, blink, euls, invoke)

	if not euls then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(chaosMeteor), Ability.GetName(sunStrike)) and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, 550) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					fooAllInOne.noItemCastFor(0.5)
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(500))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.5)
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_eul_cyclone") then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy), myHero)
				fooAllInOne.noItemCastFor(0.5)
				return
			end
		else
			if fooAllInOne.SleepReady(0.05) and euls and Ability.IsCastable(euls, myMana) then
				Ability.CastTarget(euls, enemy)
				fooAllInOne.lastTick = os.clock()
				fooAllInOne.noItemCastFor(2.5)
				return
			end
			if NPC.HasModifier(enemy, "modifier_eul_cyclone") then
				if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_eul_cyclone")) - 1.7 then
					if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
						Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
			if fooAllInOne.SleepReady(0.05) and not Ability.IsReady(sunStrike) and invoke and Ability.IsCastable(invoke, myMana) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
				fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end
	if fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and not Ability.IsReady(sunStrike) then
		if NPC.HasModifier(enemy, "modifier_eul_cyclone") then
			if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_eul_cyclone")) - 1.3 then
				if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
					Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
			local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
			if not Ability.IsReady(chaosMeteor) then
				if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_eul_cyclone")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
	end

	fooAllInOne.itemUsage(myHero, enemy)

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(sunStrike) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_eul_cyclone") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return

end


function fooAllInOne.InvokerComboAghaTornadoEmpMeteorBlast(myHero, myMana, enemy, tornado, emp, chaosMeteor, deafeningBlast, aghanims, blink, invoke)

	if not aghanims and not NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
		fooAllInOne.itemUsage(myHero, enemy)
	else
		if not Ability.IsReady(tornado) then
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(emp), Ability.GetName(tornado)) and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, 1000) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					fooAllInOne.noItemCastFor(0.5)
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(600))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.5)
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
				fooAllInOne.noItemCastFor(0.5)
				return
			end
		else
			if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
					local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
					Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.lastCastTime = os.clock()
					fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
					return
				else
					Ability.CastPosition(tornado, Input.GetWorldCursorPos())
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.lastCastTime = os.clock()
					fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
					return
				end
			end
			if not Ability.IsReady(tornado) then
				if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, chaosMeteor) then
					fooAllInOne.invokerInvokeAbility(myHero, chaosMeteor)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end	
		end
	end

	if not Ability.IsReady(tornado) and fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(chaosMeteor), Ability.GetName(emp)) then
		if fooAllInOne.SleepReady(0.05) and emp and Ability.IsCastable(emp, myMana) then
			local travelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
			local tornadoTiming = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + travelTime
			if os.clock() - fooAllInOne.lastCastTime > tornadoTiming - 2.9 + 0.25 then
				if NPC.IsEntityInRange(myHero, enemy, 925) then
					Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				else
					Ability.CastPosition(emp, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(925))
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
		if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
			if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
				local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - NPC.GetAttackRange(myHero)
					if distance < 0 then
						distance = 0
					end
				local timeToPosition = distance / NPC.GetMoveSpeed(myHero)
				if GameRules.GetGameTime() + timeToPosition < Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
					if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)), myHero)	
					else
						if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
							if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
								Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
				else
					if not NPC.IsEntityInRange(myHero, enemy, 950) then
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(950), myHero)	
					else
						if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
							if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
								Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
				end
			end
		end			
	end
	if not Ability.IsReady(chaosMeteor) then
		if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
			fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
			fooAllInOne.lastTick = os.clock()
			return
		end
		if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
			if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
				if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end
			else
				Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(tornado) and not Ability.IsReady(emp) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return

	
end

function fooAllInOne.InvokerComboAghaTornadoSunstrikeMeteorBlast(myHero, myMana, enemy, tornado, sunStrike, chaosMeteor, deafeningBlast, aghanims, blink, invoke)

	if not aghanims and not NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
		fooAllInOne.itemUsage(myHero, enemy)
	else
		if not Ability.IsReady(tornado) then
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(sunStrike), Ability.GetName(tornado)) and invoke and Ability.IsReady(invoke) then
		if not NPC.IsEntityInRange(myHero, enemy, 1000) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					fooAllInOne.noItemCastFor(0.5)
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(600))
					return
				else
					if fooAllInOne.SleepReady(0.1) then
						Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor(0.5)
						return
					end
				end
			end
			if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
				fooAllInOne.noItemCastFor(0.5)
				return
			end
		else
			if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
					local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
					Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
					return
				else
					Ability.CastPosition(tornado, Input.GetWorldCursorPos())
					fooAllInOne.lastTick = os.clock()
					fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
					return
				end
			end
			if not Ability.IsReady(tornado) then
				if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, chaosMeteor) then
					fooAllInOne.invokerInvokeAbility(myHero, chaosMeteor)
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end
	end
		
	if NPC.HasModifier(enemy, "modifier_invoker_tornado") and fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(chaosMeteor), Ability.GetName(sunStrike)) then
		if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
			local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - NPC.GetAttackRange(myHero)
				if distance < 0 then
					distance = 0
				end
			local timeToPosition = distance / NPC.GetMoveSpeed(myHero)
			if GameRules.GetGameTime() + timeToPosition < Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7 then
				if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)), myHero)	
				else
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7 then
						if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
							Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy))
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			else
				if not NPC.IsEntityInRange(myHero, enemy, 950) then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(950), myHero)	
				else
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7 then
						if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
							Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy))
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			end
		end			
		
		if not Ability.IsReady(tornado) and not Ability.IsReady(sunStrike) then
			if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
					if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
						Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(250))
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
		end
	end

	if not Ability.IsReady(chaosMeteor) then
		if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
			fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
			fooAllInOne.lastTick = os.clock()
			return
		end
		if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
			if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
				if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end
			else
				Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
				return
			end	
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(tornado) and not Ability.IsReady(sunStrike) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return
		
end

function fooAllInOne.InvokerComboRefresherAghaTornadoSunstrikeMeteorBlast(myHero, myMana, enemy, tornado, sunStrike, chaosMeteor, deafeningBlast, aghanims, refresher, blink, invoke)

	if not aghanims and not NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then return end
	if not refresher then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
		fooAllInOne.itemUsage(myHero, enemy)
	else
		if not Ability.IsReady(tornado) or not Ability.IsReady(refresher) then
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if Ability.IsReady(refresher) then
		if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(sunStrike), Ability.GetName(tornado)) and invoke and Ability.IsReady(invoke) then
			if not NPC.IsEntityInRange(myHero, enemy, 1000) then
				if blink and Ability.IsReady(blink) then
					if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
						fooAllInOne.noItemCastFor(0.5)
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(600))
						return
					else
						if fooAllInOne.SleepReady(0.1) then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
							fooAllInOne.lastTick = os.clock()
							fooAllInOne.noItemCastFor(0.5)
							return
						end
					end
				end
				if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
					fooAllInOne.noItemCastFor(0.5)
					return
				end
			else
				if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
						local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
						Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					else
						Ability.CastPosition(tornado, Input.GetWorldCursorPos())
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					end
				end
				if not Ability.IsReady(tornado) then
					if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, chaosMeteor) then
						fooAllInOne.invokerInvokeAbility(myHero, chaosMeteor)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
		end
		
		if NPC.HasModifier(enemy, "modifier_invoker_tornado") and fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(chaosMeteor), Ability.GetName(sunStrike)) then
			if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
				local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - NPC.GetAttackRange(myHero)
					if distance < 0 then
						distance = 0
					end
				local timeToPosition = distance / NPC.GetMoveSpeed(myHero)
				if GameRules.GetGameTime() + timeToPosition < Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7 then
					if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)), myHero)	
					else
						if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7 then
							if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
								Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy))
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
				else
					if not NPC.IsEntityInRange(myHero, enemy, 950) then
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(950), myHero)	
					else
						if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7 then
							if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
								Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy))
								fooAllInOne.lastTick = os.clock()
								return
							end
						end
					end
				end
			end			
		
			if not Ability.IsReady(tornado) and not Ability.IsReady(sunStrike) then
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
						if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
							Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(250))
							fooAllInOne.lastTick = os.clock()
							return
						end
					end
				end
			end
		end
		

		if not Ability.IsReady(chaosMeteor) then
			if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
				fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
						Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						return
					end
				else
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end	
			end
		end

		if not Ability.IsReady(tornado) and not Ability.IsReady(sunStrike) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(deafeningBlast) then
			if refresher and Ability.IsCastable(refresher, myMana) then
				Ability.CastNoTarget(refresher)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if not Ability.IsReady(refresher) and Ability.SecondsSinceLastUse(refresher) > 0 and Ability.SecondsSinceLastUse(refresher) < 3 then
		if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
			Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy))
			fooAllInOne.lastTick = os.clock()
			return
		end
		if not Ability.IsReady(chaosMeteor) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
			if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
				fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
		if fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
			if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
					Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(300))
					fooAllInOne.lastTick = os.clock()
					return
			end
		end
		if not Ability.IsReady(sunStrike) then
			if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
				Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(refresher) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(sunStrike) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end
	
	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return		
end

function fooAllInOne.InvokerComboRefresherAghaTornadoEmpMeteorBlast(myHero, myMana, enemy, tornado, emp, chaosMeteor, deafeningBlast, aghanims, refresher, blink, invoke)

	if not aghanims and not NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then return end
	if not refresher then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
		fooAllInOne.itemUsage(myHero, enemy)
	else
		if not Ability.IsReady(tornado) or not Ability.IsReady(refresher) then
			fooAllInOne.itemUsage(myHero, enemy)
		end
	end

	if Ability.IsReady(refresher) then
		if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(emp), Ability.GetName(tornado)) and invoke and Ability.IsReady(invoke) then
			if not NPC.IsEntityInRange(myHero, enemy, 1000) then
				if blink and Ability.IsReady(blink) then
					if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
						fooAllInOne.noItemCastFor(0.5)
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(600))
						return
					else
						if fooAllInOne.SleepReady(0.1) then
							Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION, target, Entity.GetAbsOrigin(enemy), ability, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, npc, queue, showEffects)
							fooAllInOne.lastTick = os.clock()
							fooAllInOne.noItemCastFor(0.5)
							return
						end
					end
				end
				if not blink or (blink and not Ability.IsReady(blink)) and not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
					fooAllInOne.noItemCastFor(0.5)
					return
				end
			else
				if fooAllInOne.SleepReady(0.05) and tornado and Ability.IsCastable(tornado, myMana) then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerSkillshotStyle) == 0 then
						local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
						Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, enemy, tornadoPrediction))
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.lastCastTime = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					else
						Ability.CastPosition(tornado, Input.GetWorldCursorPos())
						fooAllInOne.lastTick = os.clock()
						fooAllInOne.lastCastTime = os.clock()
						fooAllInOne.noItemCastFor((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + 0.5)
						return
					end
				end
				if not Ability.IsReady(tornado) then
					if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, chaosMeteor) then
						fooAllInOne.invokerInvokeAbility(myHero, chaosMeteor)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end	
			end
		end

		if not Ability.IsReady(tornado) and fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(chaosMeteor), Ability.GetName(emp)) then
			if fooAllInOne.SleepReady(0.05) and emp and Ability.IsCastable(emp, myMana) then
				local travelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
				local tornadoTiming = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + travelTime
				if os.clock() - fooAllInOne.lastCastTime > tornadoTiming - 2.9 + 0.25 then
					if NPC.IsEntityInRange(myHero, enemy, 925) then
						Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						return
					else
						Ability.CastPosition(emp, Entity.GetAbsOrigin(myHero) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(925))
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
			if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
					local distance = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() - NPC.GetAttackRange(myHero)
						if distance < 0 then
							distance = 0
						end
					local timeToPosition = distance / NPC.GetMoveSpeed(myHero)
					if GameRules.GetGameTime() + timeToPosition < Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
						if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
							fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)), myHero)	
						else
							if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
								if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
									Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
									fooAllInOne.lastTick = os.clock()
									return
								end
							end
						end
					else
						if not NPC.IsEntityInRange(myHero, enemy, 950) then
							fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(950), myHero)	
						else
							if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3 then
								if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
									Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
									fooAllInOne.lastTick = os.clock()
									return
								end
							end
						end
					end
				end
			end			
		end		

		if not Ability.IsReady(chaosMeteor) then
			if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and fooAllInOne.InvokerIsSkillInvokable(myHero, deafeningBlast) then
				fooAllInOne.invokerInvokeAbility(myHero, deafeningBlast)
				fooAllInOne.lastTick = os.clock()
				return
			end
			if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
				if NPC.HasModifier(enemy, "modifier_invoker_tornado") then
					local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
					if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
						Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						return
					end
				else
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end
			end
		end

		if not Ability.IsReady(tornado) and not Ability.IsReady(emp) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(deafeningBlast) then
			if refresher and Ability.IsCastable(refresher, myMana) then
				Ability.CastNoTarget(refresher)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if not Ability.IsReady(refresher) and Ability.SecondsSinceLastUse(refresher) > 0 and Ability.SecondsSinceLastUse(refresher) < 3 then
		if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
			Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy))
			fooAllInOne.lastTick = os.clock()
			return
		end
		if not Ability.IsReady(chaosMeteor) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, emp) then
			if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, emp) then
				fooAllInOne.invokerInvokeAbility(myHero, emp)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
		if fooAllInOne.InvokerIsAbilityInvoked(myHero, emp) then
			if fooAllInOne.SleepReady(0.05) and emp and Ability.IsCastable(emp, myMana) then
				if NPC.IsEntityInRange(myHero, enemy, 625) then
							Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(300))
							fooAllInOne.lastTick = os.clock()
							return
						else
							Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy))
							fooAllInOne.lastTick = os.clock()
							return
						end
					Ability.CastPosition(emp, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
			end
		end
		if not Ability.IsReady(emp) then
			if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) and fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) then
				Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(refresher) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(emp) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	if not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	end
	return		
end

function fooAllInOne.InvokerComboRefresherAghaBlastMeteorSunstrike(myHero, myMana, enemy, deafeningBlast, chaosMeteor, sunStrike, blink, aghanims, refresher, invoke)

	if not aghanims and not NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then return end
	if not refresher then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end
	fooAllInOne.itemUsage(myHero, enemy)

	if Ability.IsReady(refresher) then
		if fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(deafeningBlast), Ability.GetName(chaosMeteor)) and invoke and Ability.IsReady(invoke) then
			if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)) then
				if blink and Ability.IsReady(blink) then
					if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
						Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)-50))
						fooAllInOne.lastTick = os.clock()
						return
					else
						fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION", nil, Entity.GetAbsOrigin(enemy), myHero)
						return
					end
				end
				if not blink or (blink and not Ability.IsReady(blink)) then
					fooAllInOne.GenericAttackIssuer("Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil, myHero)
					return
				end
			else
				if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) then
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end

				if not Ability.IsReady(deafeningBlast) then
					if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
						Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy))
						fooAllInOne.lastTick = os.clock()
						return
					end
				end

				if not Ability.IsReady(deafeningBlast) and not Ability.IsReady(chaosMeteor) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
					if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
						fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
						fooAllInOne.lastTick = os.clock()
						return
					end
				end
			end
		end
		
		if NPC.HasModifier(enemy, "modifier_invoker_deafening_blast_knockback") and fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(sunStrike), Ability.GetName(deafeningBlast)) then
			if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
				Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(300))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	
		if not Ability.IsReady(deafeningBlast) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(sunStrike) then
			if refresher and Ability.IsCastable(refresher, myMana) then
				Ability.CastNoTarget(refresher)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if not Ability.IsReady(refresher) and Ability.SecondsSinceLastUse(refresher) > 0 and Ability.SecondsSinceLastUse(refresher) < 3 then
		if fooAllInOne.SleepReady(0.05) and deafeningBlast and Ability.IsCastable(deafeningBlast, myMana) then
			if NPC.HasModifier(enemy, "modifier_invoker_deafening_blast_knockback") then
				local blastTime = ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) - 0.25
				if GameRules.GetGameTime() >= Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_deafening_blast_knockback")) - blastTime - NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) then
					Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
					fooAllInOne.lastTick = os.clock()
					return
				end
			else
				Ability.CastPosition(deafeningBlast, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
		if not Ability.IsReady(deafeningBlast) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, chaosMeteor) then
			if fooAllInOne.SleepReady(0.05) and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, chaosMeteor) then
				fooAllInOne.invokerInvokeAbility(myHero, chaosMeteor)
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
		if not Ability.IsReady(deafeningBlast) and fooAllInOne.InvokerIsAbilityInvoked(myHero, chaosMeteor) then
			if fooAllInOne.SleepReady(0.05) and sunStrike and Ability.IsCastable(sunStrike, myMana) then
				Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(300))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
		if not Ability.IsReady(deafeningBlast) and fooAllInOne.InvokerIsAbilityInvoked(myHero, chaosMeteor) and not Ability.IsReady(sunStrike) then
			if fooAllInOne.SleepReady(0.05) and chaosMeteor and Ability.IsCastable(chaosMeteor, myMana) then
				Ability.CastPosition(chaosMeteor, Entity.GetAbsOrigin(enemy))
				fooAllInOne.lastTick = os.clock()
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if not Ability.IsReady(refresher) and not Ability.IsReady(chaosMeteor) and not Ability.IsReady(sunStrike) and not Ability.IsReady(deafeningBlast) then
			fooAllInOne.InvokerComboSelector = 11
		end
	end

	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
	fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
	return

end

function fooAllInOne.InvokerSkillProcessingTornado(myHero, myMana, enemy)

	if not enemy then return end

	local tornado = NPC.GetAbility(myHero, "invoker_tornado")
		if not tornado then return end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local blastTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration

	local curTime = GameRules.GetGameTime()

	local delay
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_emp")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_emp")) <= 2.9 then
		if tornadoTiming > 2.95 then
			delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_emp")) + 2.95 - tornadoTravelTime
		else
			delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
		end
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_sun_strike")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_sun_strike")) <= 1.7 then
		if tornadoTiming > 1.75 then
			delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_sun_strike")) + 1.75 - tornadoTravelTime + 0.1
		else
			delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
		end
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) <= 1.3 + 2 then
		if tornadoTiming > 1.3 then
			delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) + 3.0 - tornadoTravelTime
		else
			delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
		end
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) <= Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) * 0.25 + blastTravelTime then
		if tornadoTiming > Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) * 0.25 + blastTravelTime then
			delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) + Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) * 0.25 + blastTravelTime - tornadoTravelTime
		else
			delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
		end
	elseif NPC.HasModifier(enemy, "modifier_invoker_cold_snap") then
		delay = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_cold_snap")) - 0.1 - tornadoTravelTime
	elseif  NPC.HasModifier(enemy, "modifier_sheepstick_debuff") then
		delay = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_sheepstick_debuff")) - 0.1 - tornadoTravelTime
	elseif fooAllInOne.TargetDisableTimer(myHero, enemy) > 0 then
		delay = fooAllInOne.TargetDisableTimer(myHero, enemy) + 0.05 - tornadoTravelTime
	else
		delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
	end
		

	return { delay, fooAllInOne.castLinearPrediction(myHero, enemy, Ability.GetCastPoint(NPC.GetAbility(myHero, "invoker_tornado")) + (Entity.GetAbsOrigin(enemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)) }

end

function fooAllInOne.InvokerSkillProcessingEMP(myHero, myMana, enemy)

	if not enemy then return end

	local emp = NPC.GetAbility(myHero, "invoker_emp")
		if not emp then return end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration

	local curTime = GameRules.GetGameTime()

	local delay
	if fooAllInOne.InvokerLastCastedSkill == nil then
		delay = 0.05
	else
		if Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_tornado" then
			if fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming > curTime + 2.9 then
				delay = fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming - 2.9
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		else
			delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
		end
	end

	return { delay, Entity.GetAbsOrigin(enemy) }

end

function fooAllInOne.InvokerSkillProcessingMeteor(myHero, myMana, enemy)

	if not enemy then return end

	local chaosMeteor = NPC.GetAbility(myHero, "invoker_chaos_meteor")
		if not chaosMeteor then return end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration

	local curTime = GameRules.GetGameTime()

	local delay
	if fooAllInOne.InvokerLastCastedSkill == nil then
		if fooAllInOne.TargetIsInvulnarable(myHero, enemy) > 0 then
			local timing = fooAllInOne.TargetIsInvulnarable(myHero, enemy) - 1.25
			delay = timing
		else
			delay = 0.05
		end
	else
		if Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_tornado" then
			if fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming > curTime + 1.3 then
				delay = fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming - 1.3
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		else
			if fooAllInOne.TargetIsInvulnarable(myHero, enemy) > 0 then
				local timing = fooAllInOne.TargetIsInvulnarable(myHero, enemy) - 1.25
				delay = timing
			elseif not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) > 0 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + 0.5) then
					delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) + tornadoTiming - 1.3
				else
					delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
				end
			elseif NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				delay = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.3
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		end
	end

	local position = Vector()
	if NPC.HasModifier(enemy, "modifier_invoker_deafening_blast_knockback") or Ability.IsReady(NPC.GetAbility(myHero, "invoker_deafening_blast")) then
		position = Entity.GetAbsOrigin(enemy)
	elseif fooAllInOne.InvokerLastCastedSkill ~= nil and Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_deafening_blast" then
		position = Entity.GetAbsOrigin(enemy)
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100 + 0.25) then
		position = Entity.GetAbsOrigin(enemy)
	else
		position = (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(100))
	end

	return { delay, position }

end

function fooAllInOne.InvokerSkillProcessingBlast(myHero, myMana, enemy)

	if not enemy then return end

	local deafeningBlast = NPC.GetAbility(myHero, "invoker_deafening_blast")
		if not deafeningBlast then return end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration
	
	local curTime = GameRules.GetGameTime()

	local delay
	if fooAllInOne.InvokerLastCastedSkill == nil then
		if fooAllInOne.TargetIsInvulnarable(myHero, enemy) > 0 then
			local timing = fooAllInOne.TargetIsInvulnarable(myHero, enemy) - ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + 0.25
			delay = timing
		else
			delay = 0.05
		end
	else
		if Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_tornado" then
			if fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming > curTime + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100 - 0.25 then
				delay = fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming - ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + 0.25
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		else
			if fooAllInOne.TargetIsInvulnarable(myHero, enemy) > 0 then
				local timing = fooAllInOne.TargetIsInvulnarable(myHero, enemy) - ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + 0.25
				delay = timing
			elseif not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) > 0 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + 0.5) then
					delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) + tornadoTiming - ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + 0.25
				else
					delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
				end
			elseif NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				delay = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + 0.25
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		end
	end

	return { delay, Entity.GetAbsOrigin(enemy) }

end

function fooAllInOne.InvokerSkillProcessingSunstrike(myHero, myMana, enemy)

	if not enemy then return end

	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
		if not sunStrike then return end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration

	local curTime = GameRules.GetGameTime()

	local delay
	if fooAllInOne.InvokerLastCastedSkill == nil then
		if fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy) ~= nil and fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)[1] > 0 then
			local timing = fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)[1]
			delay = timing
		elseif NPC.HasItem(myHero, "item_rod_of_atos", true) and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_rod_of_atos", true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_rod_of_atos", true)) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1500 + 0.25) then
			delay = curTime + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1500 + 0.25
		else
			delay = 0.05
		end
	else
		if Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_tornado" then
			if fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming > curTime + 1.7 then
				delay = fooAllInOne.InvokerLastCastedSkillTime + tornadoTiming - 1.7
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		elseif Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "item_rod_of_atos" then
			delay = fooAllInOne.InvokerLastCastedSkillTime + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1500
		elseif Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "item_cyclone" then
			if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_cyclone", true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_cyclone", true)) < 2.55 then
				delay = curTime - Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_cyclone", true)) + 2.5 - 1.7
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end

		else
			if fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy) ~= nil and fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)[1] > 0 then
				local timing = fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)[1]
				delay = timing
			elseif not NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + 0.5) then
					delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) + tornadoTiming - 1.7
				else
					delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
				end
			elseif NPC.HasModifier(enemy, "modifier_invoker_tornado") then
				delay = Modifier.GetDieTime(NPC.GetModifier(enemy, "modifier_invoker_tornado")) - 1.7
			else
				delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		end
	end

	local position = Vector()
	if NPC.HasModifier(enemy, "modifier_invoker_deafening_blast_knockback") then
		position = (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(250))
--	elseif fooAllInOne.InvokerLastCastedSkill ~= nil and Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_deafening_blast" then
--		position = (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(300 - (curTime - fooAllInOne.InvokerLastCastedSkillTime)*150))
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_deafening_blast")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1100 + 0.25) then
		position = (Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(300))
	elseif NPC.HasModifier(enemy, "modifier_invoker_tornado") then
		position = Entity.GetAbsOrigin(enemy)
	else
		if fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy) ~= nil and fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)[1] > 0 then
			position = Entity.GetAbsOrigin(enemy)
		else
			position = fooAllInOne.castPrediction(myHero, enemy, Ability.GetCastPoint(NPC.GetAbility(myHero, "invoker_sun_strike")) + 1.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2))
		end
	end

	return { delay, position }

end

function fooAllInOne.InvokerSkillProcessingIcewall(myHero, myMana, enemy)

	if not enemy then return end

	local iceWall = NPC.GetAbility(myHero, "invoker_ice_wall")
		if not iceWall then return end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration

	local curTime = GameRules.GetGameTime()

	local delay
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + 0.1) then
		delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) + tornadoTiming - 0.5
	else
		delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
	end

	return { delay, nil }

end

function fooAllInOne.InvokerSkillProcessingEuls(myHero, myMana, enemy)

	if not enemy then return end

	local euls = NPC.GetItem(myHero, "item_cyclone", true)
		if not euls then return { 0.05, nil } end

	local tornadoTravelTime = (Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000
	local tornadoLiftDuration = fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]
	local tornadoTiming = tornadoTravelTime + tornadoLiftDuration

	local curTime = GameRules.GetGameTime()

	local delay
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))] + 0.1) then
		delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) + tornadoTiming + 0.15
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_emp")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_emp")) < 2.95 then
		delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_emp")) + 2.95
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_sun_strike")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_sun_strike")) < 1.8 then
		delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_sun_strike")) + 1.8
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) < 2.5 then
		delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) + 2.5
	elseif Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_cold_snap")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_cold_snap")) < 4 then
		delay = curTime - Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_chaos_meteor")) + 4
	else
		delay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
	end

	return { delay, enemy }
	

end

function fooAllInOne.InvokerComboCustomMode(myHero, myMana, enemy, blink, invoke)

	if not myHero then return end
	if not enemy then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500) then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	local skillTranslator = {
		"invoker_tornado",
		"invoker_emp",
		"invoker_chaos_meteor", 
		"invoker_deafening_blast",
		"invoker_sun_strike",
		"invoker_ice_wall",
		"invoker_cold_snap",
		"invoker_forge_spirit",
		"invoker_alacrity",
		"item_cyclone",
		"item_rod_of_atos",
		"item_refresher"
			}
		
	local skillOrder = {}
	if fooAllInOne.InvokerComboSelector == 12 then
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill5) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill5)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill6) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill6)])
		end
	elseif fooAllInOne.InvokerComboSelector == 13 then
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill5) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill5)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill6) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill6)])
		end
	elseif fooAllInOne.InvokerComboSelector == 14 then
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill5) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill5)])
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill6) > 0 then
			table.insert(skillOrder, skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill6)])
		end
	end

	local skillProcessing = { 
		["invoker_tornado"] = { "position", fooAllInOne.InvokerSkillProcessingTornado(myHero, myMana, enemy) }, 
		["invoker_emp"] = { "position", fooAllInOne.InvokerSkillProcessingEMP(myHero, myMana, enemy) },
		["invoker_chaos_meteor"] = { "position", fooAllInOne.InvokerSkillProcessingMeteor(myHero, myMana, enemy) },
		["invoker_deafening_blast"] = { "position", fooAllInOne.InvokerSkillProcessingBlast(myHero, myMana, enemy) },
		["invoker_sun_strike"] = { "position", fooAllInOne.InvokerSkillProcessingSunstrike(myHero, myMana, enemy) },
		["invoker_ice_wall"] = { "no target", fooAllInOne.InvokerSkillProcessingIcewall(myHero, myMana, enemy) },
		["invoker_cold_snap"] = { "target", enemy },
		["invoker_forge_spirit"] = { "no target", nil },
		["invoker_alacrity"] = { "target", myHero },
		["item_cyclone"] = { "target", fooAllInOne.InvokerSkillProcessingEuls(myHero, myMana, enemy) },
		["item_rod_of_atos"] = { "target", enemy },
		["item_refresher"] = { "no target", nil }
				}

	local readyTable = {}
	for i = 1, #skillOrder do
		if skillOrder[i] == "item_refresher" then
			if NPC.HasItem(myHero, skillOrder[i], true) then
				if Ability.IsReady(NPC.GetItem(myHero, skillOrder[i], true)) then
					table.insert(readyTable, NPC.GetItem(myHero, skillOrder[i], true))
				end
			else
				break	
			end
		elseif skillOrder[i] == "item_cyclone" then
			if NPC.HasItem(myHero, skillOrder[i], true) then
				if Ability.IsReady(NPC.GetItem(myHero, skillOrder[i], true)) then
					table.insert(readyTable, NPC.GetItem(myHero, skillOrder[i], true))
				end
			end
		elseif skillOrder[i] == "item_rod_of_atos" then
			if NPC.HasItem(myHero, skillOrder[i], true) then
				if Ability.IsReady(NPC.GetItem(myHero, skillOrder[i], true)) then
					table.insert(readyTable, NPC.GetItem(myHero, skillOrder[i], true))
				end
			end
		else
			if Ability.IsReady(NPC.GetAbility(myHero, skillOrder[i])) then
				table.insert(readyTable, NPC.GetAbility(myHero, skillOrder[i]))
			end
		end
	end

	if NPC.HasItem(myHero, "item_refresher", true) then
		if Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_refresher", true)) > -1 and Ability.SecondsSinceLastUse(NPC.GetItem(myHero, "item_refresher", true)) < 7 then
			for a, b in ipairs(skillOrder) do
				if b == "item_refresher" then
					readyTable = {}
					for i = a+1, #skillOrder do
						if Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) then
							table.insert(readyTable, NPC.GetAbilityByIndex(myHero, 4))
						end
						if Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) then
							table.insert(readyTable, NPC.GetAbilityByIndex(myHero, 3))
						end
						if skillOrder[i] == "item_cyclone" then
							if NPC.HasItem(myHero, "item_cyclone", true) then
								if Ability.IsReady(NPC.GetItem(myHero, "item_cyclone", true)) then
									table.insert(readyTable, NPC.GetItem(myHero, "item_cyclone", true))
								end
							end
						else
							if Ability.IsReady(NPC.GetAbility(myHero, skillOrder[i])) then
								table.insert(readyTable, NPC.GetAbility(myHero, skillOrder[i]))
							end
						end
					end
				end
			end
		end
	end

	local skill
		if #readyTable > 0 then
			skill = readyTable[1]
		else
			skill = nil
		end

	local invokeSkill
		if not Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) and Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) then
			if #readyTable > 1 then
				invokeSkill = readyTable[2]
			else
				invokeSkill = nil
			end
		elseif not Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) and not Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) then
			if #readyTable > 0 then
				invokeSkill = readyTable[1]
			else
				invokeSkill = nil
			end
		end

	if invokeSkill then
		if not fooAllInOne.InvokerIsAbilityInvoked(myHero, invokeSkill) then
			if GameRules.GetGameTime() - fooAllInOne.lastCastTime3 > 0.05 and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, invokeSkill) then
				fooAllInOne.invokerInvokeAbility(myHero, invokeSkill)
				fooAllInOne.lastCastTime3 = GameRules.GetGameTime()
				return
			end
		end
	end

	local processingTempTable = {}
		if skill then
			if Ability.GetName(skill) == "invoker_tornado" or Ability.GetName(skill) == "invoker_emp" or Ability.GetName(skill) == "invoker_chaos_meteor" or Ability.GetName(skill) == "invoker_deafening_blast" or Ability.GetName(skill) == "invoker_sun_strike" or Ability.GetName(skill) == "invoker_ice_wall" then
				table.insert(processingTempTable, skillProcessing[Ability.GetName(skill)][2])
			elseif NPC.HasItem(myHero, "item_cyclone", true) and Ability.GetName(skill) == "item_cyclone" then
				table.insert(processingTempTable, skillProcessing[Ability.GetName(skill)][2])
			else
				processingTempTable = {}
			end
		end

	local targetingStyle
		if skill then
			targetingStyle = skillProcessing[Ability.GetName(skill)][1]
		end

	local targetingDelay
		if skill then
			if fooAllInOne.InvokerLastCastedSkill == nil then
				targetingDelay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			elseif Ability.GetName(skill) == "invoker_tornado" or Ability.GetName(skill) == "invoker_emp" or Ability.GetName(skill) == "invoker_chaos_meteor" or Ability.GetName(skill) == "invoker_deafening_blast" or Ability.GetName(skill) == "invoker_sun_strike" or Ability.GetName(skill) == "invoker_ice_wall" then
				targetingDelay = processingTempTable[1][1]
			elseif NPC.HasItem(myHero, "item_cyclone", true) and Ability.GetName(skill) == "item_cyclone" then
				targetingDelay = processingTempTable[1][1]
			else
				targetingDelay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		end

	local targetingTarget	
		if skill then
			if Ability.GetName(skill) == "invoker_tornado" or Ability.GetName(skill) == "invoker_emp" or Ability.GetName(skill) == "invoker_chaos_meteor" or Ability.GetName(skill) == "invoker_deafening_blast" or Ability.GetName(skill) == "invoker_sun_strike" then
				targetingTarget = processingTempTable[1][2]
			elseif NPC.HasItem(myHero, "item_cyclone", true) and Ability.GetName(skill) == "item_cyclone" then
				targetingTarget = processingTempTable[1][2]
			else
				targetingTarget = skillProcessing[Ability.GetName(skill)][2]
			end
		end

	if skill and Ability.GetName(skill) == "invoker_tornado" then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
			fooAllInOne.itemUsage(myHero, enemy)
		else
			if not Ability.IsReady(skill) then
				fooAllInOne.itemUsage(myHero, enemy)
			end
		end
	else
		fooAllInOne.itemUsage(myHero, enemy)
	end

	if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
		fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
		fooAllInOne.invokerForgedSpiritController(myHero, enemy)
	end

	if skill then
		if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)+200) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)-100))
					return
				end
			end
		else
			if fooAllInOne.InvokerIsAbilityInvoked(myHero, skill) or Ability.GetName(skill) == "item_refresher" or Ability.GetName(skill) == "item_cyclone" or Ability.GetName(skill) == "item_rod_of_atos" then
				if GameRules.GetGameTime() > targetingDelay then
					if Ability.IsCastable(skill, myMana) then
						if skillProcessing[Ability.GetName(skill)][1] == "position" then
							if Ability.GetName(skill) == "invoker_tornado" then
								Ability.CastPosition(skill, targetingTarget)
								fooAllInOne.noItemCastFor(((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + 0.5)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							else
								Ability.CastPosition(skill, targetingTarget)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							end
						end
						if skillProcessing[Ability.GetName(skill)][1] == "target" then
							if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
								Ability.CastTarget(skill, targetingTarget)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							end
						end
						if skillProcessing[Ability.GetName(skill)][1] == "no target" then
							if Ability.GetName(skill) == "invoker_ice_wall" then
								if not NPC.IsEntityInRange(myHero, enemy, 600) then
									fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
									return
								else
									fooAllInOne.InvokerIceWallHelper(myHero, enemy, skill, myMana)
									fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime() + 0.1
									fooAllInOne.InvokerLastCastedSkill = skill
									return
								end
							else
								Ability.CastNoTarget(skill)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							end			
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionHeroInvokerSwitch) then
		if next(readyTable) == nil then
			fooAllInOne.InvokerComboSelector = 11
		end
	end
	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)

		
end

function fooAllInOne.InvokerComboDynamicMode(myHero, myMana, enemy, blink, invoke)

	if not myHero then return end
	if not enemy then return end
	if not NPC.IsEntityInRange(myHero, enemy, 1500) then return end
	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 0.25 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end

	local InvokerDynamicSpellsOrder = {}
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynCS) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynCS), "invoker_cold_snap" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynFS) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynFS), "invoker_forge_spirit" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynAL) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynAL), "invoker_alacrity" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynIW) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynIW), "invoker_ice_wall" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynTO) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynTO), "invoker_tornado" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynEMP) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynEMP), "invoker_emp" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynSS) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynSS), "invoker_sun_strike" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynCM) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynCM), "invoker_chaos_meteor" })
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerDynDB) > 0 then
		table.insert(InvokerDynamicSpellsOrder, { Menu.GetValue(fooAllInOne.optionHeroInvokerDynDB), "invoker_deafening_blast" })
	end

	table.sort(InvokerDynamicSpellsOrder, function(a, b)
        	return a[1] < b[1]
    	end)

	local skillPicker = {}
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerDynOrder) then
			i = 1
			repeat
				table.insert(skillPicker, InvokerDynamicSpellsOrder[i][2])
				i = i + 1
			until i > #InvokerDynamicSpellsOrder
		else
			skillPicker[1] = "invoker_cold_snap"
			skillPicker[2] = "invoker_forge_spirit"
			skillPicker[3] = "invoker_alacrity" 
			skillPicker[4] = "invoker_ice_wall"
			skillPicker[5] = "invoker_tornado"
			skillPicker[6] = "invoker_emp"
			skillPicker[7] = "invoker_sun_strike"
			skillPicker[8] = "invoker_chaos_meteor" 
			skillPicker[9] = "invoker_deafening_blast"
		end

	

	local skillProcessing = { 
		["invoker_tornado"] = { "position", fooAllInOne.InvokerSkillProcessingTornado(myHero, myMana, enemy) }, 
		["invoker_emp"] = { "position", fooAllInOne.InvokerSkillProcessingEMP(myHero, myMana, enemy) },
		["invoker_chaos_meteor"] = { "position", fooAllInOne.InvokerSkillProcessingMeteor(myHero, myMana, enemy) },
		["invoker_deafening_blast"] = { "position", fooAllInOne.InvokerSkillProcessingBlast(myHero, myMana, enemy) },
		["invoker_sun_strike"] = { "position", fooAllInOne.InvokerSkillProcessingSunstrike(myHero, myMana, enemy) },
		["invoker_ice_wall"] = { "no target", fooAllInOne.InvokerSkillProcessingIcewall(myHero, myMana, enemy) },
		["invoker_cold_snap"] = { "target", enemy },
		["invoker_forge_spirit"] = { "no target", nil },
		["invoker_alacrity"] = { "target", myHero }
				}

	local readyTable = {}
	for i = 1, #skillPicker do
		if Ability.IsReady(NPC.GetAbility(myHero, skillPicker[i])) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, NPC.GetAbility(myHero, skillPicker[i])) then
			table.insert(readyTable, NPC.GetAbility(myHero, skillPicker[i]))
		end
	end

	local skill
	local invokeSkill
	if Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_tornado" and fooAllInOne.TargetDisableTimer(myHero, enemy) == 0 then
		skill = NPC.GetAbilityByIndex(myHero, 3)	
	elseif Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) == "invoker_ice_wall" then
		if NPC.IsEntityInRange(myHero, enemy, 800) then
			skill = NPC.GetAbilityByIndex(myHero, 4)
		else
			if Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) then
				skill = NPC.GetAbilityByIndex(myHero, 3)
			else
				if next(readyTable) ~= nil then
					if #readyTable >= 1 then
						invokeSkill = readyTable[1]
					else
						skill = nil
						invokeSkill = nil
					end
				end
			end
		end
	elseif Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) == "invoker_ghost_walk" then
		if Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) then
			skill = NPC.GetAbilityByIndex(myHero, 3)
		else
			if next(readyTable) ~= nil then
				if #readyTable >= 1 then
					invokeSkill = readyTable[1]
				else
					skill = nil
					invokeSkill = nil
				end
			end
		end
	elseif Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_ghost_walk" then
		if Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) then
			skill = NPC.GetAbilityByIndex(myHero, 4)
		else
			if next(readyTable) ~= nil then
				if #readyTable >= 1 then
					invokeSkill = readyTable[1]
				else
					skill = nil
					invokeSkill = nil
				end
			end
		end
	elseif Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) == "invoker_tornado" and fooAllInOne.TargetDisableTimer(myHero, enemy) > 0 then
		skill = NPC.GetAbilityByIndex(myHero, 3)
	elseif Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) ~= "invoker_ghost_walk" then
		skill = NPC.GetAbilityByIndex(myHero, 4)
	elseif Ability.IsReady(NPC.GetAbilityByIndex(myHero, 3)) and Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) ~= "invoker_ghost_walk" then
		skill = NPC.GetAbilityByIndex(myHero, 3)
	end

	
	if not Ability.IsReady(NPC.GetAbilityByIndex(myHero, 4)) then
		if next(readyTable) ~= nil then
			if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_tornado")) < ((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000 + fooAllInOne.invokerTornadoLiftDuration[Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0))]) and NPC.GetCurrentLevel(myHero) >= 10 then
				if Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_emp" then
					if Ability.IsReady(NPC.GetAbility(myHero, "invoker_chaos_meteor")) then
						invokeSkill = NPC.GetAbility(myHero, "invoker_chaos_meteor")
					else
						if Ability.IsReady(NPC.GetAbility(myHero, "invoker_deafening_blast")) then
							invokeSkill = NPC.GetAbility(myHero, "invoker_deafening_blast")
						else
							invokeSkill = readyTable[1]
						end
					end
				elseif Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_sun_strike" then
					if Ability.IsReady(NPC.GetAbility(myHero, "invoker_chaos_meteor")) then
						invokeSkill = NPC.GetAbility(myHero, "invoker_chaos_meteor")
					else
						if Ability.IsReady(NPC.GetAbility(myHero, "invoker_deafening_blast")) then
							invokeSkill = NPC.GetAbility(myHero, "invoker_deafening_blast")
						else
							invokeSkill = readyTable[1]
						end
					end
				elseif Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_chaos_meteor" then
					if Ability.IsReady(NPC.GetAbility(myHero, "invoker_deafening_blast")) then
						invokeSkill = NPC.GetAbility(myHero, "invoker_deafening_blast")
					else
						invokeSkill = readyTable[1]
					end
				else
					invokeSkill = readyTable[1]
				end
			else
				if fooAllInOne.InvokerLastCastedSkill ~= nil and Ability.GetName(fooAllInOne.InvokerLastCastedSkill) == "invoker_deafening_blast" and Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == "invoker_chaos_meteor" then
					if Ability.IsReady(NPC.GetAbility(myHero, "invoker_sun_strike")) then
						invokeSkill = NPC.GetAbility(myHero, "invoker_sun_strike")
					else
						invokeSkill = readyTable[1]
					end
				elseif  Ability.GetName(readyTable[1]) == "invoker_ice_wall" and #readyTable >= 1 then
					if NPC.IsEntityInRange(myHero, enemy, 800) then
						invokeSkill = readyTable[1]
					else
						if #readyTable > 1 then
							invokeSkill = readyTable[2]
						else
							invokeSkill = nil
						end
					end
				elseif  Ability.GetName(readyTable[1]) == "invoker_sun_strike" and #readyTable >= 1 then
					if fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy) ~= nil and fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)[1] > 0 then
						invokeSkill = readyTable[1]
					else
						if NPC.HasModifier(enemy, "modifier_sheepstick_debuff") or NPC.HasModifier(enemy, "modifier_invoker_cold_snap") or NPC.HasModifier(enemy, "modifier_invoker_ice_wall_slow_debuff") then
							invokeSkill = readyTable[1]
						else
							if #readyTable > 1 then
								invokeSkill = readyTable[2]
							else
								invokeSkill = nil
							end
						end
					end
				else
					invokeSkill = readyTable[1]
				end
			end
		end
	end

	if invokeSkill then
		if not fooAllInOne.InvokerIsAbilityInvoked(myHero, invokeSkill) then
			if GameRules.GetGameTime() - fooAllInOne.lastCastTime3 > 0.05 and invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, invokeSkill) then
				fooAllInOne.invokerInvokeAbility(myHero, invokeSkill)
				fooAllInOne.lastCastTime3 = GameRules.GetGameTime()
				return
			end
		end
	end

	local processingTempTable = {}
		if skill then
			if Ability.GetName(skill) == "invoker_tornado" or Ability.GetName(skill) == "invoker_emp" or Ability.GetName(skill) == "invoker_chaos_meteor" or Ability.GetName(skill) == "invoker_deafening_blast" or Ability.GetName(skill) == "invoker_sun_strike" or Ability.GetName(skill) == "invoker_ice_wall" then
				table.insert(processingTempTable, skillProcessing[Ability.GetName(skill)][2])
			else
				processingTempTable = {}
			end
		end

	local targetingStyle
		if skill then
			targetingStyle = skillProcessing[Ability.GetName(skill)][1]
		end

	local targetingDelay
		if skill then
			if Ability.GetName(skill) == "invoker_tornado" or Ability.GetName(skill) == "invoker_emp" or Ability.GetName(skill) == "invoker_chaos_meteor" or Ability.GetName(skill) == "invoker_deafening_blast" or Ability.GetName(skill) == "invoker_sun_strike" or Ability.GetName(skill) == "invoker_ice_wall" then
				targetingDelay = processingTempTable[1][1]
			elseif Ability.GetName(skill) == "invoker_alacrity" or Ability.GetName(skill) == "invoker_forge_spirit" or Ability.GetName(skill) == "invoker_cold_snap" then
				targetingDelay = fooAllInOne.InvokerLastCastedSkillTime + 0.05
			end
		end

	local targetingTarget	
		if skill then
			if Ability.GetName(skill) == "invoker_tornado" or Ability.GetName(skill) == "invoker_emp" or Ability.GetName(skill) == "invoker_chaos_meteor" or Ability.GetName(skill) == "invoker_deafening_blast" or Ability.GetName(skill) == "invoker_sun_strike" then
				targetingTarget = processingTempTable[1][2]
			else
				targetingTarget = skillProcessing[Ability.GetName(skill)][2]
			end
		end

	if skill and Ability.GetName(skill) == "invoker_tornado" then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerTornadoItems) then
			fooAllInOne.itemUsage(myHero, enemy)
		else
			if not Ability.IsReady(skill) then
				fooAllInOne.itemUsage(myHero, enemy)
			end
		end
	else
		fooAllInOne.itemUsage(myHero, enemy)
	end

	if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
		if skill and not Ability.GetName(skill) == "invoker_ice_wall" then
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
			fooAllInOne.invokerForgedSpiritController(myHero, enemy)
		elseif not skill or (skill and not Ability.IsCastable(skill, myMana)) then
			fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
			fooAllInOne.invokerForgedSpiritController(myHero, enemy)
		end
	end

	if skill then
		if not NPC.IsEntityInRange(myHero, enemy, NPC.GetAttackRange(myHero)+200) then
			if blink and Ability.IsReady(blink) then
				if NPC.IsEntityInRange(myHero, enemy, 1150 + NPC.GetAttackRange(myHero)) then
					Ability.CastPosition(blink, Entity.GetAbsOrigin(enemy) + (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Normalized():Scaled(NPC.GetAttackRange(myHero)-100))
					return
				end
			end
		else
			if fooAllInOne.InvokerIsAbilityInvoked(myHero, skill) then
				if GameRules.GetGameTime() > targetingDelay then
					if Ability.IsCastable(skill, myMana) then
						if skillProcessing[Ability.GetName(skill)][1] == "position" then
							if Ability.GetName(skill) == "invoker_tornado" then
								Ability.CastPosition(skill, targetingTarget)
								fooAllInOne.noItemCastFor(((Entity.GetAbsOrigin(enemy) - Entity.GetAbsOrigin(myHero)):Length2D() / 1000) + 0.5)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							else
								Ability.CastPosition(skill, targetingTarget)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							end
						end
						if skillProcessing[Ability.GetName(skill)][1] == "target" then
							if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) then
								Ability.CastTarget(skill, targetingTarget)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							end
						end
						if skillProcessing[Ability.GetName(skill)][1] == "no target" then
							if Ability.GetName(skill) == "invoker_ice_wall" then
								if not NPC.IsEntityInRange(myHero, enemy, 600) then
									fooAllInOne.GenericMainAttack(myHero, "Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET", enemy, nil)
									return
								else
									fooAllInOne.InvokerIceWallHelper(myHero, enemy, skill, myMana)
									fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime() + 0.5
									fooAllInOne.InvokerLastCastedSkill = skill
									return
								end
							else
								Ability.CastNoTarget(skill)
								fooAllInOne.InvokerLastCastedSkillTime = GameRules.GetGameTime()
								fooAllInOne.InvokerLastCastedSkill = skill
								return
							end		
						end
					end
				end
			end
		end
	end
	fooAllInOne.invokerProcessInstancesWhileComboing(myHero)
end

function fooAllInOne.InvokerFastIceWall(myHero, myMana, invoke, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroInvokerIcewallEnable) then return end
	if not myHero then return end
	if enemy then
		if not NPC.IsEntityInRange(myHero, enemy, 600) then
			enemy = nil
		end
	end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	
	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then return end
	
	local iceWall = NPC.GetAbility(myHero, "invoker_ice_wall")
		if not iceWall then return end
		if not Ability.IsReady(iceWall) then return end

	if not fooAllInOne.InvokerIsAbilityInvoked(myHero, iceWall) then
		if invoke and Ability.IsCastable(invoke, myMana-175) and fooAllInOne.InvokerIsSkillInvokable(myHero, iceWall) then
			if enemy then
				fooAllInOne.invokerInvokeAbility(myHero, iceWall)
				fooAllInOne.InvokerIceWallHelper(myHero, enemy, iceWall, myMana)
				return
			else
				fooAllInOne.invokerInvokeAbility(myHero, iceWall)
				Ability.CastNoTarget(iceWall, true)
				return
			end
		end
	else
		if Ability.IsCastable(iceWall, myMana) then
			if enemy then
				fooAllInOne.InvokerIceWallHelper(myHero, enemy, iceWall, myMana)
			else
				Ability.CastNoTarget(iceWall)
				return
			end
		end
	end

end

function fooAllInOne.InvokerFastAlacrity(myHero, myMana, invoke, enemy)

	if not Menu.IsEnabled(fooAllInOne.optionHeroInvokerAlacrityEnable) then return end
	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	
	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then return end
	
	local alacrity = NPC.GetAbility(myHero, "invoker_alacrity")
		if not alacrity then return end
		if not Ability.IsReady(alacrity) then return end
	
	if not fooAllInOne.InvokerIsAbilityInvoked(myHero, alacrity) then
		if invoke and Ability.IsCastable(invoke, myMana-60) and fooAllInOne.InvokerIsSkillInvokable(myHero, alacrity) then
			fooAllInOne.invokerInvokeAbility(myHero, alacrity)
			Ability.CastTarget(alacrity, myHero)
			return
		end
	else
		if Ability.IsCastable(alacrity, myMana) then
			Ability.CastTarget(alacrity, myHero)
			return
		end
	end

end

function fooAllInOne.InvokerCancelTPingInFog(myHero, myMana, enemy, invoke, tornado)

	if Menu.IsKeyDownOnce(fooAllInOne.optionComboKey) then return end
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then return end

	if os.clock() - fooAllInOne.invokerChannellingKillstealTimer <= 3 then return end

	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then return end

	if not tornado then return end
	if not Ability.IsReady(tornado) then return end
	if not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) and not Ability.IsCastable(invoke, myMana) then return end

	if fooAllInOne.TPParticleUnit ~= nil and NPC.IsDormant(fooAllInOne.TPParticleUnit) then
		if fooAllInOne.TPParticleTime > 0 and fooAllInOne.TPParticlePosition:__tostring() ~= Vector(0.0, 0.0, 0.0):__tostring() and not fooAllInOne.invokerSunstrikeKSParticleProcess(myHero) then
			if (Entity.GetAbsOrigin(myHero) - fooAllInOne.TPParticlePosition):Length2D() < 2250 then
				if GameRules.GetGameTime() + ((Entity.GetAbsOrigin(myHero) - fooAllInOne.TPParticlePosition):Length2D() / 1000) < fooAllInOne.TPParticleTime + 2.75 then
					if NPC.IsPositionInRange(myHero, fooAllInOne.TPParticlePosition, (400 + Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) * 400), 0) then
						if tornado and Ability.IsReady(tornado) then
							if not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) then
								if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(tornado, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, tornado) then
									fooAllInOne.invokerInvokeAbility(myHero, tornado)
									Ability.CastPosition(tornado, Entity.GetAbsOrigin(myHero) + (fooAllInOne.TPParticlePosition - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(250), true)
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									return
								end
							else
								if Ability.IsCastable(tornado, myMana) then
									Ability.CastPosition(tornado, Entity.GetAbsOrigin(myHero) + (fooAllInOne.TPParticlePosition - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(250))
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									return
								end
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.InvokerCancelBaraCharge(myHero, myMana, enemy, invoke, coldSnap, tornado, deafeningBlast)

	if Menu.IsKeyDownOnce(fooAllInOne.optionComboKey) then return end
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then return end

	if os.clock() - fooAllInOne.invokerChannellingKillstealTimer <= 3 then return end

	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then return end

	if not coldSnap or not tornado or not deafeningBlast then return end
	if not Ability.IsReady(coldSnap) and not Ability.IsReady(tornado) and not Ability.IsReady(deafeningBlast) then return end
	if not fooAllInOne.InvokerIsAbilityInvoked(myHero, coldSnap) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, deafeningBlast) and not Ability.IsCastable(invoke, myMana) then return end

	local skillSelector
	if Ability.IsReady(coldSnap) then
		skillSelector = coldSnap
	else
		if Ability.IsReady(tornado) then
			skillSelector = tornado
		else
			if Ability.IsReady(deafeningBlast) then
				skillSelector = deafeningBlast
			end
		end
	end

	if not skillSelector then return end

	local castRange = 950
	if skillSelector ~= nil and skillSelector == tornado then
		castRange = 400 + Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) * 400
	end
	if castRange > 1750 then
		castRange = 1750
	end

	local cancelEnemies = NPC.GetHeroesInRadius(myHero, castRange, Enum.TeamType.TEAM_ENEMY)
	for _, cancelEnemy in ipairs(cancelEnemies) do
		if cancelEnemy and not NPC.IsDormant(cancelEnemy) and not NPC.IsIllusion(cancelEnemy) and Entity.IsAlive(cancelEnemy) then
			if NPC.HasModifier(cancelEnemy, "modifier_spirit_breaker_charge_of_darkness") then
				if not NPC.HasState(cancelEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then	
					if not NPC.IsLinkensProtected(cancelEnemy) then
						if skillSelector == coldSnap then
							if not fooAllInOne.InvokerIsAbilityInvoked(myHero, skillSelector) then
								if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(skillSelector, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, skillSelector) then
									fooAllInOne.invokerInvokeAbility(myHero, skillSelector)
									Ability.CastTarget(skillSelector, cancelEnemy, true)
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									break
									return
								end
							else
								if Ability.IsCastable(skillSelector, myMana) then
									Ability.CastTarget(skillSelector, cancelEnemy)
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									break
									return
								end
							end
						elseif skillSelector == deafeningBlast then
							local deafeningBlastPrediction = Ability.GetCastPoint(skillSelector) + (Entity.GetAbsOrigin(cancelEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2) + NPC.GetTimeToFace(myHero, cancelEnemy) + 1
							if NPC.IsRunning(cancelEnemy) and fooAllInOne.GetMoveSpeed(cancelEnemy) > 500 then
								if not fooAllInOne.InvokerIsAbilityInvoked(myHero, skillSelector) then
									if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(skillSelector, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, skillSelector) then
										fooAllInOne.invokerInvokeAbility(myHero, skillSelector)
										Ability.CastPosition(skillSelector, Entity.GetAbsOrigin(myHero) + (fooAllInOne.castLinearPrediction(myHero, cancelEnemy, deafeningBlastPrediction) - Entity.GetAbsOrigin(myHero)):Normalized():Scaled(50), true)
										fooAllInOne.invokerChannellingKillstealTimer = os.clock()
										break
										return
									end
								else
									if Ability.IsCastable(skillSelector, myMana) then
										Ability.CastPosition(deafeningBlast, fooAllInOne.castLinearPrediction(myHero, cancelEnemy, deafeningBlastPrediction))
										fooAllInOne.invokerChannellingKillstealTimer = os.clock()
										break
										return
									end
								end
							end
						end
					end		
					if skillSelector == tornado then
						local tornadoPrediction = Ability.GetCastPoint(tornado) + (Entity.GetAbsOrigin(cancelEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1000) * 1.25 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2) + 0.75 + NPC.GetTimeToFace(myHero, cancelEnemy)
						if NPC.IsRunning(cancelEnemy) and fooAllInOne.GetMoveSpeed(cancelEnemy) > 500 and not NPC.IsDormant(cancelEnemy) then
							if not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) then
								if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(skillSelector, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, skillSelector) then
									fooAllInOne.invokerInvokeAbility(myHero, tornado)
									Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, cancelEnemy, tornadoPrediction), true)
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									break
									return
								end
							else
								if Ability.IsCastable(tornado, myMana) then
									Ability.CastPosition(tornado, fooAllInOne.castLinearPrediction(myHero, cancelEnemy, tornadoPrediction))
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									break
									return
								end
							end
						end
					end
				end
			end
		end
	end
		
end

function fooAllInOne.InvokerCancelVisibleChannellingAbilities(myHero, myMana, enemy, invoke, coldSnap, tornado)

	if Menu.IsKeyDownOnce(fooAllInOne.optionComboKey) then return end
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then return end

	if os.clock() - fooAllInOne.invokerChannellingKillstealTimer <= 3 then return end

	if not myHero then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) < 1 or Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then return end

	if not coldSnap or not tornado then return end
	if not Ability.IsReady(coldSnap) and not Ability.IsReady(tornado) then return end
	if not fooAllInOne.InvokerIsAbilityInvoked(myHero, coldSnap) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) and not Ability.IsCastable(invoke, myMana) then return end

	local channellingTable = {
		npc_dota_hero_bane = { "bane_fiends_grip", { 5, 5, 5 } },
		npc_dota_hero_crystal_maiden = { "crystal_maiden_freezing_field", { 10, 10, 10} },
		npc_dota_hero_enigma = { "enigma_black_hole", { 4, 4, 4 } },
		npc_dota_hero_oracle = { "oracle_fortunes_end", { 2.5, 2.5, 2.5, 2.5 } },
		npc_dota_hero_pudge = { "pudge_dismember", { 3, 3, 3 } },
		npc_dota_hero_pugna = { "pugna_life_drain", { 10, 10, 10 } },
		npc_dota_hero_sand_king = { "sandking_epicenter", { 2, 2, 2} },
		npc_dota_hero_shadow_shaman = { "shadow_shaman_shackles", { 2.75, 3.5, 4.25, 5 } },
		npc_dota_hero_tinker = { "tinker_rearm", { 3, 1.5, 0.75 } },
		npc_dota_hero_warlock = { "warlock_upheaval", { 16, 16, 16, 16 } },
		npc_dota_hero_witch_doctor = { "witch_doctor_death_ward", { 8, 8, 8} }
				}

	local skillSelector
	if fooAllInOne.InvokerIsAbilityInvoked(myHero, coldSnap) then
		if Ability.IsReady(coldSnap) then
			skillSelector = coldSnap
		else
			if Ability.IsReady(tornado) then
				if not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) then
					if Ability.IsReady(invoke) then
						skillSelector = tornado
					end
				else
					skillSelector = tornado
				end
			end
		end
	elseif fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) then
		if Ability.IsReady(tornado) then
			skillSelector = tornado
		else
			if Ability.IsReady(coldSnap) then
				if not fooAllInOne.InvokerIsAbilityInvoked(myHero, coldSnap) then
					if Ability.IsReady(invoke) then
						skillSelector = coldSnap
					end
				else
					skillSelector = coldSnap
				end
			end
		end
	elseif not fooAllInOne.InvokerIsAbilityInvoked(myHero, coldSnap) and not fooAllInOne.InvokerIsAbilityInvoked(myHero, tornado) then
		if Ability.IsReady(invoke) then
			if Ability.IsReady(coldSnap) then
				skillSelector = coldSnap
			else
				if Ability.IsReady(tornado) then
					skillSelector = tornado
				end
			end
		end
	end

	if not skillSelector then return end

	local castRange = 950
	if skillSelector ~= nil and skillSelector == tornado then
		castRange = 400 + Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) * 400
	end
	if castRange > 1750 then
		castRange = 1750
	end

	local cancelEnemies = NPC.GetHeroesInRadius(myHero, castRange, Enum.TeamType.TEAM_ENEMY)
	for _, cancelEnemy in ipairs(cancelEnemies) do
		if cancelEnemy and not NPC.IsDormant(cancelEnemy) and not NPC.IsIllusion(cancelEnemy) and Entity.IsAlive(cancelEnemy) then
			if not NPC.HasState(cancelEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then
				for i, v in pairs(channellingTable) do
					if (NPC.GetUnitName(cancelEnemy) == i and Ability.IsChannelling(NPC.GetAbility(cancelEnemy, v[1]))) or NPC.HasModifier(cancelEnemy, "modifier_teleporting") then
						if skillSelector == coldSnap then
							if not NPC.IsLinkensProtected(cancelEnemy) then
								if not fooAllInOne.InvokerIsAbilityInvoked(myHero, skillSelector) then
									if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(skillSelector, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, skillSelector) then
										fooAllInOne.invokerInvokeAbility(myHero, skillSelector)
										Ability.CastTarget(skillSelector, cancelEnemy, true)
										fooAllInOne.invokerChannellingKillstealTimer = os.clock()
										break
										return
									end
								else
									if Ability.IsCastable(skillSelector, myMana) then
										Ability.CastTarget(coldSnap, cancelEnemy)
										fooAllInOne.invokerChannellingKillstealTimer = os.clock()
										break
										return
									end
								end
							end
						elseif skillSelector == tornado then
							if NPC.GetUnitName(cancelEnemy) == i and Ability.IsChannelling(NPC.GetAbility(cancelEnemy, v[1])) then
								if Ability.GetChannelStartTime(NPC.GetAbility(cancelEnemy, v[1])) + v[2][Ability.GetLevel(NPC.GetAbility(cancelEnemy, v[1]))] > GameRules.GetGameTime() + ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1000) then
									if not fooAllInOne.InvokerIsAbilityInvoked(myHero, skillSelector) then
										if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(skillSelector, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, skillSelector) then
											fooAllInOne.invokerInvokeAbility(myHero, skillSelector)
											Ability.CastPosition(skillSelector, Entity.GetAbsOrigin(cancelEnemy), true)
											fooAllInOne.invokerChannellingKillstealTimer = os.clock()
											break
											return
										end
									else
										if Ability.IsCastable(skillSelector, myMana) then
											Ability.CastPosition(skillSelector, Entity.GetAbsOrigin(cancelEnemy))
											fooAllInOne.invokerChannellingKillstealTimer = os.clock()
											break
											return
										end
									end
								end
							elseif NPC.HasModifier(cancelEnemy, "modifier_teleporting") then
								if GameRules.GetGameTime() + ((Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(enemy)):Length2D() / 1000) < Modifier.GetDieTime(NPC.GetModifier(cancelEnemy, "modifier_teleporting")) and Ability.IsReady(tornado) then
									if not fooAllInOne.InvokerIsAbilityInvoked(myHero, skillSelector) then
										if invoke and Ability.IsCastable(invoke, myMana) and Ability.IsCastable(skillSelector, myMana - 60) and fooAllInOne.InvokerIsSkillInvokable(myHero, skillSelector) then
											fooAllInOne.invokerInvokeAbility(myHero, skillSelector)
											Ability.CastPosition(skillSelector, Entity.GetAbsOrigin(cancelEnemy), true)
											fooAllInOne.invokerChannellingKillstealTimer = os.clock()
											break
											return
										end
									else
										if Ability.IsCastable(skillSelector, myMana) then
											Ability.CastPosition(skillSelector, Entity.GetAbsOrigin(cancelEnemy))
											fooAllInOne.invokerChannellingKillstealTimer = os.clock()
											break
											return
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.InvokerIsSkillInvokable(myHero, skill)

	if not myHero then return false end
	if not skill then return false end

	local skillName = Ability.GetName(skill)

	for i, v in pairs(fooAllInOne.invokerInvokeOrder) do
		if i == skillName then
			for k, l in ipairs(v) do
				if not NPC.GetAbilityByIndex(myHero, l) or (NPC.GetAbilityByIndex(myHero, l) and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, l)) < 1) then
					return false
				end
			end
		end
	end

	return true

end

function fooAllInOne.InvokerPreInvoke(myHero, myMana, invoke)

	if not myHero then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if os.clock() - fooAllInOne.lastTick < 0.5 then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 1)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then
		fooAllInOne.PreInvokeSkills = {}
		return
	end

	local skill1
	local skill2
	for _, v in ipairs(fooAllInOne.PreInvokeSkills) do
		if v then
			skill1 = v[1]
			skill2 = v[2]
		end
	end

	if not fooAllInOne.InvokerIsSkillInvokable(myHero, skill1) or not fooAllInOne.InvokerIsSkillInvokable(myHero, skill2) then
		fooAllInOne.PreInvokeSkills = {}
		return
	end
		
	local invokeChecker = fooAllInOne.InvokerInvokedChecker(myHero, Ability.GetName(skill1), Ability.GetName(skill2))

	if invokeChecker then
		fooAllInOne.PreInvokeSkills = {}
		return
	end

	if next(fooAllInOne.PreInvokeSkills) == nil then return end

	if Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) == Ability.GetName(skill1) or Ability.GetName(NPC.GetAbilityByIndex(myHero, 4)) == Ability.GetName(skill1) then
		if invoke and Ability.IsCastable(invoke, myMana) then
			fooAllInOne.invokerInvokeAbility(myHero, NPC.GetAbilityByIndex(myHero, 4))
			fooAllInOne.lastTick = os.clock()
			return
		end
	end

	if Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) ~= Ability.GetName(skill2) then
		if invoke and Ability.IsCastable(invoke, myMana) then
			fooAllInOne.invokerInvokeAbility(myHero, skill2)
			fooAllInOne.lastTick = os.clock()
			return
		end
	end

	if Ability.GetName(NPC.GetAbilityByIndex(myHero, 3)) == Ability.GetName(skill2) then
		if invoke and Ability.IsCastable(invoke, myMana) then
			fooAllInOne.invokerInvokeAbility(myHero, skill1)
			fooAllInOne.lastTick = os.clock()
			return
		end
	end
end
			
function fooAllInOne.InvokerIsAbilityInvoked(myHero, skill)

	for i = 3, 4 do
		if Ability.GetName(NPC.GetAbilityByIndex(myHero, i)) == Ability.GetName(skill) then
			return true
		end
	end
	
	return false

end
	

function fooAllInOne.InvokerInvokedChecker(myHero, skill1, skill2)

	if Ability.GetName(NPC.GetAbilityByIndex(myHero,3)) == skill1 and Ability.GetName(NPC.GetAbilityByIndex(myHero,4)) == skill2 then
		return true
	end
	
	return false

end

function fooAllInOne.invokerInvokeAbility(myHero, ability)
	
	if not myHero then return end
	if not ability then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if not fooAllInOne.InvokerIsSkillInvokable(myHero, ability) then return end

	local skillName = Ability.GetName(ability)
    		if not skillName then return end

	local invokeOrder = fooAllInOne.invokerInvokeOrder[skillName]
    		if not invokeOrder then return end

	local invoke = NPC.GetAbility(myHero, "invoker_invoke")
		if not invoke then return end

	for i, v in ipairs(invokeOrder) do
        	local orb = NPC.GetAbilityByIndex(myHero, v)

        	if orb then
			Ability.CastNoTarget(orb)
		end
	end

	Ability.CastNoTarget(invoke)

end

function fooAllInOne.invokerProcessInstancesWhileComboing(myHero)

	if not myHero then return end
	if os.clock() - fooAllInOne.invokerCaptureGhostwalkActivation < 1.5 then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Ability.GetCooldownTimeLeft(NPC.GetAbility(myHero, "invoker_invoke")) < 0.25 then return end
	if Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then return end
	
	if os.clock() - fooAllInOne.InvokerCaptureManualInstances < 2.5 then return end

	if Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) > -1 and Ability.SecondsSinceLastUse(NPC.GetAbility(myHero, "invoker_ghost_walk")) < 1 then return end
	if NPC.HasModifier(myHero, "modifier_invoker_ghost_walk_self") then return end
	
	if os.clock() - fooAllInOne.InvokerLastChangedInstance < 0.75 then return end

	local instanceTable = {}
	local modifiers = NPC.GetModifiers(myHero)
	for _, modifier in ipairs(modifiers) do
		if modifier then
			local modifierName = Modifier.GetName(modifier)
			if modifierName == "modifier_invoker_quas_instance" or modifierName == "modifier_invoker_wex_instance" or modifierName == "modifier_invoker_exort_instance" then
				table.insert(instanceTable, modifierName)
			end
		end
	end

	if #instanceTable < 3 then return end

	if Entity.GetHealth(myHero) < Entity.GetMaxHealth(myHero) * 0.25 then
		if instanceTable[1] ~= "modifier_invoker_quas_instance" or instanceTable[2] ~= "modifier_invoker_quas_instance" or instanceTable[3] ~= "modifier_invoker_quas_instance" then
			fooAllInOne.invokerChangeInstances(myHero, "QQQ")
			fooAllInOne.InvokerLastChangedInstance = os.clock()
		end
	else
		if instanceTable[1] ~= "modifier_invoker_exort_instance" or instanceTable[2] ~= "modifier_invoker_exort_instance" or instanceTable[3] ~= "modifier_invoker_exort_instance" then
			fooAllInOne.invokerChangeInstances(myHero, "EEE")
			fooAllInOne.InvokerLastChangedInstance = os.clock()
		end
	end

end

function fooAllInOne.invokerProcessInstances(myHero, order)

	if not myHero then return end
	if not order then return end
	if os.clock() - fooAllInOne.invokerCaptureGhostwalkActivation < 1.5 then return end
	if os.clock() - fooAllInOne.InvokerCaptureManualInstances < 2.5 then return end
	if next(fooAllInOne.PreInvokeSkills) ~= nil then return end

	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then
		return
	end

	if os.clock() - fooAllInOne.InvokerLastChangedInstance < Menu.GetValue(fooAllInOne.optionHeroInvokerInstanceDelay) * 0.25 then return end

	local instanceTable = {}
	local modifiers = NPC.GetModifiers(myHero)
	for _, modifier in ipairs(modifiers) do
		if modifier then
			local modifierName = Modifier.GetName(modifier)
			if modifierName == "modifier_invoker_quas_instance" or modifierName == "modifier_invoker_wex_instance" or modifierName == "modifier_invoker_exort_instance" then
				table.insert(instanceTable, modifierName)
			end
		end
	end

	if #instanceTable < 3 then return end

	if order == Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_POSITION or order == Enum.UnitOrder.DOTA_UNIT_ORDER_MOVE_TO_TARGET then
		if Entity.GetHealth(myHero) < Entity.GetMaxHealth(myHero) then
			if instanceTable[1] ~= "modifier_invoker_quas_instance" or instanceTable[2] ~= "modifier_invoker_quas_instance" or instanceTable[3] ~= "modifier_invoker_quas_instance" then
				fooAllInOne.invokerChangeInstances(myHero, "QQQ")
				fooAllInOne.InvokerLastChangedInstance = os.clock()
			end
		else
			if instanceTable[1] ~= "modifier_invoker_wex_instance" or instanceTable[2] ~= "modifier_invoker_wex_instance" or instanceTable[3] ~= "modifier_invoker_wex_instance" then
				fooAllInOne.invokerChangeInstances(myHero, "WWW")
				fooAllInOne.InvokerLastChangedInstance = os.clock()
			end
		end
	end

	if order == Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_MOVE or order == Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET then
		local exort = NPC.GetAbilityByIndex(myHero, 2)
		if exort and Ability.GetLevel(exort) > 0 then
			if instanceTable[1] ~= "modifier_invoker_exort_instance" or instanceTable[2] ~= "modifier_invoker_exort_instance" or instanceTable[3] ~= "modifier_invoker_exort_instance" then
				fooAllInOne.invokerChangeInstances(myHero, "EEE")
				fooAllInOne.InvokerLastChangedInstance = os.clock()
			end
		else
			if instanceTable[1] ~= "modifier_invoker_wex_instance" or instanceTable[2] ~= "modifier_invoker_wex_instance" or instanceTable[3] ~= "modifier_invoker_wex_instance" then
				fooAllInOne.invokerChangeInstances(myHero, "WWW")
				fooAllInOne.InvokerLastChangedInstance = os.clock()
			end
		end
	end

end		

function fooAllInOne.invokerChangeInstances(myHero, instance)

	if not myHero then return end
	if not instance then return end

	if os.clock() - fooAllInOne.invokerCaptureGhostwalkActivation < 1.5 then return end
	
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 0)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 and Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then
		return
	end

	local invokeOrder = {}
	if instance == "QQQ" then
		local quas = NPC.GetAbilityByIndex(myHero, 0)
		if quas and Ability.GetLevel(quas) > 0 then
			invokeOrder = {0,0,0}
		end
	elseif instance == "WWW" then
		local wex = NPC.GetAbilityByIndex(myHero, 1)
		if wex and Ability.GetLevel(wex) > 0 then
			invokeOrder = {1,1,1}
		end
	elseif instance == "EEE" then
		local exort = NPC.GetAbilityByIndex(myHero, 2)
		if exort and Ability.GetLevel(exort) > 0 then
			invokeOrder = {2,2,2}
		end
	end

	for i, v in ipairs(invokeOrder) do
        	local orb = NPC.GetAbilityByIndex(myHero, v)

        	if orb then
			Ability.CastNoTarget(orb)
		end
	end

end

function fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, enemy)

	if not myHero then return end
	if not enemy then return end

	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
	if not sunStrike or (sunStrike and not Ability.IsReady(sunStrike)) then return end
	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local sunStrikeDMG = 37.5 + (62.5 * Ability.GetLevel(NPC.GetAbility(myHero, "invoker_exort")))
		if aghanims or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
			sunStrikeDMG = 37.5 + (62.5 * (Ability.GetLevel(NPC.GetAbility(myHero, "invoker_exort")) + 1))
		end

	local curTime = GameRules.GetGameTime()

	local stunRootList = {
		"modifier_stunned",
		"modifier_bashed",
		"modifier_alchemist_unstable_concoction", 
		"modifier_ancientapparition_coldfeet_freeze", 
		"modifier_axe_berserkers_call",
		"modifier_bane_fiends_grip",
		"modifier_bane_nightmare",
		"modifier_bloodseeker_rupture",
		"modifier_rattletrap_hookshot", 
		"modifier_earthshaker_fissure_stun", 
		"modifier_earth_spirit_boulder_smash",
		"modifier_enigma_black_hole_pull",
		"modifier_faceless_void_chronosphere_freeze",
		"modifier_jakiro_ice_path_stun", 
		"modifier_keeper_of_the_light_mana_leak_stun", 
		"modifier_kunkka_torrent", 
		"modifier_legion_commander_duel", 
		"modifier_lion_impale", 
		"modifier_magnataur_reverse_polarity", 
		"modifier_medusa_stone_gaze_stone", 
		"modifier_morphling_adaptive_strike", 
		"modifier_naga_siren_ensnare", 
		"modifier_nyx_assassin_impale", 
		"modifier_pudge_dismember", 
		"modifier_sandking_impale", 
		"modifier_shadow_shaman_shackles", 
		"modifier_techies_stasis_trap_stunned", 
		"modifier_tidehunter_ravage", 
		"modifier_treant_natures_guise",
		"modifier_windrunner_shackle_shot",
		"modifier_rooted", 
		"modifier_crystal_maiden_frostbite", 
		"modifier_ember_spirit_searing_chains", 
		"modifier_meepo_earthbind",
		"modifier_lone_druid_spirit_bear_entangle_effect",
		"modifier_slark_pounce_leash",
		"modifier_storm_spirit_electric_vortex_pull",
		"modifier_treant_overgrowth", 
		"modifier_abyssal_underlord_pit_of_malice_ensare", 
		"modifier_item_rod_of_atos_debuff",
		"modifier_eul_cyclone",
		"modifier_obsidian_destroyer_astral_imprisonment_prison",
		"modifier_shadow_demon_disruption",
		"modifier_teleporting",
		"modifier_invoker_tornado"
			}
	
	local searchMod
	for _, modifier in ipairs(stunRootList) do
		if NPC.HasModifier(enemy, modifier) then
			searchMod = NPC.GetModifier(enemy, modifier)
			break
		end
	end

	if not searchMod then return { 0, 0 } end

	local timing = 0
	local HPtreshold = 0
	if searchMod then
		if NPC.HasModifier(enemy, Modifier.GetName(searchMod)) then
			if Modifier.GetName(searchMod) == "modifier_enigma_black_hole_pull" then
				if Modifier.GetCreationTime(searchMod) + 4 - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod) + 0.3
					HPtreshold = sunStrikeDMG + 2 * fooAllInOne.GetTeammateAbilityLevel(myHero, "enigma_black_hole") * 37
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_faceless_void_chronosphere_freeze" then
				if Modifier.GetCreationTime(searchMod) + (3.5 + fooAllInOne.GetTeammateAbilityLevel(myHero, "faceless_void_chronosphere") * 0.5) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod)
					HPtreshold = sunStrikeDMG * 1.25
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_axe_berserkers_call" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod)
					HPtreshold = sunStrikeDMG * 1.35
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_bane_fiends_grip" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod) + 0.3
					HPtreshold = sunStrikeDMG + 2 * (45 + fooAllInOne.GetTeammateAbilityLevel(myHero, "bane_fiends_grip") * 55)
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_legion_commander_duel" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod)
					HPtreshold = sunStrikeDMG * 1.35
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_pudge_dismember" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod) + 0.3
					HPtreshold = sunStrikeDMG + 2 * (22 + fooAllInOne.GetTeammateAbilityLevel(myHero, "pudge_dismember") * 22)
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_crystal_maiden_frostbite" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod) + 0.3
					HPtreshold = sunStrikeDMG + 75
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_ember_spirit_searing_chains" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod) + 0.3
					HPtreshold = sunStrikeDMG + 85
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_eul_cyclone" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetDieTime(searchMod) - 1.7 + 0.05
					HPtreshold = sunStrikeDMG - 10
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_obsidian_destroyer_astral_imprisonment_prison" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetDieTime(searchMod) - 1.7 + 0.15
					HPtreshold = sunStrikeDMG + (25 + fooAllInOne.GetTeammateAbilityLevel(myHero, "obsidian_destroyer_astral_imprisonment") * 75) * 0.75
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_shadow_demon_disruption" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetDieTime(searchMod) - 1.7 + 0.1
					HPtreshold = sunStrikeDMG - 10
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_invoker_tornado" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetDieTime(searchMod) - 1.7 + 0.05
					HPtreshold = sunStrikeDMG - 10
				else
					timing = 0
					HPtreshold = 0
				end
			elseif Modifier.GetName(searchMod) == "modifier_teleporting" then
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod)
					HPtreshold = sunStrikeDMG - 10
				else
					timing = 0
					HPtreshold = 0
				end
			else
				if Modifier.GetDieTime(searchMod) - curTime >= 1.5 then
					timing = Modifier.GetCreationTime(searchMod)
					HPtreshold = sunStrikeDMG * (1 + Menu.GetValue(fooAllInOne.optionKillStealInvokerTreshold) / 100)
				else
					timing = 0
					HPtreshold = 0
				end
			end
		else
			timing = 0
			HPtreshold = 0
		end
	else
		timing = 0
		HPtreshold = 0
	end

	return { timing, HPtreshold }

end

function fooAllInOne.invokerSunstrikeKSParticleProcess(myHero)

	if not myHero then return false end
	if fooAllInOne.TPParticlePosition:__tostring() == Vector(0.0, 0.0, 0.0):__tostring() then return false end
	if NPC.GetMana(myHero) < 175 then return false end	

	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
	if not sunStrike or (sunStrike and not Ability.IsReady(sunStrike)) then return false end
	if not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) and not Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then return false end
	
	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local sunStrikeDMG = 37.5 + (62.5 * Ability.GetLevel(NPC.GetAbility(myHero, "invoker_exort")))
		if aghanims or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
			sunStrikeDMG = 37.5 + (62.5 * (Ability.GetLevel(NPC.GetAbility(myHero, "invoker_exort")) + 1))
		end

	if fooAllInOne.TPParticleTime > 0 and fooAllInOne.TPParticleUnit ~= nil then
		for hero, data in pairs(fooAllInOne.enemyHeroTable) do
			local heroHP = data[1]
			local heroHPreg = data[2]
			local timeStamp = data[3]
			if hero and NPC.IsDormant(hero) and hero == fooAllInOne.TPParticleUnit then
				if GameRules.GetGameTime() - timeStamp <= 10 then
					if heroHP + heroHPreg * (math.ceil(GameRules.GetGameTime() - timeStamp)) <= sunStrikeDMG and heroHP > 0 then
						return true
					end
				end
			end
		end
	end
	return false

end

function fooAllInOne.InvokerDrawShort(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroInvoker) then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroInvokerPanelShort) then return end
	if fooAllInOne.Toggler then return end

	local w, h = Renderer.GetScreenSize()
	Renderer.SetDrawColor(255, 255, 255)

	local startX = w/2 + Menu.GetValue(fooAllInOne.optionHeroInvokerPanelShortXPos)
	local startY = h/2 + Menu.GetValue(fooAllInOne.optionHeroInvokerPanelShortYPos)

	local numberCombos = 1
	local maxSkills = 6

	local invokeTranslator = {
		"invoker_tornado",
		"invoker_emp",
		"invoker_chaos_meteor", 
		"invoker_deafening_blast",
		"invoker_sun_strike",
		"invoker_ice_wall",
		"invoker_cold_snap",
		"invoker_forge_spirit",
		"invoker_alacrity",
		"item_cyclone",
		"item_rod_of_atos",
		"item_refresher"
			}

	local imageHandleSnap = fooAllInOne.invokerCachedIcons["invoker_cold_snap"]
	local imageHandleSunStrike = fooAllInOne.invokerCachedIcons["invoker_sun_strike"]
	local imageHandleEmp = fooAllInOne.invokerCachedIcons["invoker_emp"]
	local imageHandleTornado = fooAllInOne.invokerCachedIcons["invoker_tornado"]
	local imageHandleAlacrity = fooAllInOne.invokerCachedIcons["invoker_alacrity"]
	local imageHandleBlast = fooAllInOne.invokerCachedIcons["invoker_deafening_blast"]
	local imageHandleMeteor = fooAllInOne.invokerCachedIcons["invoker_chaos_meteor"]
	local imageHandleIcewall = fooAllInOne.invokerCachedIcons["invoker_ice_wall"]
	local imageHandleSpirit = fooAllInOne.invokerCachedIcons["invoker_forge_spirit"]
	local imageHandleGhost = fooAllInOne.invokerCachedIcons["invoker_ghost_walk"]
	local imageHandleAgha = fooAllInOne.invokerCachedIcons["item_ultimate_scepter"]
	local imageHandleRefresher = fooAllInOne.invokerCachedIcons["item_refresher"]
	local imageHandleDagger = fooAllInOne.invokerCachedIcons["item_blink"]
	local imageHandleEul = fooAllInOne.invokerCachedIcons["item_cyclone"]
	local imageHandleAtos = fooAllInOne.invokerCachedIcons["item_rod_of_atos"]

	local skillTranslator = {
		imageHandleTornado,
		imageHandleEmp,
		imageHandleMeteor, 
		imageHandleBlast,
		imageHandleSunStrike,
		imageHandleIcewall,
		imageHandleSnap,
		imageHandleSpirit,
		imageHandleAlacrity,
		imageHandleEul,
		imageHandleAtos,
		imageHandleRefresher
			}

		-- custom mode 1
	if fooAllInOne.InvokerComboSelector == 12 then
		if fooAllInOne.InvokerInvokedChecker(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)], invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)]) and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)], startX+2+25*0, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)], startX+2+25*1, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)], startX+2+25*2, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4)], startX+2+25*3, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill5) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill5)], startX+2+25*4, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill6) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill6)], startX+2+25*5, startY+2, 25, 25)
		end
		Renderer.SetDrawColor(255, 255, 255, 150)
		Renderer.DrawText(fooAllInOne.font, startX-20, startY+1, "1", 0)
	end
		-- custom mode 2
	if fooAllInOne.InvokerComboSelector == 13 then
		if fooAllInOne.InvokerInvokedChecker(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)], invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)]) and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)], startX+2+25*0, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)], startX+2+25*1, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)], startX+2+25*2, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4)], startX+2+25*3, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill5) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill5)], startX+2+25*4, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill6) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill6)], startX+2+25*5, startY+2, 25, 25)
		end
		Renderer.SetDrawColor(255, 255, 255, 150)
		Renderer.DrawText(fooAllInOne.font, startX-20, startY+1, "2", 0)
	end
		-- custom mode 3
	if fooAllInOne.InvokerComboSelector == 14 then
		if fooAllInOne.InvokerInvokedChecker(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)], invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)]) and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)], startX+2+25*0, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)], startX+2+25*1, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)], startX+2+25*2, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4)], startX+2+25*3, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill5) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill5)], startX+2+25*4, startY+2, 25, 25)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill6) > 0 then
			Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill6)], startX+2+25*5, startY+2, 25, 25)
		end
		Renderer.SetDrawColor(255, 255, 255, 150)
		Renderer.DrawText(fooAllInOne.font, startX-20, startY+1, "3", 0)
	end

	if fooAllInOne.InvokerComboSelector == 11 then
		Renderer.SetDrawColor(255, 255, 255, 150)
		Renderer.DrawText(fooAllInOne.font, startX+2+25*2, startY+1, "dyn", 0)
		Renderer.SetDrawColor(0, 0, 0, 100)
		Renderer.DrawFilledRect(startX, startY, (25 * maxSkills) + 4, (25 * numberCombos) + 4)
	end

end

function fooAllInOne.InvokerDraw(myHero)

	if not myHero then return end
	if not Menu.IsEnabled(fooAllInOne.optionHeroInvoker) then return end

	if fooAllInOne.invokerPanelNeedsInit then
        	fooAllInOne.invokerPanelInit()
        	fooAllInOne.invokerPanelNeedsInit = false
    	end

	local w, h = Renderer.GetScreenSize()
	Renderer.SetDrawColor(255, 255, 255)

	local startX = w - 300 - Menu.GetValue(fooAllInOne.optionHeroInvokerPanelXPos)
	local startY = 300 + Menu.GetValue(fooAllInOne.optionHeroInvokerPanelYPos)

	local numberCombos = 11
	local maxSkills = 6

	local imageSize = fooAllInOne.invokerPanelBoxSize

	if Menu.IsKeyDownOnce(fooAllInOne.optionHeroInvokerToggleKey) then
		fooAllInOne.Toggler = not fooAllInOne.Toggler
	end

	if not fooAllInOne.Toggler then return end
		
	 -- black background
	Renderer.SetDrawColor(0, 0, 0, 150)
	Renderer.DrawFilledRect(startX, startY, (imageSize * maxSkills) + 4, ((imageSize+2) * numberCombos) + 12)
	Renderer.DrawFilledRect(startX, startY+(imageSize+2)*12+12, (imageSize * maxSkills) + 4, (imageSize+2)*3 + 4)

	-- black border
	Renderer.SetDrawColor(0, 0, 0, 255)
	Renderer.DrawOutlineRect(startX, startY, (imageSize * maxSkills) + 4, ((imageSize+2) * numberCombos) + 12)
	Renderer.DrawOutlineRect(startX, startY+(imageSize+2)*12+12, (imageSize * maxSkills) + 4, (imageSize+2)*3 + 4)

	local hoveringOverCombo1 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*0 + 0, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo2 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*1 + 1, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo3 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*2 + 2, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo4 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*3 + 3, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo5 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*4 + 4, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo6 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*5 + 5, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo7 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*6 + 6, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo8 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*7 + 7, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo9 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*8 + 8, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo10 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*9 + 9, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo11 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*10 + 10, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo12 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*12 + 12, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo13 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*13 + 13, (imageSize * maxSkills)+2 , (imageSize+2))
	local hoveringOverCombo14 = Input.IsCursorInRect(startX+1, startY+1+(imageSize+2)*14 + 14, (imageSize * maxSkills)+2 , (imageSize+2))

	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
	local emp = NPC.GetAbility(myHero, "invoker_emp")
	local tornado = NPC.GetAbility(myHero, "invoker_tornado")
	local deafeningBlast = NPC.GetAbility(myHero, "invoker_deafening_blast")
	local chaosMeteor = NPC.GetAbility(myHero, "invoker_chaos_meteor")
	local coldSnap = NPC.GetAbility(myHero, "invoker_cold_snap")
	local forgeSpirit = NPC.GetAbility(myHero, "invoker_forge_spirit")
	local alacrity = NPC.GetAbility(myHero, "invoker_alacrity")
	local iceWall = NPC.GetAbility(myHero, "invoker_ice_wall")
	local euls = NPC.GetItem(myHero, "item_cyclone", true)
	local refresher = NPC.GetItem(myHero, "item_refresher", true)

	local invokeTranslator = {
		"invoker_tornado",
		"invoker_emp",
		"invoker_chaos_meteor", 
		"invoker_deafening_blast",
		"invoker_sun_strike",
		"invoker_ice_wall",
		"invoker_cold_snap",
		"invoker_forge_spirit",
		"invoker_alacrity",
		"item_cyclone",
		"item_rod_of_atos",
		"item_refresher"
			}

	if hoveringOverCombo1 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 1 then
				fooAllInOne.PreInvokeSkills = {{coldSnap, forgeSpirit}}
				fooAllInOne.InvokerComboSelector = 1
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 1 then
				fooAllInOne.InvokerComboSelector = 1
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo2 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 2 then
				fooAllInOne.PreInvokeSkills = {{coldSnap, forgeSpirit}}
				fooAllInOne.InvokerComboSelector = 2
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 2 then
				fooAllInOne.InvokerComboSelector = 2
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo3 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 3 then
				fooAllInOne.PreInvokeSkills = {{emp, tornado}}
				fooAllInOne.InvokerComboSelector = 3
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 3 then
				fooAllInOne.InvokerComboSelector = 3
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo4 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 4 then
				fooAllInOne.PreInvokeSkills = {{chaosMeteor, tornado}}
				fooAllInOne.InvokerComboSelector = 4
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 4 then
				fooAllInOne.InvokerComboSelector = 4
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo5 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 5 then
				fooAllInOne.PreInvokeSkills = {{chaosMeteor, sunStrike}}
				fooAllInOne.InvokerComboSelector = 5
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 5 then
				fooAllInOne.InvokerComboSelector = 5
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo6 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 6 then
				fooAllInOne.PreInvokeSkills = {{emp, tornado}}
				fooAllInOne.InvokerComboSelector = 6
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 6 then
				fooAllInOne.InvokerComboSelector = 6
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo7 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 7 then
				fooAllInOne.PreInvokeSkills = {{sunStrike, tornado}}
				fooAllInOne.InvokerComboSelector = 7
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 7 then
				fooAllInOne.InvokerComboSelector = 7
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo8 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 8 then
				fooAllInOne.PreInvokeSkills = {{sunStrike, tornado}}
				fooAllInOne.InvokerComboSelector = 8
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 8 then
				fooAllInOne.InvokerComboSelector = 8
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo9 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 9 then
				fooAllInOne.PreInvokeSkills = {{emp, tornado}}
				fooAllInOne.InvokerComboSelector = 9
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 9 then
				fooAllInOne.InvokerComboSelector = 9
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo10 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 10 then
				fooAllInOne.PreInvokeSkills = {{deafeningBlast, chaosMeteor}}
				fooAllInOne.InvokerComboSelector = 10
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 10 then
				fooAllInOne.InvokerComboSelector = 10
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo11 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if fooAllInOne.InvokerComboSelector ~= 11 then
			fooAllInOne.InvokerComboSelector = 11
		else
			fooAllInOne.InvokerComboSelector = 0
		end
	elseif hoveringOverCombo12 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 12 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) <= 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)])}}
						fooAllInOne.InvokerComboSelector = 12
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])}}
						fooAllInOne.InvokerComboSelector = 12
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)])}}
						fooAllInOne.InvokerComboSelector = 12
					else
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)])}}
						fooAllInOne.InvokerComboSelector = 12
					end
				else
					fooAllInOne.InvokerComboSelector = 0
				end	
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 12 then
				fooAllInOne.InvokerComboSelector = 12
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo13 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 13 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) <= 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)])}}
						fooAllInOne.InvokerComboSelector = 13
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])}}
						fooAllInOne.InvokerComboSelector = 13
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)])}}
						fooAllInOne.InvokerComboSelector = 13
					else
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)])}}
						fooAllInOne.InvokerComboSelector = 13
					end
				else
					fooAllInOne.InvokerComboSelector = 0
				end	
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 13 then
				fooAllInOne.InvokerComboSelector = 13
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	elseif hoveringOverCombo14 and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
		if Menu.IsEnabled(fooAllInOne.optionHeroInvokerAutoInvoke) then
			if fooAllInOne.InvokerComboSelector ~= 14 then
				if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 then
					if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) <= 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)])}}
						fooAllInOne.InvokerComboSelector = 14
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) <= 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])}}
						fooAllInOne.InvokerComboSelector = 14
					elseif Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 9 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 9 then
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)])}}
						fooAllInOne.InvokerComboSelector = 14
					else
						fooAllInOne.PreInvokeSkills = {{NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)])}}
						fooAllInOne.InvokerComboSelector = 14
					end
				else
					fooAllInOne.InvokerComboSelector = 0
				end	
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		else
			if fooAllInOne.InvokerComboSelector ~= 14 then
				fooAllInOne.InvokerComboSelector = 14
			else
				fooAllInOne.InvokerComboSelector = 0
			end
		end
	end

	-- border
	if fooAllInOne.InvokerComboSelector == 1 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*0 + 0, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 2 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*1 + 1, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 3 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*2 + 2, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 4 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*3 + 3, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 5 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*4 + 4, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 6 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*5 + 5, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 7 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*6 + 6, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 8 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*7 + 7, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 9 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*8 + 8, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 10 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*9 + 9, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 11 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*10 + 10, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 12 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*12 + 12, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 13 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*13 + 13, (imageSize * maxSkills)+2 , (imageSize+2))
	end
	if fooAllInOne.InvokerComboSelector == 14 then
		Renderer.SetDrawColor(0, 255, 0, 255)
		Renderer.DrawOutlineRect(startX+1, startY+1+(imageSize+2)*14 + 14, (imageSize * maxSkills)+2 , (imageSize+2))
	end

	local imageHandleSnap = fooAllInOne.invokerCachedIcons["invoker_cold_snap"]
	local imageHandleSunStrike = fooAllInOne.invokerCachedIcons["invoker_sun_strike"]
	local imageHandleEmp = fooAllInOne.invokerCachedIcons["invoker_emp"]
	local imageHandleTornado = fooAllInOne.invokerCachedIcons["invoker_tornado"]
	local imageHandleAlacrity = fooAllInOne.invokerCachedIcons["invoker_alacrity"]
	local imageHandleBlast = fooAllInOne.invokerCachedIcons["invoker_deafening_blast"]
	local imageHandleMeteor = fooAllInOne.invokerCachedIcons["invoker_chaos_meteor"]
	local imageHandleIcewall = fooAllInOne.invokerCachedIcons["invoker_ice_wall"]
	local imageHandleSpirit = fooAllInOne.invokerCachedIcons["invoker_forge_spirit"]
	local imageHandleGhost = fooAllInOne.invokerCachedIcons["invoker_ghost_walk"]
	local imageHandleAgha = fooAllInOne.invokerCachedIcons["item_ultimate_scepter"]
	local imageHandleRefresher = fooAllInOne.invokerCachedIcons["item_refresher"]
	local imageHandleDagger = fooAllInOne.invokerCachedIcons["item_blink"]
	local imageHandleEul = fooAllInOne.invokerCachedIcons["item_cyclone"]
	local imageHandleAtos = fooAllInOne.invokerCachedIcons["item_rod_of_atos"]

	

	-- combo CS, Forge, Alacrity
	if fooAllInOne.InvokerComboSelector == 1 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_cold_snap", "invoker_forge_spirit") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleSnap, startX+2+imageSize*0, startY+2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(coldSnap) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*0+4, startY+2+4, math.floor(Ability.GetCooldownTimeLeft(coldSnap)), 0)
			end
		end
	Renderer.DrawImage(imageHandleSpirit, startX+2+imageSize*1, startY+2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(forgeSpirit) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+2+4, math.floor(Ability.GetCooldownTimeLeft(forgeSpirit)), 0)
			end
		end
	Renderer.DrawImage(imageHandleAlacrity, startX+2+imageSize*2, startY+2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(alacrity) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+2+4, math.floor(Ability.GetCooldownTimeLeft(alacrity)), 0)
			end
		end

	-- combo CS, Forge, SS
	if fooAllInOne.InvokerComboSelector == 2 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_cold_snap", "invoker_forge_spirit") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleSnap, startX+2+imageSize*0, startY+3+(imageSize+2)*1, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(coldSnap) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*0+4, startY+3+(imageSize+2)*1+4, math.floor(Ability.GetCooldownTimeLeft(coldSnap)), 0)
			end
		end
	Renderer.DrawImage(imageHandleSpirit, startX+2+imageSize*1, startY+3+(imageSize+2)*1, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(forgeSpirit) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+3+(imageSize+2)*1+4, math.floor(Ability.GetCooldownTimeLeft(forgeSpirit)), 0)
			end
		end
	Renderer.DrawImage(imageHandleSunStrike, startX+2+imageSize*2, startY+3+(imageSize+2)*1, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(sunStrike) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+3+(imageSize+2)*1+4, math.floor(Ability.GetCooldownTimeLeft(sunStrike)), 0)
			end
		end

	-- combo Tornado, EMP, Icewall
	if fooAllInOne.InvokerComboSelector == 3 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_emp", "invoker_tornado") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleTornado, startX+2+imageSize*0, startY+4+(imageSize+2)*2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(tornado) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*0+4, startY+4+(imageSize+2)*2+4, math.floor(Ability.GetCooldownTimeLeft(tornado)), 0)
			end
		end
	Renderer.DrawImage(imageHandleEmp, startX+2+imageSize*1, startY+4+(imageSize+2)*2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(emp) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+4+(imageSize+2)*2+4, math.floor(Ability.GetCooldownTimeLeft(emp)), 0)
			end
		end
	Renderer.DrawImage(imageHandleIcewall, startX+2+imageSize*2, startY+4+(imageSize+2)*2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(iceWall) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+4+(imageSize+2)*2+4, math.floor(Ability.GetCooldownTimeLeft(iceWall)), 0)
			end
		end
	Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+math.floor(imageSize/3)+imageSize*3, startY+4+(imageSize+2)*2+math.floor(imageSize/5), "or", 1)
	Renderer.DrawImage(imageHandleSnap, startX+2+imageSize*4, startY+4+(imageSize+2)*2, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(coldSnap) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*4+4, startY+4+(imageSize+2)*2+4, math.floor(Ability.GetCooldownTimeLeft(coldSnap)), 0)
			end
		end

	-- combo Tornado, Meteor, Blast
	if fooAllInOne.InvokerComboSelector == 4 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_chaos_meteor", "invoker_tornado") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleTornado, startX+2+imageSize*0, startY+5+(imageSize+2)*3, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(tornado) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*0+4, startY+5+(imageSize+2)*3+4, math.floor(Ability.GetCooldownTimeLeft(tornado)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*1, startY+5+(imageSize+2)*3, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+5+(imageSize+2)*3+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*2, startY+5+(imageSize+2)*3, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+5+(imageSize+2)*3+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end

	-- combo Eul, Sunstrike, Meteor, Blast
	if fooAllInOne.InvokerComboSelector == 5 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_chaos_meteor", "invoker_sun_strike") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleEul, startX+2+imageSize*0, startY+6+(imageSize+2)*4, imageSize, imageSize)
	Renderer.DrawImage(imageHandleSunStrike, startX+2+imageSize*1, startY+6+(imageSize+2)*4, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(sunStrike) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+6+(imageSize+2)*4+4, math.floor(Ability.GetCooldownTimeLeft(sunStrike)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*2, startY+6+(imageSize+2)*4, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+6+(imageSize+2)*4+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*3, startY+6+(imageSize+2)*4, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*3+4, startY+6+(imageSize+2)*4+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end

	-- combo Tornado, EMP, Meteor, Blast
	if fooAllInOne.InvokerComboSelector == 6 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_emp", "invoker_tornado") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleAgha, startX+2+imageSize*0, startY+7+(imageSize+2)*5, imageSize, imageSize)
	Renderer.DrawImage(imageHandleTornado, startX+2+imageSize*1, startY+7+(imageSize+2)*5, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(tornado) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+7+(imageSize+2)*5+4, math.floor(Ability.GetCooldownTimeLeft(tornado)), 0)
			end
		end
	Renderer.DrawImage(imageHandleEmp, startX+2+imageSize*2, startY+7+(imageSize+2)*5, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(emp) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+7+(imageSize+2)*5+4, math.floor(Ability.GetCooldownTimeLeft(emp)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*3, startY+7+(imageSize+2)*5, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*3+4, startY+7+(imageSize+2)*5+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*4, startY+7+(imageSize+2)*5, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*4+4, startY+7+(imageSize+2)*5+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end

	-- combo Tornado, Sunstrike, Meteor, Blast
	if fooAllInOne.InvokerComboSelector == 7 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_sun_strike", "invoker_tornado") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleAgha, startX+2+imageSize*0, startY+8+(imageSize+2)*6, imageSize, imageSize)
	Renderer.DrawImage(imageHandleTornado, startX+2+imageSize*1, startY+8+(imageSize+2)*6, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(tornado) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1+4, startY+8+(imageSize+2)*6+4, math.floor(Ability.GetCooldownTimeLeft(tornado)), 0)
			end
		end
	Renderer.DrawImage(imageHandleSunStrike, startX+2+imageSize*2, startY+8+(imageSize+2)*6, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(sunStrike) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+8+(imageSize+2)*6+4, math.floor(Ability.GetCooldownTimeLeft(sunStrike)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*3, startY+8+(imageSize+2)*6, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*3+4, startY+8+(imageSize+2)*6+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*4, startY+8+(imageSize+2)*6, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*4+4, startY+8+(imageSize+2)*6+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end

	-- combo Tornado, Sunstrike, Meteor, Blast, Refresher
	if fooAllInOne.InvokerComboSelector == 8 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_sun_strike", "invoker_tornado") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleRefresher, startX+2+imageSize*0, startY+9+(imageSize+2)*7, imageSize, imageSize)
	Renderer.DrawImage(imageHandleAgha, startX+2+imageSize*1, startY+9+(imageSize+2)*7, imageSize, imageSize)
	Renderer.DrawImage(imageHandleTornado, startX+2+imageSize*2, startY+9+(imageSize+2)*7, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(tornado) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+9+(imageSize+2)*7+4, math.floor(Ability.GetCooldownTimeLeft(tornado)), 0)
			end
		end
	Renderer.DrawImage(imageHandleSunStrike, startX+2+imageSize*3, startY+9+(imageSize+2)*7, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(sunStrike) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*3+4, startY+9+(imageSize+2)*7+4, math.floor(Ability.GetCooldownTimeLeft(sunStrike)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*4, startY+9+(imageSize+2)*7, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*4+4, startY+9+(imageSize+2)*7+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*5, startY+9+(imageSize+2)*7, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*5+4, startY+9+(imageSize+2)*7+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end

	-- combo Tornado, Sunstrike, Meteor, Blast, Refresher
	if fooAllInOne.InvokerComboSelector == 9 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_emp", "invoker_tornado") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleRefresher, startX+2+imageSize*0, startY+10+(imageSize+2)*8, imageSize, imageSize)
	Renderer.DrawImage(imageHandleAgha, startX+2+imageSize*1, startY+10+(imageSize+2)*8, imageSize, imageSize)
	Renderer.DrawImage(imageHandleTornado, startX+2+imageSize*2, startY+10+(imageSize+2)*8, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(tornado) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*2+4, startY+10+(imageSize+2)*8+4, math.floor(Ability.GetCooldownTimeLeft(tornado)), 0)
			end
		end
	Renderer.DrawImage(imageHandleEmp, startX+2+imageSize*3, startY+10+(imageSize+2)*8, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(emp) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*3+4, startY+10+(imageSize+2)*8+4, math.floor(Ability.GetCooldownTimeLeft(emp)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*4, startY+10+(imageSize+2)*8, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*4+4, startY+10+(imageSize+2)*8+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*5, startY+10+(imageSize+2)*8, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*5+4, startY+10+(imageSize+2)*8+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end

	-- combo Dagger, Blast, Meteor, Sunstrike
	if fooAllInOne.InvokerComboSelector == 10 then
		if fooAllInOne.InvokerInvokedChecker(myHero, "invoker_deafening_blast", "invoker_chaos_meteor") and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleRefresher, startX+2+imageSize*0, startY+11+(imageSize+2)*9, imageSize, imageSize)
	Renderer.DrawImage(imageHandleAgha, startX+2+imageSize*1, startY+11+(imageSize+2)*9, imageSize, imageSize)
	Renderer.DrawImage(imageHandleDagger, startX+2+imageSize*2, startY+11+(imageSize+2)*9, imageSize, imageSize)
	Renderer.DrawImage(imageHandleBlast, startX+2+imageSize*3, startY+11+(imageSize+2)*9, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(deafeningBlast) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*3+4, startY+11+(imageSize+2)*9+4, math.floor(Ability.GetCooldownTimeLeft(deafeningBlast)), 0)
			end
		end
	Renderer.DrawImage(imageHandleMeteor, startX+2+imageSize*4, startY+11+(imageSize+2)*9, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(chaosMeteor) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*4+4, startY+11+(imageSize+2)*9+4, math.floor(Ability.GetCooldownTimeLeft(chaosMeteor)), 0)
			end
		end
	Renderer.DrawImage(imageHandleSunStrike, startX+2+imageSize*5, startY+11+(imageSize+2)*9, imageSize, imageSize)
		if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 2 then
			if Ability.GetCooldownTimeLeft(sunStrike) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*5+4, startY+11+(imageSize+2)*9+4, math.floor(Ability.GetCooldownTimeLeft(sunStrike)), 0)
			end
		end

	-- dynamic mode
	if fooAllInOne.InvokerComboSelector == 11 then
		Renderer.SetDrawColor(0, 205, 0, 255)
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	Renderer.DrawImage(imageHandleBlast, startX+2+(imageSize/2)*0, startY+12+(imageSize+2)*10, (imageSize/2), (imageSize/2))
	Renderer.DrawImage(imageHandleMeteor, startX+2+(imageSize/2)*1, startY+12+(imageSize+2)*10, (imageSize/2), (imageSize/2))
	
	Renderer.DrawImage(imageHandleSunStrike, startX+2+(imageSize/2)*0, startY+12+(imageSize+2)*10+(imageSize/2), (imageSize/2), (imageSize/2))
	Renderer.DrawImage(imageHandleTornado, startX+2+(imageSize/2)*1, startY+12+(imageSize+2)*10+(imageSize/2), (imageSize/2), (imageSize/2))
	
	Renderer.DrawImage(imageHandleEmp, startX+2+(imageSize/2)*2, startY+12+(imageSize+2)*10, (imageSize/2), (imageSize/2))
	Renderer.DrawImage(imageHandleSnap, startX+2+(imageSize/2)*3, startY+12+(imageSize+2)*10, (imageSize/2), (imageSize/2))
	
	Renderer.DrawImage(imageHandleSpirit, startX+2+(imageSize/2)*2, startY+12+(imageSize+2)*10+(imageSize/2), (imageSize/2), (imageSize/2))
	Renderer.DrawImage(imageHandleAlacrity, startX+2+(imageSize/2)*3, startY+12+(imageSize+2)*10+(imageSize/2), (imageSize/2), (imageSize/2))
	
	Renderer.DrawImage(imageHandleIcewall, startX+2+(imageSize/2)*4, startY+12+(imageSize+2)*10, (imageSize/2), (imageSize/2))
	Renderer.DrawImage(imageHandleGhost, startX+2+(imageSize/2)*4, startY+12+(imageSize+2)*10+(imageSize/2), (imageSize/2), (imageSize/2))

	Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+(imageSize/2)*6, startY+12+(imageSize+2)*10+math.floor(imageSize/6), "dynamic", 1)


	-- custom mode
	local skillTranslator = {
		imageHandleTornado,
		imageHandleEmp,
		imageHandleMeteor, 
		imageHandleBlast,
		imageHandleSunStrike,
		imageHandleIcewall,
		imageHandleSnap,
		imageHandleSpirit,
		imageHandleAlacrity,
		imageHandleEul,
		imageHandleAtos,
		imageHandleRefresher
			}
		-- custom mode 1
	if fooAllInOne.InvokerComboSelector == 12 then
		if fooAllInOne.InvokerInvokedChecker(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)], invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)]) and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)], startX+2+imageSize*0, startY+14+(imageSize+2)*12, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)], startX+2+imageSize*1, startY+14+(imageSize+2)*12, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)], startX+2+imageSize*2, startY+14+(imageSize+2)*12, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill4)], startX+2+imageSize*3, startY+14+(imageSize+2)*12, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill5) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill5)], startX+2+imageSize*4, startY+14+(imageSize+2)*12, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill6) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill6)], startX+2+imageSize*5, startY+14+(imageSize+2)*12, imageSize, imageSize)
	end
		-- custom mode 2
	if fooAllInOne.InvokerComboSelector == 13 then
		if fooAllInOne.InvokerInvokedChecker(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)], invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)]) and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)], startX+2+imageSize*0, startY+15+(imageSize+2)*13, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)], startX+2+imageSize*1, startY+15+(imageSize+2)*13, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)], startX+2+imageSize*2, startY+15+(imageSize+2)*13, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill4)], startX+2+imageSize*3, startY+15+(imageSize+2)*13, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill5) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill5)], startX+2+imageSize*4, startY+15+(imageSize+2)*13, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill6) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill6)], startX+2+imageSize*5, startY+15+(imageSize+2)*13, imageSize, imageSize)
	end
		-- custom mode 3
	if fooAllInOne.InvokerComboSelector == 14 then
		if fooAllInOne.InvokerInvokedChecker(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)], invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)]) and Ability.IsReady(NPC.GetAbility(myHero, "invoker_invoke")) then
			Renderer.SetDrawColor(0, 205, 0, 255)
		else
			Renderer.SetDrawColor(255, 255, 0, 255)
		end
	else	
		Renderer.SetDrawColor(255, 255, 255, 150)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)], startX+2+imageSize*0, startY+16+(imageSize+2)*14, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)], startX+2+imageSize*1, startY+16+(imageSize+2)*14, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)], startX+2+imageSize*2, startY+16+(imageSize+2)*14, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill4)], startX+2+imageSize*3, startY+16+(imageSize+2)*14, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill5) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill5)], startX+2+imageSize*4, startY+16+(imageSize+2)*14, imageSize, imageSize)
	end
	if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill6) > 0 then
		Renderer.DrawImage(skillTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill6)], startX+2+imageSize*5, startY+16+(imageSize+2)*14, imageSize, imageSize)
	end
		-- custom combo text
	Renderer.SetDrawColor(255, 50, 0, 150)
	Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+2+imageSize*1, startY+11+math.floor(imageSize/3)+(imageSize+2)*11, "custom combo", 1)
	
	-- longest CDs
	if Menu.GetValue(fooAllInOne.optionHeroInvokerPanelCD) == 1 then
		Renderer.SetDrawColor(255, 0, 0, 150)
		if fooAllInOne.GetLongestCooldown(myHero, coldSnap, forgeSpirit, alacrity) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+2+(imageSize+2)*0+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, coldSnap, forgeSpirit, alacrity), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, coldSnap, forgeSpirit, sunStrike) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+3+(imageSize+2)*1+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, coldSnap, forgeSpirit, sunStrike), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, coldSnap, iceWall, tornado, emp) > 0 then
		Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+4+(imageSize+2)*2+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, coldSnap, iceWall, tornado, emp), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, tornado, chaosMeteor, deafeningBlast) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+5+(imageSize+2)*3+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, tornado, chaosMeteor, deafeningBlast), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, euls, sunStrike, chaosMeteor, deafeningBlast) > 0 then
		Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+6+(imageSize+2)*4+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, euls, sunStrike, chaosMeteor, deafeningBlast), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, tornado, emp, chaosMeteor, deafeningBlast) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+7+(imageSize+2)*5+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, tornado, emp, chaosMeteor, deafeningBlast), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, tornado, sunStrike, chaosMeteor, deafeningBlast) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+8+(imageSize+2)*6+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, tornado, sunStrike, chaosMeteor, deafeningBlast), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, tornado, sunStrike, chaosMeteor, deafeningBlast, refresher) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+9+(imageSize+2)*7+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, tornado, sunStrike, chaosMeteor, deafeningBlast, refresher), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, tornado, emp, chaosMeteor, deafeningBlast, refresher) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+10+(imageSize+2)*8+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, tornado, emp, chaosMeteor, deafeningBlast, refresher), 1)
		end
		if fooAllInOne.GetLongestCooldown(myHero, sunStrike, chaosMeteor, deafeningBlast, refresher) > 0 then
			Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+11+(imageSize+2)*9+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, sunStrike, chaosMeteor, deafeningBlast, refresher), 1)
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3) > 0 then
			if fooAllInOne.GetLongestCooldown(myHero, NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)])) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+14+(imageSize+2)*12+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill1)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo1Skill3)])), 1)
			end
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3) > 0 then
			if fooAllInOne.GetLongestCooldown(myHero, NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)])) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+15+(imageSize+2)*13+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill1)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo2Skill3)])), 1)
			end
		end
		if Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2) > 0 and Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3) > 0 then
			if fooAllInOne.GetLongestCooldown(myHero, NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)])) > 0 then
				Renderer.DrawText(fooAllInOne.invokerPanelFont, startX+1-imageSize, startY+16+(imageSize+2)*14+math.floor(imageSize/9), fooAllInOne.GetLongestCooldown(myHero, NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill1)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill2)]), NPC.GetAbility(myHero, invokeTranslator[Menu.GetValue(fooAllInOne.optionHeroInvokerCombo3Skill3)])), 1)
			end
		end
	end

end

function fooAllInOne.invokerPanelInit()

	fooAllInOne.invokerPanelBoxSize = Menu.GetValue(fooAllInOne.invokerPanelSizeOption)

	fooAllInOne.invokerPanelFont = Renderer.LoadFont("Tahoma", math.floor(fooAllInOne.invokerPanelBoxSize * 0.6), Enum.FontWeight.BOLD)

	local iconsTempTable = {
		"invoker_tornado",
		"invoker_emp",
		"invoker_chaos_meteor", 
		"invoker_deafening_blast",
		"invoker_sun_strike",
		"invoker_ice_wall",
		"invoker_cold_snap",
		"invoker_forge_spirit",
		"invoker_alacrity",
		"item_cyclone",
		"item_rod_of_atos",
		"item_refresher",
		"item_blink",
		"item_ultimate_scepter",
		"invoker_ghost_walk"
			}

	for i = 1, #iconsTempTable do
		local imageHandle = fooAllInOne.invokerCachedIcons[iconsTempTable[i]]
		if imageHandle == nil then
			if iconsTempTable[i] ~= "item_cyclone" and iconsTempTable[i] ~= "item_rod_of_atos" and iconsTempTable[i] ~= "item_refresher" and iconsTempTable[i] ~= "item_blink" and iconsTempTable[i] ~= "item_ultimate_scepter" then
				imageHandle = Renderer.LoadImage("resource/flash3/images/spellicons/" .. iconsTempTable[i] .. ".png")	
				fooAllInOne.invokerCachedIcons[iconsTempTable[i]] = imageHandle
			else
				imageHandle = Renderer.LoadImage("resource/flash3/images/items/" .. string.gsub(iconsTempTable[i], "item_", "") .. ".png")
				fooAllInOne.invokerCachedIcons[iconsTempTable[i]] = imageHandle
			end
		end
	end
	
end

function fooAllInOne.invokerDisplayInit()

	fooAllInOne.invokerDisplayBoxSize = Menu.GetValue(fooAllInOne.invokerDisplaySizeOption)
	fooAllInOne.invokerDisplayInnerBoxSize = fooAllInOne.invokerDisplayBoxSize - 2

	fooAllInOne.invokerDisplayFont = Renderer.LoadFont("Tahoma", math.floor(fooAllInOne.invokerDisplayInnerBoxSize * 0.643), Enum.FontWeight.BOLD)

	local iconsTempTable = {
		"invoker_tornado",
		"invoker_emp",
		"invoker_chaos_meteor", 
		"invoker_deafening_blast",
		"invoker_sun_strike",
		"invoker_ice_wall",
		"invoker_cold_snap",
		"invoker_forge_spirit",
		"invoker_alacrity",
		"item_cyclone",
		"item_rod_of_atos",
		"item_refresher",
		"item_blink",
		"item_ultimate_scepter",
		"invoker_ghost_walk"
			}

	for i = 1, #iconsTempTable do
		local imageHandle = fooAllInOne.invokerCachedIcons[iconsTempTable[i]]
		if imageHandle == nil then
			if iconsTempTable[i] ~= "item_cyclone" and iconsTempTable[i] ~= "item_rod_of_atos" and iconsTempTable[i] ~= "item_refresher" and iconsTempTable[i] ~= "item_blink" and iconsTempTable[i] ~= "item_ultimate_scepter" then
				imageHandle = Renderer.LoadImage("resource/flash3/images/spellicons/" .. iconsTempTable[i] .. ".png")	
				fooAllInOne.invokerCachedIcons[iconsTempTable[i]] = imageHandle
			else
				imageHandle = Renderer.LoadImage("resource/flash3/images/items/" .. string.gsub(iconsTempTable[i], "item_", "") .. ".png")
				fooAllInOne.invokerCachedIcons[iconsTempTable[i]] = imageHandle
			end
		end
	end

end

function fooAllInOne.invokerDisplayDrawDisplay(myHero)

	if not Menu.IsEnabled(fooAllInOne.invokerDisplayOption) then return end

	if fooAllInOne.invokerDisplayNeedsInit then
        	fooAllInOne.invokerDisplayInit()
        	fooAllInOne.invokerDisplayNeedsInit = false
    	end

	local w, h = Renderer.GetScreenSize()
	x = math.floor(w/2);
	y = math.floor(h/5*3);
	y = y+Menu.GetValue(fooAllInOne.invokerDisplayY)
	x = x+Menu.GetValue(fooAllInOne.invokerDisplayX)

	local abilities = {}

	for i = 3, 15 do
        	local ability = NPC.GetAbilityByIndex(myHero, i)
		local name = Ability.GetName(ability)
        	if ability ~= nil and Entity.IsAbility(ability) and not Ability.IsAttributes(ability) and name~="invoker_invoke" and name ~= "invoker_empty1" and name~= "invoker_empty2"then
            		if Ability.GetCooldownTimeLeft(ability)==0 then
               			table.insert(abilities, 1, ability)
            		else 
                		table.insert(abilities, #abilities+1, ability)
            		end 
        	end
    	end

    	if Menu.IsEnabled(fooAllInOne.invokerDisplaySortAbilitiesOption) then
        	table.sort(abilities, function(a, b) return Ability.GetName(a) < Ability.GetName(b) end)
    	end

    	local startX = x - math.floor(((#abilities) / 2) * fooAllInOne.invokerDisplayBoxSize)

    	Renderer.SetDrawColor(0, 0, 0, 150)
    	Renderer.DrawFilledRect(startX + 1, y - 1, (fooAllInOne.invokerDisplayBoxSize * #abilities) + 2, fooAllInOne.invokerDisplayBoxSize + 2)

   	for i, ability in ipairs(abilities) do
        	fooAllInOne.invokerDisplayDrawAbilitySquare(myHero, ability, startX, y, i - 1)
    	end


    	Renderer.SetDrawColor(0, 0, 0, 255)
    	Renderer.DrawOutlineRect(startX + 1, y - 1, (fooAllInOne.invokerDisplayBoxSize * #abilities) + 2, fooAllInOne.invokerDisplayBoxSize + 2)

end

function fooAllInOne.invokerDisplayDrawAbilitySquare(myHero, ability, x, y, index)

    	local abilityName = Ability.GetName(ability)
    	local imageHandle = fooAllInOne.invokerCachedIcons[abilityName]
		if imageHandle == nil then
			fooAllInOne.invokerPanelInit()
		end
			

    	local realX = x + (index * fooAllInOne.invokerDisplayBoxSize) + 2

    	local castable = Ability.IsCastable(ability, NPC.GetMana(myHero), true)

    	local imageColor = { 255, 255, 255 }
    	local outlineColor = { 0, 255 , 0 }

    	if not castable then
        	if Ability.GetLevel(ability) == 0 then
            		imageColor = { 125, 125, 125 }
            		outlineColor = { 255, 0, 0 }
        	elseif Ability.GetManaCost(ability) > NPC.GetMana(myHero) then
            		imageColor = { 150, 150, 255 }
            		outlineColor = { 0, 0, 255 }
        	else
            		imageColor = { 255, 150, 150 }
            		outlineColor = { 255, 0, 0 }
        	end
    	end

    	local hoveringOver = Input.IsCursorInRect(realX, y, fooAllInOne.invokerDisplayBoxSize, fooAllInOne.invokerDisplayBoxSize)

    	local boxSize = fooAllInOne.invokerDisplayBoxSize

    	if hoveringOver then
        	boxSize = math.floor(boxSize * 1.25)
    	end

    	Renderer.SetDrawColor(imageColor[1], imageColor[2], imageColor[3], 255)
    	Renderer.DrawImage(imageHandle, realX, y, fooAllInOne.invokerDisplayBoxSize, fooAllInOne.invokerDisplayBoxSize)

    	Renderer.SetDrawColor(outlineColor[1], outlineColor[2], outlineColor[3], 255)
    	Renderer.DrawOutlineRect(realX, y, fooAllInOne.invokerDisplayBoxSize, fooAllInOne.invokerDisplayBoxSize)

    	local cdLength = Ability.GetCooldownLength(ability)

    	if not Ability.IsReady(ability) and cdLength > 0.0 then
        	local cooldownRatio = Ability.GetCooldown(ability) / cdLength
        	local cooldownSize = math.floor(fooAllInOne.invokerDisplayBoxSize * cooldownRatio)

        	Renderer.SetDrawColor(255, 255, 255, 50)
        	Renderer.DrawFilledRect(realX + 1, y + (fooAllInOne.invokerDisplayInnerBoxSize - cooldownSize) + 1, fooAllInOne.invokerDisplayInnerBoxSize, cooldownSize)

        	Renderer.SetDrawColor(255, 255, 255)
        	Renderer.DrawText(fooAllInOne.invokerDisplayFont, realX + 1, y, math.floor(Ability.GetCooldown(ability)), 0)
    	elseif hoveringOver and Input.IsKeyDownOnce(Enum.ButtonCode.MOUSE_LEFT) then
        	fooAllInOne.invokerInvokeAbility(myHero, ability)
    	end

end
				
-- killsteal functions
function fooAllInOne.AutoNukeKillSteal(myHero)

	if not myHero then return end
	local myMana = NPC.GetMana(myHero)

	for _, stealEnemyEntity in ipairs(NPC.GetHeroesInRadius(myHero, 1200, Enum.TeamType.TEAM_ENEMY)) do
		if not stealEnemyEntity then return end

	stealEnemy = fooAllInOne.targetChecker(stealEnemyEntity)
		if not stealEnemy then return end
		if NPC.HasState(stealEnemy, Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) or NPC.IsChannellingAbility(myHero) or NPC.HasState(myHero, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then return end

		for n, v in ipairs(fooAllInOne.AbilityList) do
			local heroName = v[1]
	      		local skillName = v[2]
			local skillType = v[3]
			local targetMode = v[4]
			local specialAttribute = v[5]
		
			
			if NPC.GetUnitName(myHero) == heroName then
				if skillType == "nuke" and NPC.GetAbility(myHero, skillName) ~= nil and not Ability.IsUltimate(NPC.GetAbility(myHero, skillName)) then
					if Entity.GetHealth(stealEnemy) > 0 then
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) or skillName == "rattletrap_rocket_flare" then
							local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0)
							if skillDamage < 1 then
								if skillName == "skywrath_mage_arcane_bolt" then
									skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute) + (1.6 * Hero.GetIntellectTotal(myHero))
								else
									skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute)
								end
							end
							if Entity.GetHealth(stealEnemy) + NPC.GetHealthRegen(stealEnemy) <= (((1 - NPC.GetMagicalArmorValue(stealEnemy)) * skillDamage) + (skillDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))) then
								if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
									if targetMode == "target" and not NPC.IsLinkensProtected(stealEnemy) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
									if targetMode == "position" then
										Ability.CastPosition(NPC.GetAbility(myHero, skillName), Entity.GetAbsOrigin(stealEnemy))
										return
									end
									if targetMode == "no target" then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
									if targetMode == "skillshot" then
										if skillName == "windrunner_powershot" then
											local powershotPrediction = 1 + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 3000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, powershotPrediction))
											return
										end
										if skillName == "kunkka_torrent" then
											local kunkkaPrediction = 2 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, kunkkaPrediction))
											return
										end
										if skillName == "lina_dragon_slave" then
											local dragonSlavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1200) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, dragonSlavePrediction))
											return
										end
										if skillName == "magnataur_shockwave" then
											local shockwavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1050) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, shockwavePrediction))
											return
										end
									--	if skillName == "morphling_waveform" then
									--		local wavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1250) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
									--		Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, wavePrediction))
									--		return
									--	end
										if skillName == "pugna_nether_blast" then
											local blastPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + 0.9 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, blastPrediction))
											return
										end
										if skillName == "rattletrap_rocket_flare" then
											local flairPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1750) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, flairPrediction))
											return
										end
										if skillName == "tusk_ice_shards" then
											local shardsPrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 1100) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, shardsPrediction))
											return
										end
										if skillName == "vengefulspirit_wave_of_terror" then
											local wavePrediction = Ability.GetCastPoint(NPC.GetAbility(myHero, skillName)) + (Entity.GetAbsOrigin(stealEnemy):__sub(Entity.GetAbsOrigin(myHero)):Length2D() / 2000) + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
											Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castLinearPrediction(myHero, stealEnemy, wavePrediction))
											return
										end
									--	if skillName == "zuus_lightning_bolt" then
									--		local boltPrediction = 0.4 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)
									--		Ability.CastPosition(NPC.GetAbility(myHero, skillName), fooAllInOne.castPrediction(myHero, stealEnemy, boltPrediction))
									--		return
									--	end
									end
								end
							end	
						end
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) and targetMode == "special" then
							if skillName == "nyx_assassin_mana_burn" then
								local skillDamage = Ability.GetLevelSpecialValueForFloat(NPC.GetAbility(myHero, skillName), "float_multiplier") * Hero.GetIntellectTotal(stealEnemy) * (1 + Hero.GetIntellectTotal(myHero) / 16 / 100)
								if Entity.GetHealth(stealEnemy) <= (((1 - NPC.GetMagicalArmorValue(stealEnemy)) * skillDamage) + (skillDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))) and NPC.GetMana(stealEnemy) >= Entity.GetHealth(stealEnemy) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
								end
							end
						end
						if skillName == "queenofpain_scream_of_pain" then
							if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), "area_of_effect")) and targetMode == "special" then
								if Entity.GetHealth(stealEnemy) <= (1 - NPC.GetMagicalArmorValue(stealEnemy))*Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0) + (Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0) * (Hero.GetIntellectTotal(myHero) / 14 / 100)) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
								end
							end
						end
						if skillName == "nevermore_shadowraze1" and targetMode == "special" then
							local razePos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(200)
							local razePrediction = 0.55 + 0.1 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)			
							local predictedPos = fooAllInOne.castPrediction(myHero, stealEnemy, razePrediction)
							local disRazePOSpredictedPOS = (razePos - predictedPos):Length2D()
							if disRazePOSpredictedPOS <= 200 and not Entity.IsTurning(myHero) then
						--	if NPC.IsPositionInRange(stealEnemy, razePos, 200, 0) and not Entity.IsTurning(myHero) then
								local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName))
								if Entity.GetHealth(stealEnemy) <= (((1 - NPC.GetMagicalArmorValue(stealEnemy)) * skillDamage) + (skillDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										if os.clock() - fooAllInOne.lastCastTime2 >= 0.55 then
											Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
											fooAllInOne.lastCastTime2 = os.clock()
											return
										end
									end
								end
							end
						end
						if skillName == "nevermore_shadowraze2" and targetMode == "special" then
							local razePos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(450)
							local razePrediction = 0.55 + 0.1 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)			
							local predictedPos = fooAllInOne.castPrediction(myHero, stealEnemy, razePrediction)
							local disRazePOSpredictedPOS = (razePos - predictedPos):Length2D()
							if disRazePOSpredictedPOS <= 200 and not Entity.IsTurning(myHero) then
					--		if NPC.IsPositionInRange(stealEnemy, razePos, 200, 0) and not Entity.IsTurning(myHero) then
								local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName))
								if Entity.GetHealth(stealEnemy) <= (((1 - NPC.GetMagicalArmorValue(stealEnemy)) * skillDamage) + (skillDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										if os.clock() - fooAllInOne.lastCastTime2 >= 0.55 then
											Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
											fooAllInOne.lastCastTime2 = os.clock()
											return
										end
									end
								end
							end
						end
						if skillName == "nevermore_shadowraze3" and targetMode == "special" then
							local razePos = Entity.GetAbsOrigin(myHero) + Entity.GetRotation(myHero):GetForward():Normalized():Scaled(700)
							local razePrediction = 0.55 + 0.1 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)			
							local predictedPos = fooAllInOne.castPrediction(myHero, stealEnemy, razePrediction)
							local disRazePOSpredictedPOS = (razePos - predictedPos):Length2D()
							if disRazePOSpredictedPOS <= 200 and not Entity.IsTurning(myHero) then
						--	if NPC.IsPositionInRange(stealEnemy, razePos, 200, 0) and not Entity.IsTurning(myHero) then
								local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName))
								if Entity.GetHealth(stealEnemy) <= (((1 - NPC.GetMagicalArmorValue(stealEnemy)) * skillDamage) + (skillDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))) then
									if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
										if os.clock() - fooAllInOne.lastCastTime2 >= 0.55 then
											Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
											fooAllInOne.lastCastTime2 = os.clock()
											return
										end
									end
								end
							end
						end
						if skillName == "skywrath_mage_concussive_shot" and targetMode == "special" then
							local skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute)
							if NPC.IsEntityInRange(myHero, stealEnemy, 1600, 0) then
								if Entity.GetHealth(stealEnemy) <= (((1 - NPC.GetMagicalArmorValue(stealEnemy)) * skillDamage) + (skillDamage * (Hero.GetIntellectTotal(myHero) / 14 / 100))) then
									local enemyDis = (Entity.GetAbsOrigin(myHero) - Entity.GetAbsOrigin(stealEnemy)):Length2D()
									local aghanimsBuffed = false
										if NPC.HasItem(myHero, "item_ultimate_scepter", true) or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
											aghanimsBuffed = true
										end
									if not aghanimsBuffed then
										if #Entity.GetHeroesInRadius(myHero, enemyDis, Enum.TeamType.TEAM_ENEMY) <= 1 then
											Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
											return
										end
									else
										if #Entity.GetHeroesInRadius(myHero, enemyDis, Enum.TeamType.TEAM_ENEMY) <= 2 then
											Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
											return
										end
									end
								end
							end
						end
					end
				end
				if skillType == "pure" and NPC.GetAbility(myHero, skillName) ~= nil and not Ability.IsUltimate(NPC.GetAbility(myHero, skillName)) then
					if Entity.GetHealth(stealEnemy) > 0 then
						if NPC.IsEntityInRange(myHero, stealEnemy, Ability.GetCastRange(NPC.GetAbility(myHero, skillName))) then
							local skillDamage = Ability.GetDamage(NPC.GetAbility(myHero, skillName), 0)
							if  skillDamage < 1 then
								if skillName == "skywrath_mage_arcane_bolt" then
									skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute) + (1.6 * Hero.GetIntellectTotal(myHero))
								else
									skillDamage = Ability.GetLevelSpecialValueFor(NPC.GetAbility(myHero, skillName), specialAttribute)
								end
							end
							if Entity.GetHealth(stealEnemy) + NPC.GetHealthRegen(stealEnemy) <= skillDamage then
								if NPC.GetAbility(myHero, skillName) and Ability.IsCastable(NPC.GetAbility(myHero, skillName), myMana) then
									if targetMode == "target" and not NPC.IsLinkensProtected(stealEnemy) then
										Ability.CastTarget(NPC.GetAbility(myHero, skillName), stealEnemy)
										return
									end
									if targetMode == "position" then
										Ability.CastPosition(NPC.GetAbility(myHero, skillName), Entity.GetAbsOrigin(stealEnemy))
										return
									end
									if targetMode == "no target" then
										Ability.CastNoTarget(NPC.GetAbility(myHero, skillName))
										return
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function fooAllInOne.AutoSunstrikeKillStealNew(myHero)

	if not myHero then return end
	if os.clock() - fooAllInOne.invokerChannellingKillstealTimer <= 3 then return end
	
	if Ability.GetLevel(NPC.GetAbilityByIndex(myHero, 2)) < 1 then return end
	if fooAllInOne.heroCanCastSpells(myHero) == false then return end
	if fooAllInOne.isHeroChannelling(myHero) == true then return end 
	if fooAllInOne.IsHeroInvisible(myHero) == true then return end

	if Menu.IsKeyDownOnce(fooAllInOne.optionComboKey) then return end
	if Menu.IsKeyDown(fooAllInOne.optionComboKey) then return end

	local myMana = NPC.GetMana(myHero)

	local exort = NPC.GetAbility(myHero, "invoker_exort")
	local invoke = NPC.GetAbility(myHero, "invoker_invoke")
	local aghanims = NPC.GetItem(myHero, "item_ultimate_scepter", true)
	local sunStrike = NPC.GetAbility(myHero, "invoker_sun_strike")
	local sunStrikeDMG = 37.5 + (62.5 * Ability.GetLevel(exort))
		if aghanims or NPC.HasModifier(myHero, "modifier_item_ultimate_scepter_consumed") then
			sunStrikeDMG = 37.5 + (62.5 * (Ability.GetLevel(exort) + 1))
		end
	
	if not sunStrike then return end
	if not Ability.IsReady(sunStrike) then return end
	if not Ability.IsCastable(sunStrike, myMana) then return end

	if Menu.IsEnabled(fooAllInOne.optionKillStealInvokerTPpartice) then
		if fooAllInOne.invokerSunstrikeKSParticleProcess(myHero) == true then
			if not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
				if Menu.IsEnabled(fooAllInOne.optionKillStealAutoInvoke) then
					if invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
						fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
						Ability.CastPosition(sunStrike, fooAllInOne.TPParticlePosition, true)
						fooAllInOne.invokerChannellingKillstealTimer = os.clock()
						return
					end
				else
					return
				end
			else
				Ability.CastPosition(sunStrike, fooAllInOne.TPParticlePosition)
				fooAllInOne.invokerChannellingKillstealTimer = os.clock()
				return
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionKillStealInvokerImmobil) then
		for _, immobilizedEntity in ipairs(NPC.GetHeroesInRadius(myHero, 99999, Enum.TeamType.TEAM_ENEMY)) do
			if immobilizedEntity then
				local immobilizedEnemy = fooAllInOne.targetChecker(immobilizedEntity)
				if immobilizedEnemy and Entity.IsAlive(immobilizedEnemy) then
					local enemyProcessing = fooAllInOne.invokerSunstrikeKSdisabledTargetProcess(myHero, immobilizedEnemy)
					if next(enemyProcessing) ~= nil then
						if enemyProcessing[1] > 0 and enemyProcessing[2] > 0 then
							local timing = enemyProcessing[1]
							local HPthreshold = enemyProcessing[2]
							if Entity.GetHealth(immobilizedEnemy) < HPthreshold then
								if GameRules.GetGameTime() >= timing then
									if not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
										if Menu.IsEnabled(fooAllInOne.optionKillStealAutoInvoke) then
											if invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
												fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
												Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(immobilizedEnemy), true)
												fooAllInOne.invokerChannellingKillstealTimer = os.clock()
												return
											end
										else
											return
										end
									else
										Ability.CastPosition(sunStrike, Entity.GetAbsOrigin(immobilizedEnemy))
										fooAllInOne.invokerChannellingKillstealTimer = os.clock()
										return
									end
								end
							end
						end
					end
				end
			end
		end
	end

	if fooAllInOne.InvokerKSparticleProcess[1][5]:__tostring() ~= Vector():__tostring() then
		local processData = table.remove(fooAllInOne.InvokerKSparticleProcess, 1)
		fooAllInOne.InvokerKSparticleProcess = {{nil, nil, 0, nil, Vector()}}
		local name = processData[2]
		local time = processData[3]
		local pos = processData[5]

		for _, v in ipairs(Heroes.InRadius(pos, 175, Entity.GetTeamNum(myHero), Enum.UnitType.TEAM_ENEMY)) do
			if v and Entity.IsHero(v) and not NPC.IsIllusion(v) and Entity.IsAlive(v) then
				if Entity.GetHealth(v) < sunStrikeDMG * (1 + Menu.GetValue(fooAllInOne.optionKillStealInvokerTreshold) / 100) then
					local duration
					if name == "rattletrap_cog_deploy" then
						duration = 2 + fooAllInOne.GetTeammateAbilityLevel(myHero, "rattletrap_cog")
					elseif name == "furion_sprout" then
						duration = 2 + fooAllInOne.GetTeammateAbilityLevel(myHero, "furion_sprout")
					end
					if GameRules.GetGameTime() + 1.5 < time + duration then
						if not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
							if Menu.IsEnabled(fooAllInOne.optionKillStealAutoInvoke) then
								if invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
									fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
									Ability.CastPosition(sunStrike, pos, true)
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									return
								end
							else
								return
							end
						else
							Ability.CastPosition(sunStrike, pos)
							fooAllInOne.invokerChannellingKillstealTimer = os.clock()
							return
						end
					end
				end
			end
		end
	end		
	
	if fooAllInOne.GlimpseParticleTime > 0 and fooAllInOne.GlimpseParticleUnit ~= nil and fooAllInOne.GlimpseParticlePosition ~= Vector() and fooAllInOne.GlimpseParticlePositionStart ~= Vector() then
		if not NPC.IsIllusion(fooAllInOne.GlimpseParticleUnit) and Entity.IsAlive(fooAllInOne.GlimpseParticleUnit) then
			if Entity.GetHealth(fooAllInOne.GlimpseParticleUnit) < sunStrikeDMG - 25 then
				local glimpseTiming
					if (fooAllInOne.GlimpseParticlePositionStart - fooAllInOne.GlimpseParticlePosition):Length2D() / 600 >= 1.8 then
						glimpseTiming = 1.8
					else
						glimpseTiming = (fooAllInOne.GlimpseParticlePositionStart - fooAllInOne.GlimpseParticlePosition):Length2D() / 600
					end
				if glimpseTiming > 1.5 then
					if GameRules.GetGameTime() >= fooAllInOne.GlimpseParticleTime + glimpseTiming - 1.65 then
						if not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
							if Menu.IsEnabled(fooAllInOne.optionKillStealAutoInvoke) then
								if invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
									fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
									Ability.CastPosition(sunStrike, fooAllInOne.GlimpseParticlePosition, true)
									fooAllInOne.invokerChannellingKillstealTimer = os.clock()
									fooAllInOne.GlimpseParticleUnit = nil
									return
								end
							else
								return
							end
						else
							Ability.CastPosition(sunStrike, fooAllInOne.GlimpseParticlePosition)
							fooAllInOne.invokerChannellingKillstealTimer = os.clock()
							fooAllInOne.GlimpseParticleUnit = nil
							return
						end
					end
				end
			end
		end
	end

	if Menu.IsEnabled(fooAllInOne.optionKillStealInvokerRunning) then
		for _, stealEnemyEntity in ipairs(NPC.GetHeroesInRadius(myHero, 99999, Enum.TeamType.TEAM_ENEMY)) do
			local sunStrikeEnemy = fooAllInOne.targetChecker(stealEnemyEntity)
			if sunStrikeEnemy and Entity.IsAlive(sunStrikeEnemy) then
				local bestTarget
				local maxAgi = 0
				if Entity.GetHealth(sunStrikeEnemy) <= sunStrikeDMG and Hero.GetAgilityTotal(sunStrikeEnemy) > maxAgi then
					bestTarget = sunStrikeEnemy
					maxAgi = Hero.GetAgilityTotal(sunStrikeEnemy)
				end
				if Entity.GetHealth(sunStrikeEnemy) > sunStrikeDMG or Entity.GetHealth(sunStrikeEnemy) < 1  then
					bestTarget = nil
					maxAgi = 0
				end
				if bestTarget then
					if not NPC.IsRunning(bestTarget) then
						return
					else
						if fooAllInOne.isEnemyTurning(bestTarget) == false then
							if Ability.IsReady(sunStrike) and Ability.IsCastable(sunStrike, myMana) then
								if not fooAllInOne.InvokerIsAbilityInvoked(myHero, sunStrike) then
									if Menu.IsEnabled(fooAllInOne.optionKillStealAutoInvoke) then
										if invoke and Ability.IsCastable(invoke, myMana) and fooAllInOne.InvokerIsSkillInvokable(myHero, sunStrike) then
											fooAllInOne.invokerInvokeAbility(myHero, sunStrike)
											Ability.CastPosition(sunStrike, fooAllInOne.castPrediction(myHero, bestTarget, Ability.GetCastPoint(NPC.GetAbility(myHero, "invoker_sun_strike")) + 1.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)), true)
											return
										end
									else
										return
									end
								else
									Ability.CastPosition(sunStrike, fooAllInOne.castPrediction(myHero, bestTarget, Ability.GetCastPoint(NPC.GetAbility(myHero, "invoker_sun_strike")) + 1.7 + (NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) * 2)))
									return
								end
							end
						end
					end
				end
			end
		end
	end

end

function fooAllInOne.Debugger(time, npc, ability, order)

	if not Menu.IsEnabled(fooAllInOne.optionDebugEnable) then return end
	Log.Write(tostring(time) .. " " .. tostring(NPC.GetUnitName(npc)) .. " " .. tostring(ability) .. " " .. tostring(order))

end

return fooAllInOne
