ESX = exports['es_extended']:getSharedObject() 
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


RegisterCommand('Emyhelmetsafd', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'safd' then
        exports.ox_lib:showContext('helmetmenu')    
	end
end)





RegisterNetEvent('safd:vestmenu')
AddEventHandler('safd:vestmenu', function(type, data)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'safd' then        
        exports.ox_lib:showContext('vestsafd')
    else
        ESX.ShowNotification("~y~ta pas acces miskin")
    end
end)

exports.ox_lib:registerContext({
    id = 'vestsafd',
    title = 'Vestiaire',
    options = {
        --{
        --    title = 'Tenue de Feu',

        --    onSelect = function()
        --        --ESX.ShowNotification("~y~ca fonctionne")
        --        TriggerEvent('Emyvestiaire')
        --    end,
        --},
        {
            title = 'Remettre sa tenue CIVIL',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)

            end,
        }, 
        {
            title = 'Tenue de service',

            onSelect = function()
                ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['bags_1'] = 0, ['bags_2'] = 0,
                            ['tshirt_1'] = 15,['tshirt_2'] = 0,
                            ['torso_1'] = 316, ['torso_2'] = 8,
                            ['decals_1'] = 64, ['decals_2'] = 0,
                            ['arms'] = 17, ['arms_2'] = 0,
                            ['pants_1'] = 25, ['pants_2'] = 0,
                            ['shoes_1'] = 25, ['shoes_2'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                            ['chain_1'] = 0, ['chain_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 2,
                        }
                    else
                        clothesSkin = {
                            ['bags_1'] = 0, ['bags_2'] = 0,
                            ['tshirt_1'] = 14,['tshirt_2'] = 0,
                            ['torso_1'] = 327, ['torso_2'] = 8,
                            ['decals_1'] = 73, ['decals_2'] = 0,
                            ['arms'] = 16, ['arms_2'] = 1,
                            ['pants_1'] = 34, ['pants_2'] = 0,
                            ['shoes_1'] = 25, ['shoes_2'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                            ['chain_1'] = 0, ['chain_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

            end,
        },   
        {
          title = 'Mettre son casque',
          description = 'Mettre le casque de pompier en fonction de vos grades',
          menu = 'helmetmenu',
        }, 
        {
            title = 'Tenue Feu',

            onSelect = function()
                ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['bags_1'] = 0, ['bags_2'] = 0,
                            ['tshirt_1'] = 151, ['tshirt_2'] = 1,
                            ['torso_1'] = 314, ['torso_2'] = 1,
                            ['decals_1'] = 64, ['decals_2'] = 0,
                            ['arms'] = 36,
                            ['pants_1'] = 120, ['pants_2'] = 1,
                            ['shoes_1'] = 25, ['shoes_2'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                            ['chain_1'] = 0, ['chain_2'] = 0,
                            ['mask_1'] = 52, ['mask_2'] = 2,
                        }
                    else
                        clothesSkin = {
                            ['bags_1'] = 0, ['bags_2'] = 0,
                            ['tshirt_1'] = 187,['tshirt_2'] = 1,
                            ['torso_1'] = 325, ['torso_2'] = 1,
                            ['decals_1'] = 73, ['decals_2'] = 0,
                            ['arms'] = 36, ['arms_2'] = 0,
                            ['pants_1'] = 126, ['pants_2'] = 1,
                            ['shoes_1'] = 25, ['shoes_2'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                            ['chain_1'] = 0, ['chain_2'] = 0,
                            ['mask_1'] = 52, ['mask_2'] = 2,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

                ExecuteCommand("Emyhelmetsafd")
                

            end,                
        },



        
    },
})

exports.ox_lib:registerContext({
    id = 'helmetmenu',
    title = 'Vestiaire',
    options = {
        {
            title = 'Casque Homme du Rang',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['helmet_1'] = 45, ['helmet_2'] = 0,
                        }
                    else
                        clothesSkin = {
                            ['helmet_1'] = 213, ['helmet_2'] = 0,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

            end,
        },
        {
            title = 'Casque Sous Officier',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['helmet_1'] = 45, ['helmet_2'] = 1,
                        }
                    else
                        clothesSkin = {
                            ['helmet_1'] = 213, ['helmet_2'] = 1,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

            end,
        },
        {
            title = 'Casque Officier',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['helmet_1'] = 45, ['helmet_2'] = 5,
                        }
                    else
                        clothesSkin = {
                            ['helmet_1'] = 213, ['helmet_2'] = 5,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

            end,
        },
        {
            title = 'Casque Etat Major',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['helmet_1'] = 45, ['helmet_2'] = 2,
                        }
                    else
                        clothesSkin = {
                            ['helmet_1'] = 213, ['helmet_2'] = 2,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

            end,
        },
        {
            title = 'Retier son casque',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                
                local model = GetEntityModel(GetPlayerPed(-1))
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if model == GetHashKey("mp_m_freemode_01") then
                        clothesSkin = {
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                        }
                    else
                        clothesSkin = {
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                        }
                    end
                    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                end)

            end,
        },



        
    },
})









exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.vest.position.x, Config.pos.vest.position.y, Config.pos.vest.position.z),
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = drawZones,
        options = {
            {
                name = 'box',
                event = 'safd:vestmenu',
                icon = 'fa-solid fa-cube',
                label = 'Acceder au Vestiaire',
            },
        },
        minZ = Config.pos.vest.position.z - 0.3,
        maxZ = Config.pos.vest.position.z + 0.3,
    }
)
