RegisterKeyMapping('EmyDevMenu', 'Ouvrir le menu Dev', 'keyboard', 'F10')


local lib = exports.ox_lib
ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)



lib:registerContext({
    id = 'devmenu',
    title = 'Menu DEV \n\n Votre ID : '..GetPlayerServerId(PlayerId()),
    options = {
      {
        title = 'Revive', 
        description = 'Pour se revive',
        onSelect = function()
            ExecuteCommand("revive me")
        end,
      },
      {
        title = 'TP rapide',
        description = 'un endroit ou se TP ?',
        menu = 'gpsdev_menu',
      },
      {
        title = 'Afficher / Cacher les coordonnées', 
        description = 'X Y Z H au niveau de la map',
        onSelect = function()
            --print("Pressed the button!")
            ExecuteCommand("coords")
        end,
      },
      {
        title = 'Spawn vehicule',
        description = 'Besoin d\'un vehicule ?',
        menu = 'carspawn_menu',
      },
      {
        title = 'Paramedical',
        description = 'Besoin d\'un vehicule ?',
        menu = 'paramedic_menu',
      },
      --{
      --  title = 'DEV',
      --  description = ' ',
      --  menu = 'dev_menu',
      --},
    }
})







lib:registerContext({
    id = 'gpsdev_menu',
    title = 'GPS',
    menu = 'some_menu1',
    onBack = function()
      --print('Went back!')
    end,
    options = {
      {
        title = Config.dev.lspd.titre,
        description = Config.dev.lspd.desc,      
        image = Config.dev.lspd.image,
        progress = '25',      
        onSelect = function()
            --print("Pressed the button!")                            
            DoScreenFadeOut(1000)
            Wait(1000)
            FreezeEntityPosition(PlayerPedId(), true)
            tp(Config.dev.lspd.position.x, Config.dev.lspd.position.y, Config.dev.lspd.position.z-0.90)
            SetEntityHeading(PlayerPedId(), Config.dev.lspd.heading)
            FreezeEntityPosition(PlayerPedId(), false)
            Wait(900)
            DoScreenFadeIn(1000)
        end,
      },
      {
        title = Config.dev.sams.titre,
        description = Config.dev.sams.desc,
        image = Config.dev.sams.image,
        progress = '50',      
        onSelect = function()
            --print("Pressed the button!")                            
            DoScreenFadeOut(1000)
            Wait(1000)
            FreezeEntityPosition(PlayerPedId(), true)
            tp(Config.dev.sams.position.x, Config.dev.sams.position.y, Config.dev.sams.position.z-0.90)
            SetEntityHeading(PlayerPedId(), Config.dev.sams.heading)
            FreezeEntityPosition(PlayerPedId(), false)
            Wait(900)
            DoScreenFadeIn(1000)
        end,
      },
      {
        title = Config.dev.safd.titre,
        description = Config.dev.safd.desc,
        image = Config.dev.safd.image,
        progress = '75',      
        onSelect = function()
            --print("Pressed the button!")                            
            DoScreenFadeOut(1000)
            Wait(1000)
            FreezeEntityPosition(PlayerPedId(), true)
            tp(Config.dev.safd.position.x, Config.dev.safd.position.y, Config.dev.safd.position.z-0.90)
            SetEntityHeading(PlayerPedId(), Config.dev.safd.heading)
            FreezeEntityPosition(PlayerPedId(), false)
            Wait(900)
            DoScreenFadeIn(1000)
        end,
      },
      {
        title = Config.dev.bcso.titre,
        description = Config.dev.bcso.desc,
        image = Config.dev.bcso.image,
        progress = '100',      
        onSelect = function()
            --print("Pressed the button!")                            
            DoScreenFadeOut(1000)
            Wait(1000)
            FreezeEntityPosition(PlayerPedId(), true)
            tp(Config.dev.bcso.position.x, Config.dev.bcso.position.y, Config.dev.bcso.position.z-0.90)
            SetEntityHeading(PlayerPedId(), Config.dev.bcso.heading)
            FreezeEntityPosition(PlayerPedId(), false)
            Wait(900)
            DoScreenFadeIn(1000)
        end,
      },
    }
})


lib:registerContext({
  id = 'carspawn_menu',
  title = 'Vehicule',
  menu = 'some_menu',
  onBack = function()
    --print('Went back!')
  end,
  options = {
    {
      title = 'sultan', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car sultan")
      end,
    },
    {
      title = 'elegy retro', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car elegy")
      end,
    },
    {
      title = 'nightblade', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car nightblade")
      end,
    },
    {
      title = 'camion de pompier', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car firetruk")
      end,
    },
    {
      title = 'ambulance', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car ambulance")
      end,
    },
    {
      title = 'Voiture de police', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car police")
      end,
    },
    {
      title = 'XLS blindé', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      onSelect = function()
          ExecuteCommand("car xls2")
      end,
    },
  }
})


lib:registerContext({
  id = 'paramedic_menu',
  title = 'Soin',
  menu = 'some_menu',
  onBack = function()
    --print('Went back!')
  end,
  options = {
    {
      title = 'Se revive', 
      onSelect = function()
          --print("Pressed the button!")
          ExecuteCommand("revive me")          
      end,
    },
    {
      title = 'Heal me', 
      onSelect = function()
          --print("Pressed the button!") 
          ExecuteCommand("heal me")        
      end,
    },
  }
})







lib:registerContext({
  id = 'dev_menu',
  title = 'DEV',
  menu = 'some_menu',
  onBack = function()
    --print('Went back!')
  end,
  options = {
    {
      title = 'Afficher / Cacher les coordonnées', 
      description = ' ',
      --image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
      progress = '25',      
      onSelect = function()
          --print("Pressed the button!")
          ExecuteCommand("coords")
      end,
    },
  }
})
local coordsVisible = false

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.778, 0.778)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.08, 0.800)
  drawRct2(0.01,0.790,0.23,0.20,0,0,0,255)
end

function drawRct2(x,y,width,height,r,g,b,a)
  DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~y~X~o~: %s \n~y~Y~o~: %s \n~y~Z~o~: %s \n~y~H~o~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("coords", function()
    ToggleCoords()
end)



function tp(x,y,z)
	SetEntityCoords(PlayerPedId(), x, y, z - 0.9)
end

RegisterNetEvent('tp:openmenu')
AddEventHandler('tp:openmenu', function()
    exports.ox_lib:showContext('tpadmin')
end)










































RegisterNetEvent('EmyDevMenu', function(args)
    lib:registerContext({
      id = 'EmyDevMenu',
      title = 'Event menu',
      menu = 'devmenu',
      options = {
        {
          title = 'Event value: '..args.someValue,
        }
    }
})
   
lib:showContext('EmyDevMenu')
end)

RegisterCommand('EmyDevMenu', function()
   lib:showContext('devmenu')
end)

RegisterCommand('EmyDevMenu', function()
  --ESX.TriggerServerCallback('BahFaut:getUsergroup', function(group)
  --    playergroup = group
  --    for k,v in pairs(Config.dev.AdminRanks) do
  --    if playergroup == v then
        lib:showContext('devmenu')
  --    else
  --        superadmin = false
  --    end
  --end
  --end)
end, false)