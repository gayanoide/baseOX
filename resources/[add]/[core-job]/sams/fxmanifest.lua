
fx_version 'adamant'
game 'gta5'
version '1.0.0'

shared_scripts {
  'config.lua',
}

client_scripts {
  'cl.lua',
  'clboss.lua',
  'message.lua',
  'dispatch.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'sv.lua',
}

dependencies {
  'es_extended',
  'ox_lib',
}

