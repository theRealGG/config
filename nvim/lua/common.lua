function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

-- map to insert mode
function imap(shortcut, command)
	map("i", shortcut, command)
end

return {
	nmap = nmap,
	imap = imap,
}
