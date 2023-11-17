fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

shared_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/CircleZone.lua',
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua'
}

server_scripts {
	'server/coke.lua',
	'server/heroin.lua',
	'server/mdma.lua',
	'server/meth.lua',
	'server/weed.lua',
	'server/consumables.lua',
}

client_scripts {
	'client/coke.lua',
	'client/heroin.lua',
	'client/mdma.lua',
	'client/meth.lua',
	'client/weed.lua',
	'client/target.lua',
	'client/consumables.lua',
	
}

--[[
this_is_a_map 'yes'
data_file 'DLC_ITYP_REQUEST' 'labs.ytyp'

file 'stream/**.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/**.ytyp'
--]]
