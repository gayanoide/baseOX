ESX = exports["es_extended"]:getSharedObject()

	local PlayerData = {}
	
	RegisterNetEvent('esx:playerLoaded')
	AddEventHandler('esx:playerLoaded', function(xPlayer)
		 PlayerData = xPlayer
	end)
	RegisterNetEvent('esx:setJob2')
	AddEventHandler('esx:setJob2', function(job2)  
		PlayerData.job2 = job2  
		Citizen.Wait(5000) 
	end)
	RegisterNetEvent('esx:setJob')
	AddEventHandler('esx:setJob', function(job)  
		PlayerData.job = job  
		Citizen.Wait(5000) 
	end)
	
	Citizen.CreateThread(function()
		
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
Citizen.CreateThread(function()
        for k,v in pairs(Config.Clothe.legal) do
			TriggerServerEvent('esx_service:activateService', v.job, 200)
		end
end)

RegisterNetEvent('Emyvestiaire')
AddEventHandler('Emyvestiaire', function()
	for k,v in pairs(Config.Clothe.legal) do
		ListClothe(v.job)
	end
end)

Citizen.CreateThread(function()
        while true do
            local Timer = 500
			for k,v in pairs(Config.Clothe.legal) do
			if ESX.PlayerData.job and ESX.PlayerData.job.name == v.job then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, v.position.x, v.position.y, v.position.z)
            --if dist3 <= 6.0 then
            --    Timer = 0
                --DrawMarker(v.Marker.Type, v.position.x, v.position.y, v.position.z-0.99, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, v.Marker.Taille, v.Marker.Taille, v.Marker.Taille, v.Marker.r, v.Marker.g, v.Marker.b, 170, 0, 1, 2, 0, nil, nil, 0)
            --    end
                --if dist3 <= 1.5 then
                --Timer = 0
				--RageUI.Text({ message = "~y~[E]~s~ pour ouvrir le ~o~Vestiaire", time_display = 1 })
                --if IsControlJustPressed(1,51) then           
                --        ListClothe(v.job)
                --    end   
                --end
            end 
			end
            for k,v in pairs(Config.Clothe.legal) do
            if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.job then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, v.position.x, v.position.y, v.position.z)
            if dist3 <= 6.0 then
                Timer = 0
                DrawMarker(v.Marker.Type, v.position.x, v.position.y, v.position.z-0.99, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, v.Marker.Taille, v.Marker.Taille, v.Marker.Taille, v.Marker.r, v.Marker.g, v.Marker.b, 170, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist3 <= 1.5 then
					--ESX.Game.Utils.DrawText3D(position.x, "Appuyez sur ~b~E~w~ pour ~b~regarder votre casier", 0.4)
                Timer = 0   
				SetTextComponentFormat('STRING')
				--AddTextComponentString("Appuyez sur ~INPUT_PICKUP~ pour ouvrir le vestiaire")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                if IsControlJustPressed(1,51) then           
                        ListClothe(v.job)
                    end   
                end
            end 
            end
	 Citizen.Wait(Timer)
	 end
end)





function ListClothe(job)
local JobInfo = {}


json.encode(ESX.TriggerServerCallback('HuidJobClothe:GetJob', function(cb)
     JobInfo = cb
	 
end, job))
					
	local CClothe = RageUI.CreateMenu("Vestiaire", "Choisir sa tenue")
        RageUI.Visible(CClothe, not RageUI.Visible(CClothe))
            while CClothe do
            Citizen.Wait(0)
            RageUI.IsVisible(CClothe, true, true, true, function()
			
			        RageUI.ButtonWithStyle("Remettre sa tenue civil", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
								ExecuteCommand("e tryclothes")
								RageUI.CloseAll()
							    TriggerEvent('skinchanger:loadSkin', skin)
								Wait(5000)
								ExecuteCommand("emotecancel")
							end)
							TriggerServerEvent('esx_service:disableService', job, ESX.PlayerData.identifier)
							ESX.ShowNotification('Tu as quitté ton service')
                        end
                    end)
					
				
					--RageUI.line()
							
					for i=1, #JobInfo, 1 do
					RageUI.ButtonWithStyle(JobInfo[i].label, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
						if ESX.PlayerData.job.name == job then
						if (job == "ballas") or (job == "cartel") or (job == "brokers") or (job == "families") or (job == "lostmc") or (job == "altruiste") or (job == "oneils") or (job == "bratva") or (job == "cosanostra") then 
						else    ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

                            if canTakeService then
                                ESX.ShowNotification('Tu as pris ton service: '..ESX.PlayerData.job.label)
                            else
                                ESX.ShowNotification('Service is full: ' .. inServiceCount .. '/' .. maxInService)
                            end
							end, ESX.PlayerData.job.name, ESX.PlayerData.identifier)
						end
						    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
							local playerPed = PlayerPedId()
					        if skin.sex == 0 then
								FreezeEntityPosition(playerPed, true)
								ExecuteCommand("e tryclothes")
								RageUI.CloseAll()
							    TriggerEvent('skinchanger:loadClothes', skin, json.decode(JobInfo[i].skin_male))
								Wait(5000)
								ExecuteCommand("emotecancel")
								FreezeEntityPosition(playerPed, false)
				            else
								FreezeEntityPosition(playerPed, true)
								ExecuteCommand("e tryclothes")
								RageUI.CloseAll()
					            TriggerEvent('skinchanger:loadClothes', skin, json.decode(JobInfo[i].skin_female))
								Wait(5000)
								ExecuteCommand("emotecancel")
								FreezeEntityPosition(playerPed, false)
				            end
							end)
							
						elseif ESX.PlayerData.job2.name == job then
						if (job == "ballas") or (job == "cartel") or (job == "brokers") or (job == "families") or (job == "lostmc") or (job == "altruiste") or (job == "oneils") or (job == "bratva") or (job == "cosanostra") then 
						else    ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

                            if canTakeService then
                                ESX.ShowNotification('Tu as pris ton service: '..ESX.PlayerData.job2.label)
                            else
                                ESX.ShowNotification('Service is full: ' .. inServiceCount .. '/' .. maxInService)
                            end
							end, ESX.PlayerData.job2.name, ESX.PlayerData.identifier)
							end
						    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					        if skin.sex == 0 then
								ExecuteCommand("e tryclothes")
								RageUI.CloseAll()
							    TriggerEvent('skinchanger:loadClothes', skin, json.decode(JobInfo[i].skin_male))
								Wait(5000)
								ExecuteCommand("emotecancel")
				            else
								ExecuteCommand("e tryclothes")
								RageUI.CloseAll()
					            TriggerEvent('skinchanger:loadClothes', skin, json.decode(JobInfo[i].skin_female))
								Wait(5000)
								ExecuteCommand("emotecancel")
				            end
							end)
							
						end
                        end
                        end)
                    end
                    
                end, function()
                end)
            if not RageUI.Visible(CClothe) then
            CClothe = RMenu:DeleteType("CClothe", true)
        end
    end
end

function vcivil()
ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if model == GetHashKey("mp_m_freemode_01") then
			clothesSkin = {
				['bproof_1'] = 0,['bproof_2'] = 0,
				['decals_1'] = 0,     ['decals_2']= 0,
				['glasses_1'] = -1,    ['glasses_2'] = 0,
			}
		else
			clothesSkin = {
				['bproof_1'] = 0,['bproof_2'] = 0,
				['decals_1'] = 0,     ['decals_2']= 0,
				['glasses_1'] = -1,    ['glasses_2'] = 0,
			}
		end
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		SetPedMaxTimeUnderwater(GetPlayerPed(-1), 60.00)
	end)
end)
end


function SetClothe(skin, job) 
TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			if Config.Uniforms[job].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
	end


function DrawM(hint, type, x, y, z)
	ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 170, false, true, 2, false, false, false, false)
end
