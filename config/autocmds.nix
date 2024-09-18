{
  autoGroups = {
    auto_quit.clear = true;
    autoview.clear = true;
    bufferline.clear = true;
    checktime.clear = true;
    create_dir.clear = true;
    editorconfig_filetype.clear = true;
    file_user_events.clear = true;
    highlighturl.clear = true;
    highlightyank.clear = true;
    large_buf_settings.clear = true;
    q_close_windows.clear = true;
    terminal_settings.clear = true;
    unlist_quickfix.clear = true;
  };

  autoCmd = [
    # autoformat on save

    {
      desc = "Disable auto format on save by default";
      event = "BufWritePre";
      group = "autoview";

      callback.__raw = ''
        function()
          vim.b.autoformat = false
        end
      '';
    }


    # auto_quit
    {
      desc = "Quit neovim if more than one window is open and only sidebar windows are list";
      event = "BufEnter";
      group = "auto_quit";

      callback.__raw = ''
        function()
          local wins = vim.api.nvim_tabpage_list_wins(0)
          -- Both neo-tree and aerial will auto-quit if there is only a single window left
          if #wins <= 1 then return end
          local sidebar_fts = { aerial = true, ["neo-tree"] = true }
          for _, winid in ipairs(wins) do
            if vim.api.nvim_win_is_valid(winid) then
              local bufnr = vim.api.nvim_win_get_buf(winid)
              local filetype = vim.bo[bufnr].filetype
              -- If any visible windows are not sidebars, early return
              if not sidebar_fts[filetype] then
                return
              -- If the visible window is a sidebar
              else
                -- only count filetypes once, so remove a found sidebar from the detection
                sidebar_fts[filetype] = nil
              end
            end
          end
          if #vim.api.nvim_list_tabpages() > 1 then
            vim.cmd.tabclose()
          else
            vim.cmd.qall()
          end
        end
      '';
    }

    # autoview
    {
      desc = "Save view with mkview for real files";
      event = ["BufWinLeave" "BufWritePost" "WinLeave"];
      group = "autoview";

      callback.__raw = ''
        function(event)
          if vim.b[event.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
        end
      '';
    }
    {
      desc = "Try to load file view if available and enable view saving for real files";
      event = "BufWinEnter";
      group = "autoview";

      callback.__raw = ''
        function(event)
          if not vim.b[event.buf].view_activated then
            local filetype = vim.bo[event.buf].filetype
            local buftype = vim.bo[event.buf].buftype
            local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
            if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
              vim.b[event.buf].view_activated = true
              vim.cmd.loadview { mods = { emsg_silent = true } }
            end
          end
        end
      '';
    }

    {
      desc = "Make q close help, man, quickfix, dap floats";
      event = "BufWinEnter";
      group = "q_close_windows";

      callback.__raw = ''
        function(event)
          if vim.tbl_contains({ "help", "nofile", "quickfix" }, vim.bo[event.buf].buftype) then
            vim.keymap.set("n", "q", "<Cmd>close<CR>", {
              desc = "Close window",
              buffer = event.buf,
              silent = true,
              nowait = true,
            })
          end
        end
      '';
    }
  ];
}
