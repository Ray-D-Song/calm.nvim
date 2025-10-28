# calm.nvim

A Neovim colorscheme based on Tomorrow's **Pygments Dark** palette. The goal is to offer language-agnostic defaults that keep the Tomorrow mix of muted foregrounds, orchid keywords, and teal operators while staying low contrast and calm.

## Features

- Uses Tomorrow (Pygments) dark palette with hand-tuned opacity conversions for Neovim.
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
print(colors.blue) -- #81a2be
```

## Contributing

Issues and pull requests are welcome. Share screenshots if you tweak the palette for specific languages—seeing the theme in real projects helps keep the balance right.
