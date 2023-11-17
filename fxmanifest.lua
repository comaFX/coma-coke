fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
---
shared_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua'
}
---
server_scripts {
	'server/coke.lua',

}
---
client_scripts {
	'client/coke.lua',
	'client/sulfuricacid.lua',
	'client/target.lua',
}
