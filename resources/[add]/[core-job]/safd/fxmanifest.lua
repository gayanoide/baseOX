fx_version 'adamant'
this_is_a_map 'yes'

game 'gta5'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
    '@es_extended/locale.lua',

    'vestiaire/client.lua',

    'cl.lua',
    'clboss.lua',
    'message.lua',
    'dispatch.lua',
    'garage.lua',
    'vest.lua',
    'siren.lua',
    'dep/siren.lua',
    'show.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    '@oxmysql/lib/MySQL.lua',

    'vestiaire/server.lua',
    
    'sv.lua',
}

shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',

    --'vestiaire/config.lua',

    'config.lua',
}


-- Ambulance
client_scripts({
	'client/main.lua'
})

files {
    'data/handling.meta',
    'data/vehicles.meta',
    'data/carcols.meta',
    'data/carvariations.meta',
}
 
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'




-- Vetement
files {
    'mp_f_freemode_01_mp_f_safd.meta'
}
  
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_f_freemode_01_mp_f_safd.meta'