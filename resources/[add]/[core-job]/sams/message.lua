
local textscreens = {
    {
        coords = vector3(348.14, -592.78-0.1, 29.85+0.35),
        text = "[~y~Medecin de Garde~s~]",
        size = 1.0,
        font = 1,
        maxDistance = 5
    },
}






Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

        for i = 1, #textscreens do
            local distance = #(plyCoords - textscreens[i].coords)
            if distance < textscreens[i].maxDistance then
                ESX.Game.Utils.DrawText3D(textscreens[i].coords, textscreens[i].text, textscreens[i].size, textscreens[i].font)
            end
        end
    end
end)
