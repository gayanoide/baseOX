local lib = exports.ox_lib

local isDead, isBusy = false, false

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

local disablecontrol = false
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
	    if disablecontrol then
	    	FreezeEntityPosition(PlayerPedId(), true)
		else
			FreezeEntityPosition(PlayerPedId(), false)
		end
	end
end)


RegisterKeyMapping('Emysams', 'Ouvrir le menu sams', 'keyboard', 'F6')












RegisterCommand('Emysams', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sams' then
        lib:showContext('samsmenu')    
	end
end)

lib:registerContext({
    id = 'samsmenu',
    title = 'San Andreas Medical Services',
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

              ESX.TriggerServerCallback("Emysams:checkitem", function(haveitem)
                if haveitem then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Aucune Personne à Proximité')
                    else

                        local closestPlayerPed = GetPlayerPed(closestPlayer)
                        local health = GetEntityHealth(closestPlayerPed)
                        if health > 0 then
                            local playerPed = PlayerPedId()
                            TriggerServerEvent("Emysams:delitem", "bandage")

                            ESX.ShowNotification('vous soignez...')
                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                            Citizen.Wait(10000)
                            ClearPedTasks(playerPed)

                            TriggerServerEvent('Emysams:heal', GetPlayerServerId(closestPlayer), 'big')
                            ESX.ShowNotification("Vous avez soigné ~y~"..GetPlayerName(closestPlayer))
                        else
                            ESX.ShowNotification('Cette personne est inconsciente!')
                        end
                    end
                    --TriggerServerEvent("okokBilling:CreateCustomInvoice", GetPlayerServerId(player), 300, 'Facture', 'S.A.M.S', 'society_sams', ('sams'))
                                    
                else
                    ESX.ShowNotification('Vous n\'avez pas de bandage')
                end
            end, "bandage")
          end,
        },
        {
          title = 'Faire une réanimation', 
          description = 'La facture sera envoyer automatiquement',
          onSelect = function()
              print("Pressed the button!")

                ESX.TriggerServerCallback("Emysams:checkitem", function(haveitem)
                    if haveitem then
                        Canrevive = true
                    end
                end, "medikit")
    
                if Canrevive then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('Aucune Personne à Proximité')
                    else
                        TriggerServerEvent("Emysams:delitem", "medikit")
                        revivePlayer(closestPlayer)
                        TriggerServerEvent('Emysams:heal', GetPlayerServerId(closestPlayer), 'big')
                    end
                    --TriggerServerEvent("okokBilling:CreateCustomInvoice", GetPlayerServerId(player), 500, 'Facture', 'S.A.M.S', 'society_sams', ('sams'))
                else
                    ESX.ShowNotification('Vous n\'avez pas de kit médical')
                end
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
              --print("Pressed the button!")
              ExecuteCommand('e notepad')
          end,
        },
    }
})

RegisterNetEvent('ambulance:soin')
AddEventHandler('ambulance:soin', function(type, data)
    ExecuteCommand('e uncuff')
    disablecontrol = true
    ESX.ShowNotification("Le medecin vous soigne . . .")	
    Wait(10000)
    ESX.ShowNotification("ah l'enculé il m'a pris 1000 balles")
    --exports["WaveShield"]:TriggerServerEvent('emy:pay', GetPlayerServerId(PlayerId()))
    TriggerServerEvent('Emysams:pay', GetPlayerServerId(PlayerId()))
    SetEntityHealth(GetPlayerPed(-1), 200) 
    --print("Pressed the button!")
    disablecontrol = false
    ExecuteCommand("emotecancel")
    ClearPedTasks(GetPlayerPed(-1))
end)

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.soin.position.x, Config.pos.soin.position.y, Config.pos.soin.position.z),
        size = vec3(1, 1, 1),
        rotation = 0,
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




























RegisterNetEvent('Emysams:heal')
AddEventHandler('Emysams:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	elseif healType == 'pharmacy' then
		SetEntityHealth(GetPlayerPed(-1), math.floor(maxHealth / 2))
	end

	if not quiet then
		ESX.ShowNotification('Vous avez été soigné.')
	end
end)

function revivePlayer(closestPlayer)
    local closestPlayerPed = GetPlayerPed(closestPlayer)
    if IsPedDeadOrDying(closestPlayerPed, 1) then
        local playerPed = PlayerPedId()
        local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
        ESX.ShowNotification('Réanimation en cours')

        for i=1, 15 do
            Citizen.Wait(900)
            ESX.Streaming.RequestAnimDict(lib, function()
                TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
            end)
        end

        TriggerServerEvent('Emysams:revive', GetPlayerServerId(closestPlayer))
    else
        ESX.ShowNotification('N\'est pas inconscient')
    end
end

RegisterNetEvent('Emysams:revive')
AddEventHandler('Emysams:revive', function(isAdmin)
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerServerEvent('Emysams:setDeathStatus', false)
    isDead = false

    if not isAdmin then
        TriggerServerEvent('Emysams:heal', GetPlayerServerId(closestPlayer), 'big')
    end

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = ESX.Math.Round(coords.x, 1),
		y = ESX.Math.Round(coords.y, 1),
		z = ESX.Math.Round(coords.z, 1)
	}

	RespawnPed(playerPed, formattedCoords, 0.0)

	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

AddEventHandler('esx:onPlayerSpawn', function()
    if firstSpawn then
        firstSpawn = false
        if Sams.SaveDeathStatus then
            while not ESX.IsPlayerLoaded() do
                Wait(1000)
            end

            ESX.TriggerServerCallback('Emysams:getDeathStatus', function(shouldDie)
                if shouldDie then
                    Wait(1000)
                    SetEntityHealth(PlayerPedId(), 0)
                else 
                    ESX.TriggerServerCallback('Emysams:getCurrentHealth', function(currentHealth)
                        Wait(1000)
                        SetEntityHealth(PlayerPedId(), currentHealth)
                    end)
                end
            end)
        end
    end
end)

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
end

AddEventHandler('esx:onPlayerDeath', function(data)
	OnPlayerDeath()
end)

function OnPlayerDeath()
	isDead = true
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('Emysams:setDeathStatus', true)

	StartDeathTimer()
	StartDistressSignal()

	StartScreenEffect('DeathFailOut', 0, false)
end

function StartDistressSignal()
	Citizen.CreateThread(function()
		local timer = 240000

		while timer > 0 and isDead do
			Citizen.Wait(0)
			timer = timer - 30

			SetTextFont(4)
			SetTextScale(0.45, 0.45)
			SetTextColour(185, 185, 185, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			BeginTextCommandDisplayText('STRING')
			--AddTextComponentSubstringPlayerName('[~y~G~s~] pour envoyer un signal de détresse')
			EndTextCommandDisplayText(0.405, 0.855)

			if IsControlJustReleased(0, 47) then
                ExecuteCommand('dead Un citoyen a besoin d\'aide')
				break
			end
		end
	end)
end





function StartDeathTimer()
	local canPayFine = false

		ESX.TriggerServerCallback('Emysams:checkBalance', function(canPay)
			canPayFine = canPay
		end)

	local earlySpawnTimer = ESX.Math.Round(Config.pos.time * 60)
	local bleedoutTimer = ESX.Math.Round(Config.pos.unitX * 60)

	Citizen.CreateThread(function()
		-- early respawn timer
		while earlySpawnTimer > 0 and isDead do
			Citizen.Wait(1000)

			if earlySpawnTimer > 0 then
				earlySpawnTimer = earlySpawnTimer - 1
			end
		end

		-- bleedout timer
		while bleedoutTimer > 0 and isDead do
			Citizen.Wait(1000)

			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		local text, timeHeld

		-- early respawn timer
		while earlySpawnTimer > 0 and isDead do
			Citizen.Wait(0)
			text = ('Réanimation possible dans %s minutes %s secondes \n\n [~y~G~s~] pour envoyer un signal de détresse'):format(secondsToClock(earlySpawnTimer))
			DrawGenericTextThisFrame()
			BeginTextCommandDisplayText('STRING')
			AddTextComponentSubstringPlayerName(text)
			DrawText(0.5, 0.8)      

			if IsControlJustReleased(0, 47) then
				--SendDistressSignal()
                text = ('Réanimation possible dans %s minutes %s secondes'):format(secondsToClock(earlySpawnTimer))
			    DrawGenericTextThisFrame()
			    BeginTextCommandDisplayText('STRING')
			    AddTextComponentSubstringPlayerName(text)
			    DrawText(0.5, 0.8)
                ExecuteCommand('dead Un citoyen a besoin d\'aide')
                ESX.ShowNotification('Votre balise a été activé')
				break
			end
		end

		-- bleedout timer
		while bleedoutTimer > 0 and isDead do
			Citizen.Wait(0)
			text = ('Vous allez souffrir d\'une hémorragie dans %s minutes %s secondes\n'):format(secondsToClock(bleedoutTimer))

			if canPayFine then
				text = text .. ('Maintenez [~y~E~s~] pour réapparaitre ($ 1000)')

				if IsControlPressed(0, 38) and timeHeld > 60 then
					TriggerServerEvent('Emysams:payFine')
                    disablecontrol = true
					RemoveItemsAfterRPDeath()
					break
                    ExecuteCommand('e sleep')
                    ExecuteCommand('walk injured')
                    Wait(60000)
                    ExecuteCommand('emotecancel')
                    disablecontrol = false
				end
			end

			if IsControlPressed(0, 38) then
				timeHeld = timeHeld + 1
			else
				timeHeld = 0
			end

			DrawGenericTextThisFrame()

			BeginTextCommandDisplayText('STRING')
			AddTextComponentSubstringPlayerName(text)
			DrawText(0.5, 0.8)
		end
        if bleedoutTimer < 1 and isDead then
			RemoveItemsAfterRPDeath()
            ExecuteCommand('e sleep')
            ExecuteCommand('walk injured')
            Wait(60000)
            ExecuteCommand('emotecancel')
            disablecontrol = false
		end
	end)
end

function RemoveItemsAfterRPDeath()
	TriggerServerEvent('Emysams:setDeathStatus', false)
	Citizen.CreateThread(function()
		DoScreenFadeOut(1000)
		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end
		local formattedCoords = {
            x = Config.pos.RespawnPoint.x,
            y = Config.pos.RespawnPoint.y,
            z = Config.pos.RespawnPoint.z
        }
		ESX.SetPlayerData('loadout', {})
		RespawnPed(PlayerPedId(), formattedCoords, 81.5)
        
        TriggerServerEvent('Emysams:revive')

		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(60000)
        ExecuteCommand('e sleep')
        ExecuteCommand('walk injured')
        Wait(60000)
        ExecuteCommand('emotecancel')
        disablecontrol = false
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)

		if isDead then
			DisableAllControlActions(0)
			EnableControlAction(0, 47, true)
			EnableControlAction(0, 245, true)
			EnableControlAction(0, 38, true)
			DisableControlAction(0, 288, true)
		end
	end
end)

function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format('%02.f', math.floor(seconds / 3600))
		local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end















-- Assenceur

exports.ox_lib:registerContext({
    id = 'tpsams',
    title = 'Assenceur',
    options = {
        {
            title = Config.pos.tp01.label,
            progress = '100',
            onSelect = function()
                --print("Pressed the button!")                
                DoScreenFadeOut(1000)
                Wait(1000)
                FreezeEntityPosition(PlayerPedId(), true)
                tp(Config.pos.tp1.position.x, Config.pos.tp1.position.y, Config.pos.tp1.position.z)
                SetEntityHeading(PlayerPedId(), Config.pos.tp1.heading)
                FreezeEntityPosition(PlayerPedId(), false)
                Wait(900)
                DoScreenFadeIn(1000)                           
            end,
        },
        {
            title = Config.pos.tp02.label,
            progress = '100',
            onSelect = function()                
                --print("Pressed the button!")                
                DoScreenFadeOut(1000)
                Wait(1000)
                FreezeEntityPosition(PlayerPedId(), true)
                tp(Config.pos.tp2.position.x, Config.pos.tp2.position.y, Config.pos.tp2.position.z)
                SetEntityHeading(PlayerPedId(), Config.pos.tp2.heading)
                FreezeEntityPosition(PlayerPedId(), false)
                Wait(900)
                DoScreenFadeIn(1000)
            end,
        },
        {
            title = Config.pos.tp03.label,
            progress = '100',
            onSelect = function()
                --print("Pressed the button!")                
                DoScreenFadeOut(1000)
                Wait(1000)
                FreezeEntityPosition(PlayerPedId(), true)
                tp(Config.pos.tp3.position.x, Config.pos.tp3.position.y, Config.pos.tp3.position.z)
                SetEntityHeading(PlayerPedId(), Config.pos.tp3.heading)
                FreezeEntityPosition(PlayerPedId(), false)
                Wait(900)
                DoScreenFadeIn(1000)
            end,
        },
    },
})

function tp(x,y,z)
	SetEntityCoords(PlayerPedId(), x, y, z - 0.9)
end

RegisterNetEvent('tp:openmenu')
AddEventHandler('tp:openmenu', function()
    exports.ox_lib:showContext('tpsams')
end)

-- Niveau 0

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.tp01.position.x, Config.pos.tp01.position.y, Config.pos.tp01.position.z),
        size = vec3(1, 1, 1),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'poly',
                event = 'tp:openmenu',
                icon = 'fa-solid fa-cube',
                label = 'Appeler un assenceur',
            },
        },
        minZ = Config.pos.tp01.position.z - 0.3,
        maxZ = Config.pos.tp01.position.z + 0.3,
    }
)

-- Niveau 1

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.tp02.position.x, Config.pos.tp02.position.y, Config.pos.tp02.position.z),
        size = vec3(1, 1, 1),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'poly',
                event = 'tp:openmenu',
                icon = 'fa-solid fa-cube',
                label = 'Appeler un assenceur',
            },
        },
        minZ = Config.pos.tp02.position.z - 0.3,
        maxZ = Config.pos.tp02.position.z + 0.3,
    }
)

-- Niveau 2

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.tp03.position.x, Config.pos.tp03.position.y, Config.pos.tp03.position.z),
        size = vec3(1, 1, 1),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'poly',
                event = 'tp:openmenu',
                icon = 'fa-solid fa-cube',
                label = 'Appeler un assenceur',
            },
        },
        minZ = Config.pos.tp03.position.z - 0.3,
        maxZ = Config.pos.tp03.position.z + 0.3,
    }
)














-------  Menu Annonces

exports.ox_lib:registerContext({
    id = 'annoncemenu',
    title = 'Faire une annonce',
    options = {
        {
            title = 'Ouvert',
            progress = '100',
            onSelect = function()
                --print("Pressed the button!")  				
				--exports["WaveShield"]:TriggerServerEvent('htaxi:Ouvert')
				TriggerServerEvent('hsams:Ouvert')
                ESX.ShowNotification("~y~open")    
            end,
        },
        {
            title = 'Fermer',
            progress = '100',
            onSelect = function()
                --print("Pressed the button!") 
                --exports["WaveShield"]:TriggerServerEvent('htaxi:Fermer') 
                TriggerServerEvent('hsams:Fermer') 
                ESX.ShowNotification("~y~close") 
            end,
        },
    },
})

RegisterNetEvent('sams:annonce')
AddEventHandler('sams:annonce', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sams' then
       	exports.ox_lib:showContext('annoncemenu')
	else
		ESX.ShowNotification("~y~ta pas acces miskin")
	end
end)

exports.ox_target:addBoxZone(
	{
        coords = vec3(Config.pos.annonce.position.x, Config.pos.annonce.position.y, Config.pos.annonce.position.z),
        size = vec3(1, 1, 1),
        rotation = 45,
        debug = drawZones,
        options = {
            {
                name = 'poly',
                event = 'sams:annonce',
                icon = 'fa-solid fa-cube',
                label = 'Acceder a l\'ordinateur',
            },
        },
        minZ = Config.pos.annonce.position.z - 0.3,
        maxZ = Config.pos.annonce.position.z + 0.3,
    }
)