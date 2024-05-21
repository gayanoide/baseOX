RegisterNetEvent('safd:bossmenu')
AddEventHandler('safd:bossmenu', function(type, data)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'safd' and ESX.PlayerData.job.grade_name == 'boss' then        
        exports.ox_lib:showContext('bosssafd')
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
                event = 'safd:bossmenu',
                icon = 'fa-solid fa-cube',
                label = 'Acceder a l\'ordinateur',
            },
        },
        minZ = Config.pos.boss.position.z - 0.3,
        maxZ = Config.pos.boss.position.z + 0.3,
    }
)


exports.ox_lib:registerContext({
    id = 'bosssafd',
    title = 'Bureau',
    options = {
        {
            title = 'Gestion du S.A.F.D',

            onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
                safdboss()
            end,
        },
        --{
        --    title = 'Gestion des tenues',

        --    onSelect = function()
                --ESX.ShowNotification("~y~ca fonctionne")
        --        OpenManageClotheMenu(society)
        --    end,
        --},        
    },
})




function safdboss()
    TriggerEvent('esx_society:openBossMenu', 'safd', function(data, menu)
        --menu.close()
    end, {wash = false})
end


Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.pos.menu.gps.x, Config.pos.menu.gps.y, Config.pos.menu.gps.z)
    SetBlipSprite(blip, 436)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("~Y~S.A.F.D~s~")
    EndTextCommandSetBlipName(blip)
end)