local common = require('common')
local nmap = common.nmap

local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript',
    python = 'python',
    lua = 'lua'
  }
}

local bindings = {
  ['<C-J>'] = '<Cmd>Lspsaga diagnostic_jump_next<CR>',
  K =  '<Cmd>Lspsaga hover_doc<CR>',
  gd = '<Cmd>Lspsaga lsp_finder<CR>',
  ['C-k>'] = '<Cmd>Lspsaga signature_help<CR>',
  gp = '<Cmd>Lspsaga preview_definition<CR>',
  gr = '<Cmd>Lspsaga rename<CR>'
}

for binding, cmd in pairs(bindings) do
  nmap(binding, cmd)
end

