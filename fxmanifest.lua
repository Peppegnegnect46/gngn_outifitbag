fx_version 'cerulean'
game 'gta5'
lua54 'yes' -- Questo è importante, senza questo non funziona lo script! Non toccare!

author 'peppegnegnect46'
description 'Borsone outfit salvati'
discord 'https://discord.gg/TQwnckAKzS'
version '1.0'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_target'
}
