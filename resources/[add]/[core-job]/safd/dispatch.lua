RegisterNetEvent('safd:dispatchmenu')
AddEventHandler('safd:dispatchmenu', function(type, data)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'safd' then
        ExecuteCommand('panel')
    else
        ESX.ShowNotification("~y~ta pas acces miskin")
    end
end)

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.dispatch.position.x, Config.pos.dispatch.position.y, Config.pos.dispatch.position.z),
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = drawZones,
        options = {
            {
                name = 'box',
                event = 'safd:dispatchmenu',
                icon = 'fa-solid fa-cube',
                label = 'Acceder au Dispatch',
            },
        },
        minZ = Config.pos.dispatch.position.z - 0.3,
        maxZ = Config.pos.dispatch.position.z + 0.3,
    }
)