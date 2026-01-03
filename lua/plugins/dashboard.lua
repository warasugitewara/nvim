return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
    opts = function()
      local logo = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
      logo = string.rep("\n", 4) .. logo .. "\n\n"

      return {
        theme = "doom",
        hide = { statusline = false },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = "Lazy", desc = "󰒲 Lazy", icon = "󰒲 ", key = "l" },
            { action = "Telescope find_files", desc = " Files", icon = " ", key = "f" },
            { action = "Telescope live_grep", desc = " Grep", icon = " ", key = "g" },
            { action = "ene", desc = " New file", icon = " ", key = "n" },
            { action = "qa", desc = "󰗼 Quit", icon = "󰗼 ", key = "q" },
          },
          -- 右サイドに直近編集ファイルを表示
          custom_right = function()
            local recent_files = {}
            for i, file in ipairs(vim.fn.reverse(vim.v.oldfiles or {})) do
              if i > 10 then break end
              table.insert(recent_files, "󰈔 " .. vim.fn.fnamemodify(file, ":t"))
            end
            return table.concat(recent_files, "\n")
          end,
          footer = function()
            return { "LazyVim + dashboard-nvim" }
          end,
        },
      }
    end,
  },
}
