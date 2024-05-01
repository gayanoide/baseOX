--================================--
--          RP /me v1.0.0         --
--            by GIMI             --
--      License: GNU GPL 3.0      --
--================================--

local displaying = {}
local maxDisplayed = {}
local player = PlayerId()
local serverID = GetPlayerServerId(player)

--====================--
--       Events       --
--====================--

RegisterNetEvent('rpchat:displayText')
AddEventHandler(
    'rpchat:displayText',
    function(source, text)
        local sender = GetPlayerFromServerId(source)
        local senderPed = GetPlayerPed(sender)

        text = tostring(text)

        if text and sender and sender > 0 and #(GetEntityCoords(GetPlayerPed(player)) - GetEntityCoords(senderPed)) <= Config.Text.displayDistance then
            Render3DText(source, text, nil, senderPed)
        end
    end
)

--====================--
--     Functions      --
--====================--

function Render3DText(source, text, timeOnScreen, entity)
    if not displaying[source] then
        displaying[source] = 0
    end
    if not maxDisplayed[source] then
        maxDisplayed[source] = 0
    end

    entity = entity or GetPlayerPed(GetPlayerFromServerId(source))
    
    local text = text:len() >= Config.Text.maxLength and text:sub(1, Config.Text.maxLength) .. "..." or text
    local timeOnScreen = timeOnScreen and timeOnScreen or Config.Text.timeOnScreen
    local offset = 1 + (maxDisplayed[source] * 0.14)

    local timedOut = false

    Citizen.SetTimeout( -- Let the thread below finish after a certain time
        timeOnScreen,
        function()
            timedOut = true
        end
    )

    Citizen.CreateThread( -- Draw the text each frame until cancelled
        function()
            maxDisplayed[source] = not maxDisplayed[source] and 1 or maxDisplayed[source] + 1
            displaying[source] = displaying[source] + 1
            local textCoords = vector3(0, 0, 0)
            while not timedOut do
                Citizen.Wait(5)
                
                textCoords = GetEntityCoords(entity) + vector3(0, 0, offset)
                
                DrawTextThisFrame(text, textCoords)
            end
            displaying[source] = displaying[source] - 1
            if displaying[source] == 0 then
                maxDisplayed[source] = 0
            end
        end
    )
end

function DrawTextThisFrame(text, coords, scale)
    local onScreen, x, y = GetScreenCoordFromWorldCoord(table.unpack(coords))

    scale = scale or Config.Text.scale

    if onScreen then
        SetTextFont(Config.Text.font)
        SetColourOfNextTextComponent(000)
        SetTextCentre(true)
        SetTextScale(0.01, scale)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(x, y)

        local height = GetTextScaleHeight(scale, Config.Text.font)
        local width = text:len() * 0.0075 * scale

        if Config.Text.background then
            DrawRect(x, y + scale / 30, width + 0.020, height + 0.010, 0 --[[ R ]], 0 --[[ G ]], 0 --[[ B ]], 60 --[[ alpha ]])
        end
    end
end