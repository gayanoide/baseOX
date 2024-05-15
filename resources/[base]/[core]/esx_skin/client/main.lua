local lastSkin, cam, isCameraActive
local firstSpawn, zoomOffset, camOffset, heading, skinLoaded = true, 0.0, 0.0, 90.0, false

function OpenMenu(submitCb, cancelCb, restrict)
    local playerPed = PlayerPedId()

    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
    TriggerEvent('skinchanger:getData', function(components, maxVals)
        local elements = {}
        local _components = {}

        -- Restrict menu
        if restrict == nil then
            for i=1, #components, 1 do
                _components[i] = components[i]
            end
        else
            for i=1, #components, 1 do
                local found = false

                for j=1, #restrict, 1 do
                    if components[i].name == restrict[j] then
                        found = true
                    end
                end

                if found then
                    table.insert(_components, components[i])
                end
            end
        end
        -- Insert elements
        for i=1, #_components, 1 do
            local value = _components[i].value
            local componentId = _components[i].componentId

            if componentId == 0 then
                value = GetPedPropIndex(playerPed, _components[i].componentId)
            end

            local data = {
                label = _components[i].label,
                name = _components[i].name,
                value = value,
                min = _components[i].min,
                textureof = _components[i].textureof,
                zoomOffset= _components[i].zoomOffset,
                camOffset = _components[i].camOffset,
                type = 'slider'
            }

            for k,v in pairs(maxVals) do
                if k == _components[i].name then
                    data.max = v
                    break
                end
            end

            table.insert(elements, data)
        end

        CreateSkinCam()
        zoomOffset = _components[1].zoomOffset
        camOffset = _components[1].camOffset

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'skin', {
            title = _U('skin_menu'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)

            submitCb(data, menu)
            DeleteSkinCam()
        end, function(data, menu)
            menu.close()
            DeleteSkinCam()
            TriggerEvent('skinchanger:loadSkin', lastSkin)

            if cancelCb ~= nil then
                cancelCb(data, menu)
            end
        end, function(data, menu)
            local skin, components, maxVals

            TriggerEvent('skinchanger:getSkin', function(getSkin) skin = getSkin end)

            zoomOffset = data.current.zoomOffset
            camOffset = data.current.camOffset

            if skin[data.current.name] ~= data.current.value then
                -- Change skin element
                TriggerEvent('skinchanger:change', data.current.name, data.current.value)

                -- Update max values
                TriggerEvent('skinchanger:getData', function(comp, max)
                    components, maxVals = comp, max
                end)

                local newData = {}

                for i=1, #elements, 1 do
                    newData = {}
                    newData.max = maxVals[elements[i].name]

                    if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
                        newData.value = 0
                    end

                    menu.update({name = elements[i].name}, newData)
                end

                menu.refresh()
            end
        end, function(data, menu)
            DeleteSkinCam()
        end)
    end)
end

function OpenMenu2(submitCb, cancelCb, restrict)
    local playerPed = PlayerPedId()
   TriggerServerEvent('catalog:set', PlayerPedId(), true)
    
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)
    TriggerEvent('skinchanger:getData', function(components, maxVals)
        local elements = {}
        local _components = {}

        -- Restrict menu
        if restrict == nil then
            for i=1, #components, 1 do
                _components[i] = components[i]
            end
        else
            for i=1, #components, 1 do
                local found = false

                for j=1, #restrict, 1 do
                    if components[i].name == restrict[j] then
                        found = true
                    end
                end

                if found then
                    table.insert(_components, components[i])
                end
            end
        end
        -- Insert elements
        for i=1, #_components, 1 do
            local value = _components[i].value
            local componentId = _components[i].componentId

            if componentId == 0 then
                value = GetPedPropIndex(playerPed, _components[i].componentId)
            end

            local data = {
                label = _components[i].label,
                name = _components[i].name,
                value = value,
                min = _components[i].min,
                textureof = _components[i].textureof,
                zoomOffset= _components[i].zoomOffset,
                camOffset = _components[i].camOffset,
                type = 'slider'
            }

            for k,v in pairs(maxVals) do
                if k == _components[i].name then
                    data.max = v
                    break
                end
            end

            table.insert(elements, data)
        end

        CreateSkinCam()
        zoomOffset = _components[1].zoomOffset
        camOffset = _components[1].camOffset

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'skin', {
            title = _U('skin_menu'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)

            submitCb(data, menu)
            DeleteSkinCam()
           TriggerServerEvent('catalog:set', 0, false)
        end, function(data, menu)
            menu.close()
            DeleteSkinCam()
            TriggerServerEvent('catalog:set', 0, false)
            TriggerEvent('skinchanger:loadSkin', lastSkin)

            if cancelCb ~= nil then
                cancelCb(data, menu)
            end
        end, function(data, menu)
            local skin, components, maxVals

            TriggerEvent('skinchanger:getSkin', function(getSkin) skin = getSkin end)

            zoomOffset = data.current.zoomOffset
            camOffset = data.current.camOffset

            if skin[data.current.name] ~= data.current.value then
                -- Change skin element
                TriggerEvent('skinchanger:change', data.current.name, data.current.value)

                -- Update max values
                TriggerEvent('skinchanger:getData', function(comp, max)
                    components, maxVals = comp, max
                end)

                local newData = {}

                for i=1, #elements, 1 do
                    newData = {}
                    newData.max = maxVals[elements[i].name]

                    if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
                        newData.value = 0
                    end

                    menu.update({name = elements[i].name}, newData)
                end

                menu.refresh()
            end
        end, function(data, menu)
            TriggerServerEvent('catalog:set', 0, false)
    
            DeleteSkinCam()
        end)
    end)
end

function CreateSkinCam()
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end

    local playerPed = PlayerPedId()

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)

    isCameraActive = true
    SetCamCoord(cam, GetEntityCoords(playerPed))
    SetCamRot(cam, 0.0, 0.0, 270.0, true)
    SetEntityHeading(playerPed, 0.0)
end

function DeleteSkinCam()
    isCameraActive = false
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    cam = nil
end

CreateThread(function()
    while true do
        local sleep = 1500

        if isCameraActive then
            sleep = 0
            DisableControlAction(2, 30, true)
            DisableControlAction(2, 31, true)
            DisableControlAction(2, 32, true)
            DisableControlAction(2, 33, true)
            DisableControlAction(2, 34, true)
            DisableControlAction(2, 35, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 178, true)
            DisableControlAction(0, 1, true)

            local playerPed = PlayerPedId()
            local coords    = GetEntityCoords(playerPed)

            local angle = heading * math.pi / 180.0
            local theta = {
                x = math.cos(angle),
                y = math.sin(angle)
            }

            local pos = {
                x = coords.x + (zoomOffset * theta.x),
                y = coords.y + (zoomOffset * theta.y)
            }

            local angleToLook = heading - 140.0
            if angleToLook > 360 then
                angleToLook = angleToLook - 360
            elseif angleToLook < 0 then
                angleToLook = angleToLook + 360
            end

            angleToLook = angleToLook * math.pi / 180.0
            local thetaToLook = {
                x = math.cos(angleToLook),
                y = math.sin(angleToLook)
            }

            local posToLook = {
                x = coords.x + (zoomOffset * thetaToLook.x),
                y = coords.y + (zoomOffset * thetaToLook.y)
            }

            SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
            PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)

            ESX.ShowHelpNotification(_U('use_rotate_view'))
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    local angle = 90

    while true do
        local sleep = 1500

        if isCameraActive then
            sleep = 0
            if IsControlPressed(0, 209) then
                angle = angle - 1
            elseif IsControlPressed(0, 19) then
                angle = angle + 1
            end

            if angle > 360 then
                angle = angle - 360
            elseif angle < 0 then
                angle = angle + 360
            end

            heading = angle + 0.0
        end
    Wait(sleep)
    end
end)

function OpenSaveableMenu(submitCb, cancelCb, restrict)
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)

    OpenMenu(function(data, menu)
        menu.close()
        DeleteSkinCam()

        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)

            if submitCb ~= nil then
                submitCb(data, menu)
            end
        end)

    end, cancelCb, restrict)
end

function OpenSaveableMenu2(submitCb, cancelCb, restrict)
    TriggerEvent('skinchanger:getSkin', function(skin) lastSkin = skin end)

    OpenMenu2(function(data, menu)
        menu.close()
        DeleteSkinCam()

        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)

            if submitCb ~= nil then
                submitCb(data, menu)
            end
        end)

    end, cancelCb, {
        'sex', 
        'face', 
        'skin', 
        'beard_1', 
        'beard_2', 
        'beard_3', 
        'beard_4', 
        'hair_1', 
        'hair_2', 
        'hair_color_1', 
        'hair_color_2', 
        'eye_color', 
        'eyebrows_1', 
        'eyebrows_2', 
        'eyebrows_3',
        'eyebrows_4',
        'makeup_1', 
        'makeup_2', 
        'makeup_3',
        'makeup_4',
        'lipstick_1', 
        'lipstick_2', 
        'lipstick_3',
        'lipstick_4',
        'ears_1',
        'ears_2',
        'glasses_1',
        'glasses_2',
        'helmet_1',
        'helmet_2',
        'watches_1',
        'watches_2',
                

        'tshirt_1',
		'tshirt_2',
		'torso_1',
		'torso_2',
		'bproof_1',
		'bproof_2',
		'decals_1',
		'decals_2',
		'arms',
	    'bracelets_1',
        'bracelets_2',
        'chain_1',
	    'chain_2',
        'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
    })
end

AddEventHandler('esx_skin:resetFirstSpawn', function()
    firstSpawn = false
    skinLoaded = false
    ESX.PlayerLoaded = false
end)

RegisterNetEvent('esx_skin:openSaveableAdminMenu')
AddEventHandler('esx_skin:openSaveableAdminMenu', function(submitCb, cancelCb)
    OpenSaveableMenu2(submitCb, cancelCb, nil)
end)

AddEventHandler('esx_skin:playerRegistered', function()
    CreateThread(function()
        while not ESX.PlayerLoaded do
            Wait(100)
        end

        if firstSpawn then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                if skin == nil then
                    TriggerEvent('skinchanger:loadSkin', {sex = 0}, OpenSaveableMenu2)
                    Wait(100)
                    skinLoaded = true
                else
                    TriggerEvent('skinchanger:loadSkin', skin)
                    Wait(100)
                    skinLoaded = true
                end
            end)

            firstSpawn = false
        end
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerLoaded = true
end)

AddEventHandler('esx_skin:getLastSkin', function(cb) cb(lastSkin) end)
AddEventHandler('esx_skin:setLastSkin', function(skin) lastSkin = skin end)

RegisterNetEvent('esx_skin:openMenu')
AddEventHandler('esx_skin:openMenu', function(submitCb, cancelCb)
    OpenMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:openRestrictedMenu')
AddEventHandler('esx_skin:openRestrictedMenu', function(submitCb, cancelCb, restrict)
    OpenMenu(submitCb, cancelCb, restrict)
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
    OpenSaveableMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:openSaveableRestrictedMenu')
AddEventHandler('esx_skin:openSaveableRestrictedMenu', function(submitCb, cancelCb, restrict)
    OpenSaveableMenu(submitCb, cancelCb, restrict)
end)

RegisterNetEvent('esx_skin:requestSaveSkin')
AddEventHandler('esx_skin:requestSaveSkin', function()
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:responseSaveSkin', skin)
    end)
end)
