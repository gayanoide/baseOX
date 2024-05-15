ESX = exports['es_extended']:getSharedObject() 

RegisterNetEvent('safd:garagemenu')
AddEventHandler('safd:garagemenu', function(type, data)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'safd' then        
        exports.ox_lib:showContext('spawnsafd')
    else
        ESX.ShowNotification("~y~ta pas acces miskin")
    end
end)

exports.ox_lib:registerContext({
    id = 'spawnsafd',
    title = 'Garage',
    options = {
        {
            title = 'Engine 1',
            icon = 'fa-solid fa-truck',
            image = 'https://i.goopics.net/u182aj.png',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne") 

                if ESX.Game.IsSpawnPointClear(vector3(Config.pos.garage.spawn.x, Config.pos.garage.spawn.y, Config.pos.garage.spawn.z), 3.0) then
                  
                ESX.Game.SpawnVehicle('firetruk', { 
                    x = Config.pos.garage.spawn.x, 
                    y = Config.pos.garage.spawn.y,
                    z = Config.pos.garage.spawn.z},
                    Config.pos.garage.angle,

                    function(vehicle)
                        SetVehicleEngineOn(vehicle, true, true, true)                     
                        --SetVehicleColours(vehicle, 39, 39) -- rouge mat 

                        local plaque = "E1 "..math.random(1,9)
                        SetVehicleNumberPlateText(vehicle, plaque) 
                    end
                )
                end
            end,
        },
        {
            title = 'Medic 1',
            icon = 'fa-solid fa-truck',
            image = 'https://www.imagevisit.com/images/2021/02/07/2080bda95cdcbe516ec4aa60156d152c218ad7c6_2_517x303.jpg',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne") 

                if ESX.Game.IsSpawnPointClear(vector3(Config.pos.garage.spawn.x, Config.pos.garage.spawn.y, Config.pos.garage.spawn.z), 3.0) then
                  
                ESX.Game.SpawnVehicle('emsnspeedo', { 
                    x = Config.pos.garage.spawn.x, 
                    y = Config.pos.garage.spawn.y,
                    z = Config.pos.garage.spawn.z},
                    Config.pos.garage.angle,

                    function(vehicle)
                        SetVehicleEngineOn(vehicle, true, true, true)                   
                        SetVehicleColours(vehicle, 39, 39) -- rouge mat 

                        local plaque = "M1 "..math.random(1,9)
                        SetVehicleNumberPlateText(vehicle, plaque) 
                    end
                )
                end
            end,
        },
        {
            title = 'Life Guard 1',
            icon = 'fa-solid fa-truck',
            image = 'https://i.goopics.net/16w9jd.png',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne") 

                if ESX.Game.IsSpawnPointClear(vector3(Config.pos.garage.spawn.x, Config.pos.garage.spawn.y, Config.pos.garage.spawn.z), 3.0) then
                  
                ESX.Game.SpawnVehicle('lguard', { 
                    x = Config.pos.garage.spawn.x, 
                    y = Config.pos.garage.spawn.y,
                    z = Config.pos.garage.spawn.z},
                    Config.pos.garage.angle,

                    function(vehicle)
                        SetVehicleEngineOn(vehicle, true, true, true)                   
                        SetVehicleColours(vehicle, 39, 39) -- rouge mat 

                        local plaque = "LG1 "..math.random(1,9)
                        SetVehicleNumberPlateText(vehicle, plaque) 
                    end
                )
                end
            end,
        },
    },
})
















exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.garage.position.x, Config.pos.garage.position.y, Config.pos.garage.position.z),
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = drawZones,
        options = {
            {
                name = 'box',
                event = 'safd:garagemenu',
                icon = 'fa-solid fa-cube',
                label = 'Acceder au Garage',
            },
        },
        minZ = Config.pos.garage.position.z - 0.3,
        maxZ = Config.pos.garage.position.z + 0.3,
    }
)

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_f_execpa_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
	end
	ped = CreatePed("PED_TYPE_CIVMALE", "mp_f_execpa_01", Config.pos.garage.position.x, Config.pos.garage.position.y, Config.pos.garage.position.z-0.99, Config.pos.garage.heading, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    --TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
end)