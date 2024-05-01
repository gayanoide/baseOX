local lib = exports.ox_lib

ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
        PlayerData.job = job
        Citizen.Wait(5000)
end)
RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
        PlayerData.job2 = job2
        Citizen.Wait(5000)
end)
Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
        end)
        Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job2 == nil do
            Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then
            ESX.PlayerData = ESX.GetPlayerData()
    end
end)
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
end)
    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
end)
    RegisterNetEvent('esx:setJob2')
    AddEventHandler('esx:setJob2', function(job2)
        ESX.PlayerData.job2 = job2
end)





if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sams' then
    RegisterKeyMapping('Emysams', 'Ouvrir le menu sams', 'keyboard', 'F6')
end












RegisterCommand('Emysams', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sams' then
        lib:showContext('samsmenu')    
	else
		ESX.ShowNotification("~y~Tu n'es pas S.A.M.S miskin")
	end
end)

lib:registerContext({
    id = 'samsmenu',
    title = 'Votre metier : \n\n '..ESX.PlayerData.job.label..' - '..ESX.PlayerData.job.grade_label..'',
    options = {
      {
        title = 'GPS rapide vers le S.A.M.S',
        description = 'un endroit ou aller ?',
        image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235042853823058041/3nK6rWF.png?ex=6632eeca&is=66319d4a&hm=af689333b1e855603a9ac583e9de2d4c5b299cf2e740dd1cf45d6cf252615016&",
        progress = '50',      
        onSelect = function()
            --print("Pressed the button!")
            SetNewWaypoint(vector3(297.8938, -583.9264, 43.2608))
        end,
      },      
      {
        title = 'Menu Interaction',
        description = ' ',
        menu = 'intermenu',
      },   
      {
        title = 'Emotes rapide',
        description = ' ',
        menu = 'emotesamsmenu',
      },
    }
})

lib:registerContext({
    id = 'intermenu',
    title = 'Interaction',
    menu = 'some_menu',
    onBack = function()
      --print('Went back!')
    end,
    options = {
        {
          title = 'Faire un soin', 
          description = 'La facture sera envoyer automatiquement',
          onSelect = function()
              print("Pressed the button!")
          end,
        },
        {
          title = 'Faire une réanimation', 
          description = 'La facture sera envoyer automatiquement',
          onSelect = function()
              print("Pressed the button!")
          end,
        },
        {
          title = 'Faire une facture', 
          description = 'Faire une facture custom',
          onSelect = function()
              print("Pressed the button!")

              TriggerServerEvent("okokBilling:CreateCustomInvoice", GetPlayerServerId(player), montant, 'Facture', 'L.S.E.S', 'society_ambulance', ('ambulance'))
            
          end,
        },
    }
})


lib:registerContext({
    id = 'emotesamsmenu',
    title = 'Emotes rapide',
    menu = 'some_menu',
    onBack = function()
      --print('Went back!')
    end,
    options = {
        {
          title = 'prendre des notes', 
          description = ' ',
          onSelect = function()
              print("Pressed the button!")
              ExecuteCommand('e notepad')
          end,
        },
    }
})

RegisterNetEvent('ambulance:soin')
AddEventHandler('ambulance:soin', function(type, data)	
    --exports["rtx_notify"]:Notify(" ", "Le medecin vous soigne . . .", 10000, "info")
    --Wait(10000)
    --exports["rtx_notify"]:Notify(" ", "ah l'enculé il m'a pris 1000 balles", 7000, "success")
    --exports["WaveShield"]:TriggerServerEvent('emy:pay', GetPlayerServerId(PlayerId()))
    SetEntityHealth(GetPlayerPed(-1), 200) 
    --print("Pressed the button!")
end)

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.soin.position.x, Config.pos.soin.position.y, Config.pos.soin.position.z),
        size = vec3(1, 1, 1),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'box',
                event = 'ambulance:soin',
                icon = 'fa-solid fa-cube',
                label = 'Demander un soin',
            },
        },
        minZ = Config.pos.soin.position.z - 0.3,
        maxZ = Config.pos.soin.position.z + 0.3,
    }
)

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_f_execpa_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
	end
	ped = CreatePed("PED_TYPE_CIVMALE", "mp_f_execpa_01", Config.pos.soin.position.x, Config.pos.soin.position.y, Config.pos.soin.position.z-0.99, Config.pos.soin.heading, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    --TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
end)










































