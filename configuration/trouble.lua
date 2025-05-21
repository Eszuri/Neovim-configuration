require("trouble").setup {
    -- Konfigurasi opsional
    position = "bottom", -- posisi jendela (bisa "bottom", "top", "left", atau "right")
    height = 10,         -- tinggi jendela untuk posisi horizontal
    width = 50,          -- lebar jendela untuk posisi vertikal
    icons = true,        -- tampilkan ikon
    mode = "workspace_diagnostics", -- mode default (bisa diubah ke "document_diagnostics", "quickfix", dll.)
    use_diagnostic_signs = true     -- gunakan tanda diagnostik dari LSP
}
