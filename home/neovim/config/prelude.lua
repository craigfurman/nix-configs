
-- need a leading newline to avoid this going onto the same line as the sourcing of viml config
-- globals
cmd = vim.cmd
fn = vim.fn
g = vim.g
opt = vim.opt
api = vim.api

-- vim helper functions
function map(mode, lhs, rhs, opts)
  opts = opts or {noremap=true, silent=true}
  api.nvim_set_keymap(mode, lhs, rhs, opts)
end

vmap = function(lhs, rhs, opts) map('v', lhs, rhs, opts) end
nmap = function(lhs, rhs, opts) map('n', lhs, rhs, opts) end
imap = function(lhs, rhs, opts) map('i', lhs, rhs, opts) end

-- map the leader before we call any mapping functions
g.mapleader = ','

function make_format_autocmd(pattern, command)
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = pattern,
    callback = function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local output = vim.fn.systemlist(command, lines)

      if vim.v.shell_error == 0 then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
        return
      end

      local err = table.concat(output, "\n")

      vim.notify(
        "formatting failed:\n" .. err,
        vim.log.levels.ERROR,
        { title = "Formatter" }
      )
    end,
  })
end
