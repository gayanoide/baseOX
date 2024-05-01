RegisterNetEvent('sams:bossmenu')
AddEventHandler('sams:bossmenu', function(type, data)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'sams' and ESX.PlayerData.job.grade_name == 'boss' then
        samsboss()
    else
        ESX.ShowNotification("~y~ta pas acces miskin")
    end
end)

exports.ox_target:addBoxZone(
    {
        coords = vec3(Config.pos.boss.position.x, Config.pos.boss.position.y, Config.pos.boss.position.z),
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = drawZones,
        options = {
            {
                name = 'box',
                event = 'sams:bossmenu',
                icon = 'fa-solid fa-cube',
                label = 'Acceder a l\'ordinateur',
            },
        },
        minZ = Config.pos.soin.position.z - 0.3,
        maxZ = Config.pos.soin.position.z + 0.3,
    }
)

function samsboss()
    TriggerEvent('esx_society:openBossMenu', 'sams', function(data, menu)
        --menu.close()
    end, {wash = false})
end