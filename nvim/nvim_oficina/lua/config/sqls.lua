-- ~/.config/nvim/lua/config/sqls.lua
   local fn = vim.fn
   local api = vim.api

   local function make_show_results_handler(mods)
       return function(err, result, _, _)
           if err then
               vim.notify('sqls: ' .. err.message, vim.log.levels.ERROR)
               return
           end
           if not result then
               return
           end
           local tempfile = fn.tempname() .. '.sqls_output'
           local bufnr = fn.bufnr(tempfile, true)
           api.nvim_buf_set_lines(bufnr, 0, 1, false, vim.split(result, '\n'))
           vim.cmd(('botright %s pedit %s'):format(mods or '', tempfile))
           api.nvim_set_option_value('filetype', 'sqls_output', {buf = bufnr})
       end
   end

   require('sqls.commands').make_show_results_handler = make_show_results_handler
