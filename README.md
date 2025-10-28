# calm.nvim

A Neovim colorscheme inspired by GitLab's **Dark Grey** editor palette. The goal is to make reusable, language-agnostic defaults that respect GitLab's mix of salmon reds, violet keywords, and cyan operators while keeping the UI low contrast and calm.

## Features

- Uses GitLab Dark Grey palette with adjusted opacity values for Neovim.
- Highlights tuned for Tree-sitter, LSP diagnostics, and popular plugins (Telescope, nvim-tree, which-key, lazy.nvim, cmp).
- Optional transparent background and simple override hook for custom highlight tweaks.

## Installation (lazy.nvim)

```lua
{
  "ray-d-song/calm.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("calm").setup({
      -- transparent = true,
      -- highlights = function(colors)
      --   return {
      --     Normal = { fg = colors.fg, bg = "NONE" },
      --     CursorLine = { bg = colors.selection },
      --   }
      -- end,
    })

    vim.cmd.colorscheme("calm")
  end,
}
```

### Options

- `transparent` (boolean): keep the background `NONE` so your terminal or GUI background shows through.
- `highlights` (table | fun(colors: table): table): merge extra highlight definitions after the defaults. Use this to fine-tune individual groups without forking the scheme.

## Usage

With the plugin loaded, call:

```lua
vim.cmd.colorscheme("calm")
```

You can access the palette table with:

```lua
local colors = require("calm").colors()
print(colors.blue) -- #7fb6ed
```

## Contributing

Issues and pull requests are welcome. Share screenshots if you tweak the palette for specific languages—seeing the theme in real projects helps keep the balance right.
