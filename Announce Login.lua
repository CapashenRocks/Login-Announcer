--Lua Script: Player Login & Logout Announcement Script
--Coded by: CapashenRocks (Github)/Capashen22 (Discord)
--V2- Added login location and a logout announcement.


local CLASS_COLORS = {
    ["Warrior"]     = "|cffC79C6EWarrior|r",
    ["Paladin"]     = "|cffF58CBAPaladin|r",
    ["Hunter"]      = "|cffABD473Hunter|r",
    ["Rogue"]       = "|cffFFF569Rogue|r",
    ["Priest"]      = "|cffFFFFFFPriest|r",
    ["Death Knight"]= "|cffC41F3BDeath Knight|r",
    ["Shaman"]      = "|cff0070DEShaman|r",
    ["Mage"]        = "|cff69CCF0Mage|r",
    ["Warlock"]     = "|cff9482C9Warlock|r",
    ["Druid"]       = "|cffFF7D0ADruid|r",
    ["Demon Hunter"]= "|cffA330C9Demon Hunter|r",
    ["Monk"]        = "|cff00FF96Monk|r",
    ["Evoker"]      = "|cff33937FEvoker|r"
}

local raceNames = { 
    [1] = "|cff00ff00Human|r", [2] = "|cff00ff00Orc|r", [3] = "|cff00ff00Dwarf|r", [4] = "|cff00ff00Night Elf|r",
    [5] = "|cff00ff00Undead|r", [6] = "|cff00ff00Tauren|r", [7] = "|cff00ff00Gnome|r", [8] = "|cff00ff00Troll|r", [9]= "|cff00ff00Goblin|r",[10] = "|cff00ff00Blood Elf|r", [11] = "|cff00ff00Draenei|r", [22] = "|cff00ff00Worgen|r", [25]= "|cff00ff00Pandaren|r", [26]= "|cff00ff00Pandaren|r", [27]= "|cff00ff00Nightbourne|r", [28]= "|cff00ff00Highmountain Tauren|r", [29]= "|cff00ff00Void Elf|r", [30]= "|cff00ff00Lightforged Draenei|r", [31]= "|cff00ff00Zandalari Troll|r", [32]= "|cff00ff00Kul Tiran|r", [34]= "|cff00ff00Dark Iron Dwarf|r", [35]= "|cff00ff00Vulpera|r", [36]= "|cff00ff00Mag'har Orc|r", [37]= "|cff00ff00Mechagnome|r", [52]= "|cff00ff00Dracthyr|r", [70]= "|cff00ff00Dracthyr|r", [84]= "|cff00ff00Earthen Dwarf|r", [85]= "|cff00ff00Earthen Dwarf|r", 
}

local function ColorName(player)
    if player:GetTeam() == 0 then -- Alliance
        return "|cff00ff00"..player:GetName().."|r"
    else -- Horde
        return "|cff00ff00"..player:GetName().."|r"
    end
end

local function ColorFaction(player)
    if player:GetTeam() == 0 then 
        return "|cff0070FFAlliance|r"
    else 
        return "|cffFF0000Horde|r"
    end
end

local function GetClassColored(player)
    local class = player:GetClassAsString() 
    return CLASS_COLORS[class] 
end

local function GetPlayerArea(player)
    local areaId = player:GetAreaId()
    local areaName = GetAreaName and GetAreaName(areaId, 0) or "Deep in the Wilderness" -- 0 = default locale
    return "|cff00ff00" .. areaName .. "|r"
end

local function OnLogin(event, player)
    local race = raceNames[player:GetRace()] or "Unknown Race"
    local coloredName = ColorName(player)
    local class = GetClassColored(player) or "Unknown Class"
    local faction = ColorFaction(player)
    local area = GetPlayerArea(player)
    SendWorldMessage(string.format(
        "Local spies report that a %s %s named %s has logged in at %s! Intelligence indicates they are loyal to the %s.",
        race, class, coloredName, area, faction
    ))
end

local function OnLogout(event, player)
    local race = raceNames[player:GetRace()] or "Unknown Race"
    local coloredName = ColorName(player)
    local class = GetClassColored(player) or "Unknown Class"
    local faction = ColorFaction(player)
    local area = GetPlayerArea(player)
    SendWorldMessage(string.format(
        "Local spies report that a %s %s named %s has logged out from %s! Agents confirm their allegiance to the %s.",
        race, class, coloredName, area, faction
    ))
end

RegisterPlayerEvent(3, OnLogin)
RegisterPlayerEvent(4, OnLogout)
