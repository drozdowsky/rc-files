local lspconfig = require("lspconfig")

-- Config Ruff as Formatter
lspconfig.ruff.setup({
    on_attach = function(client, bufnr)
        -- Disable formatter
        -- client.server_capabilities.documentFormattingProvider = false
        -- hover
        client.server_capabilities.hoverProvider = false

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end

    end,
    init_options = {
        settings = {
            args = {}
        }
    }
})

-- LSP
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})

local opts = { noremap = true, silent = true }

-- My bindings (LSP)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>g", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<leader>x", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>c", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", function()
    local filetype = vim.bo.filetype
    if filetype == "vim" or filetype == "help" then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    else
        vim.lsp.buf.hover()
    end
end, { noremap = true, silent = true })


-- Import nvim-cmp
local cmp = require('cmp')

-- Set up nvim-cmp
cmp.setup({
    -- Configuring snippet support
    snippet = {
        expand = function(args)
            -- require('luasnip').lsp_expand(args.body)  -- Expand snippets using LuaSnip
            vim.snippet.expand(args.body)
        end,
    },

    -- Key mappings for autocompletion
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger autocompletion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),  -- Confirm completion
        --
        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if cmp.get_selected_entry() == nil then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.select_next_item()
                end
            else
                fallback()
            end
        end, { "i", "s" }),
        --
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if cmp.get_selected_entry() == nil then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.select_prev_item()
                end
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    -- Completion sources
    sources = {
        { name = 'nvim_lsp' },  -- LSP completion
        { name = 'nvim_lsp_signature_help' }, -- signatures
        {
          name = 'buffer',
          option = {
              get_bufnrs = function()
                  return vim.api.nvim_list_bufs()
              end
          }
        },
        { name = 'path' },       -- Path completion
    },

    -- Completion configuration for LSP functions
    completion = {
        completeopt = 'menuone,noinsert,noselect',  -- Configures how completions are shown
    },

    -- Allow function signature suggestions
    preselect = cmp.PreselectMode.Item,
})

-- Enable LSP for Jedi
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.jedi_language_server.setup({
    capabilities = capabilities
})

-- Local highlight
require('local-highlight').setup({
    file_types = nil,
    disable_file_types = nil,
    hlgroup = 'MyHighlightGroup',
    cw_hlgroup = nil,
    insert_mode = false,
    min_match_len = 1,
    max_match_len = math.huge,
    highlight_single_match = true,
    animate = {
      enabled = false,
    },
    debounce_timeout = 200,
})
