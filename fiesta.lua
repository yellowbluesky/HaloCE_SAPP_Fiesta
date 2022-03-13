api_version = "1.11.0.0"

weapons = {
    "weapons\\assault rifle\\assault rifle",
    "weapons\\flamethrower\\flamethrower",
    "weapons\\plasma_cannon\\plasma_cannon",
    "weapons\\needler\\mp_needler",
    "weapons\\pistol\\pistol",
    "weapons\\plasma pistol\\plasma pistol",
    "weapons\\plasma rifle\\plasma rifle",
    "weapons\\rocket launcher\\rocket launcher",
    "weapons\\shotgun\\shotgun",
    "weapons\\sniper rifle\\sniper rifle",
}

local disabledObjects = {
    'weapons\\assault rifle\\assault rifle',
    'weapons\\flamethrower\\flamethrower',
    'weapons\\needler\\mp_needler',
    'weapons\\pistol\\pistol',
    'weapons\\plasma pistol\\plasma pistol',
    'weapons\\plasma rifle\\plasma rifle',
    'weapons\\plasma_cannon\\plasma_cannon',
    'weapons\\rocket launcher\\rocket launcher',
    'weapons\\shotgun\\shotgun',
    'weapons\\sniper rifle\\sniper rifle',

    'weapons\\frag grenade\\frag grenade',
    'weapons\\plasma grenade\\plasma grenade',

    'vehicles\\ghost\\ghost_mp',
    'vehicles\\rwarthog\\rwarthog',
    'vehicles\\banshee\\banshee_mp',
    'vehicles\\warthog\\mp_warthog',
    'vehicles\\scorpion\\scorpion_mp',
    'vehicles\\c gun turret\\c gun turret_mp',

    --
    -- repeat the structure to add more entries
    --
}



function OnScriptLoad()
    register_callback(cb['EVENT_SPAWN'], 'OnSpawn')
    OnStart()
end

function OnScriptUnload()

end

function OnStart()
    -- Disables interaction with vehicles and ground weapons
    for i, object in ipairs(disabledObjects) do
        execute_command("disable_object " .. object)
    end
end

function OnSpawn(Ply)
    say(Ply, "henlo")
    -- Removes all held weapons and nades from the player
    execute_command("wdel " .. Ply)
    execute_command("nades " .. Ply .. " 0")

    -- Picks two unique random numbers
    local rand1 = rand(1, 11)
    local rand2 = 1
    repeat
        rand2 = rand(1, 11)
    until (rand2 ~= rand1)
    
    -- Gives the player those two random weapons
    local weapon1 = spawn_object("weap", weapons[rand1], 0, 0, 0)
    assign_weapon(weapon1, Ply)
    local weapon2 = spawn_object("weap", weapons[rand2], 0, 0, 0)
    assign_weapon(weapon2, Ply)

end