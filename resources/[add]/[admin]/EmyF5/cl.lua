RegisterKeyMapping('EmyF5', 'Ouvrir le menu Personel', 'keyboard', 'F5')
local lib = exports.ox_lib



lib:registerContext({
    id = 'persomenu',
    title = 'Menu Personnel \n\n Votre ID : '..GetPlayerServerId(PlayerId()),
    options = {
      {
        title = 'GPS rapide',
        description = 'un endroit ou aller ?',
        menu = 'gps_menu',
      },
      {
        title = 'Mes factures', 
        description = 'Payer mes factures',
        onSelect = function()
            --print("Pressed the button!")
            TriggerEvent("okokBilling:ToggleMyInvoices")
        end,
      },
      {
        title = 'Menu Vehicule',
        description = 'Gestion de votre vehicule!',
        menu = 'vehicle_menu',
      },
      {
        title = 'Parametre',
        description = 'Quelque parametre que vous pouvez faire!',
        menu = 'settings_menu',
      },
    }
})







lib:registerContext({
    id = 'gps_menu',
    title = 'GPS',
    menu = 'some_menu1',
    onBack = function()
      --print('Went back!')
    end,
    options = {
      {
        title = 'L.S.P.D', 
        description = 'Los Santos Police Departement',
        image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043168597311589/latest.png?ex=6632ef15&is=66319d95&hm=9bf078b75ff0942827f6309e1a483d497672f95f1ac965e392057e74510b1c00&",
        progress = '25',      
        onSelect = function()
            --print("Pressed the button!")
            SetNewWaypoint(vector3(411.5051, -978.7050, 29.4230))
        end,
      },
      {
        title = 'S.A.M.S', 
        description = 'San Andreas Medical Services',
        image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235042853823058041/3nK6rWF.png?ex=6632eeca&is=66319d4a&hm=af689333b1e855603a9ac583e9de2d4c5b299cf2e740dd1cf45d6cf252615016&",
        progress = '50',      
        onSelect = function()
            --print("Pressed the button!")
            SetNewWaypoint(vector3(297.8938, -583.9264, 43.2608))
        end,
      },
      {
        title = 'S.A.F.D', 
        description = 'San Andreas Fire Departement',
        image = 'https://cdn.discordapp.com/attachments/1235042291115360317/1235042307372486713/1PKuPfK.png?ex=6632ee48&is=66319cc8&hm=e8263930447c224c32450fb5bd0d1d9ad13a742fd74320f58596e46bf48d0831&',
        progress = '75',      
        onSelect = function()
            --print("Pressed the button!")
            SetNewWaypoint(vector3(-660.8474, -75.8661, 38.5911))
        end,
      },
      {
        title = 'B.C.S.O', 
        description = 'Blaine County Sheriff Office',
        image = "https://cdn.discordapp.com/attachments/1235042291115360317/1235043483023183902/badge-8.png?ex=6632ef60&is=66319de0&hm=601626d43835340c5403012fe25042c1f895779381c6646d2d002fd3e48d1159&",
        progress = '100',      
        onSelect = function()
            --print("Pressed the button!")
            SetNewWaypoint(vector3(-440.6825, 6019.1982, 31.4901))
        end,
      },
    }
})






lib:registerContext({
  id = 'vehicle_menu',
  title = 'Parametre',
  menu = 'some_menu3',
  onBack = function()
    --print('Went back!')
  end,
  options = {
    {
      title = 'Eteindre le moteur',
      onSelect = function() 
        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, false, true)
        SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), false)
      end,
    },
    {
      title = 'Passer en Conducteur',
      onSelect = function() 
        SetPedIntoVehicle(plyPed, plyVehicle, -1)
      end,
    },
    {
      title = 'Gestion des clefs',
      description = 'Menu pour preter / donner les clef de vehicules',
      onSelect = function() 
        
      end,
    }
  }
})







lib:registerContext({
    id = 'settings_menu',
    title = 'Parametre',
    menu = 'some_menu2',
    onBack = function()
      --print('Went back!')
    end,
    options = {
        --[[
      {
        title = 'Activer le mode Cinema',
        onSelect = function()    
            TriggerEvent('es:setMoneyDisplay', 0.0)
            TriggerEvent('esx_status:setDisplay', 0.0)
            TriggerEvent('esx:pauseMenuActive', 0.0)
        end,
      },
      {
        title = 'Desactiver le mode Cinema',
        onSelect = function()    
            TriggerEvent('es:setMoneyDisplay', 1.0)
            TriggerEvent('esx_status:setDisplay', 1.0)
            TriggerEvent('esx:pauseMenuActive', 1.0)
        end,
      },
      ]]--
      {
        title = 'Config HUD',
        onSelect = function()
            ExecuteCommand("hudsettings")
        end,
      },
      --{
      --  title = 'Mode Editor',
      --  onSelect = function()
      --      ExecuteCommand("stream")
      --  end,
      --}
    }
})





































RegisterNetEvent('EmyF5', function(args)
    lib:registerContext({
      id = 'EmyF5',
      title = 'Event menu',
      menu = 'persomenu',
      options = {
        {
          title = 'Event value: '..args.someValue,
        }
    }
})
   
lib:showContext('EmyF5')
end)

RegisterCommand('EmyF5', function()
   lib:showContext('persomenu')
end)