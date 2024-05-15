local ped
Citizen.CreateThread(function()
	while 1 do
		ped = PlayerPedId()
		Wait(5000)
	end
end)

spawned = nil

Citizen.CreateThread(function()
    while 1 do
        local pCoords = GetEntityCoords(PlayerPedId())
        for i=1, #Cars do 
            if #(pCoords - Cars[i].pos) < ShowRange then                                    
                if Cars[i].spawned == nil then
                    SpawnLocalCar(i) 
                end
            else
                DeleteEntity(Cars[i].spawned)
                Cars[i].spawned = nil                               
            end
            Wait(500)
        end
    end
end)


Citizen.CreateThread(function()
	local ped = ped
    while true do
        Citizen.Wait(0)
        local pl = GetEntityCoords(ped, true)
        for k, v in pairs(Cars) do
            if GetDistanceBetweenCoords(pl.x, pl.y, pl.z, v.pos.x, v.pos.y, v.pos.z, true) < 10 then
                Draw3DText(v.pos.x, v.pos.y, v.pos.z + 2.0, v.text, 0, 0.1, 0.1)                
            end
        end
    end
end)

Citizen.CreateThread(function() 
    while 1 do
        for i=1, #Cars do
            if Cars[i].spawned ~= nil and Cars[i].spin then
                SetEntityHeading(Cars[i].spawned, GetEntityHeading(Cars[i].spawned) - 0.15)
            end
        end
        Wait(5)
    end
end)

function SpawnLocalCar(i)
    Citizen.CreateThread(function()
        local hash = GetHashKey(Cars[i].model)
        RequestModel(hash)
        local attempt = 0
        while not HasModelLoaded(hash) do
            attempt = attempt + 1
            if attempt > 2000 then return end
            Wait(0)
        end
        local veh = CreateVehicle(hash, Cars[i].pos.x, Cars[i].pos.y, Cars[i].pos.z-1,Cars[i].heading, false, false)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(Vehicle, 0.0)
        SetVehicleEngineOn(veh, false)
        SetVehicleBrakeLights(veh, false)
        SetVehicleLights(veh, 0)
        SetVehicleLightsMode(veh, 0)
        SetVehicleInteriorlight(veh, false)
        SetVehicleOnGroundProperly(veh)
        FreezeEntityPosition(veh, true)
        SetVehicleCanBreak(veh, true)
        SetVehicleFullbeam(veh, false)
        if carInvincible then
        SetVehicleReceivesRampDamage(veh, true)
        RemoveDecalsFromVehicle(veh)
        SetVehicleCanBeVisiblyDamaged(veh, true)
        SetVehicleLightsCanBeVisiblyDamaged(veh, true)
        SetVehicleWheelsCanBreakOffWhenBlowUp(veh, false)  
        SetDisableVehicleWindowCollisions(veh, true)    
        SetEntityInvincible(veh, true)
        end
        if DoorLock then 
            SetVehicleDoorsLocked(veh, 2)
        end
        SetVehicleNumberPlateText(veh, Cars[i].plate)
        Cars[i].spawned = veh
    end)
end

AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        for i=1, #Cars do
            if Cars[i].spawned ~= nil then
                DeleteEntity(Cars[i].spawned)
            end
        end
    end
end)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.50)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end