
fx_version 'adamant'
game 'gta5'
version '1.0.0'

shared_scripts {
  'config.lua',
}

client_scripts {
  'cl.lua',
  'cam.lua',

  
	'me/rpme/config.lua',
	'me/rpme/client/main.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',

  
	'me/rpme/config.lua',
	'me/rpme/server/main.lua',
}

dependencies {
  'es_extended',
  'ox_lib',
}
