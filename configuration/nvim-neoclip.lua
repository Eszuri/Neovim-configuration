-- Konfigurasi dasar untuk init.lua atau init.vim dengan Lua block
require('neoclip').setup({
    enable_persistent_history = true,
    continuous_sync = true,
    default_register = {'+', '*'},  -- Gunakan clipboard sistem
})
