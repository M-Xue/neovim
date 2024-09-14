--- @class (exact) ColorConfig
--- @field red string
--- @field green string
--- @field blue string
--- @field yellow string
--- @field purple string
--- @field orange string
--- @field pink string
--- @field turquoise string
---
--- @field grey_lighter string
--- @field grey string
--- @field grey_darker string
---
--- @field bg_lighter string
--- @field bg string
--- @field bg_darker string
---
--- @field black string
--- @field white string

--- @class (exact) ThemeConfig
--- @field colorscheme_name string
--- @field colors ColorConfig
--
--- @field border_color string
--- @field window_color string
--- @field cmp_selected_color string
--- @field telescope_selected_color string
--- @field telescope_window_color string
--- @field telescope_border_color string
--
--- @field border_radius "single" | "rounded" | "none"
--- @field cmp_format "minimal" | "default" | "verbose" | "text"
--- @field diagnostics_icon_style "filled" | "outline"
--- @field git_gutter_style "bar" | "text"
--- @field lualine_separator_style "flat" | "sharp"
--- @field lualine_git_diff_style "icon" | "text"
--- @field nvimtree_modified_glyph "icon" | "text"

--- @alias Themes
---| 'catppuccin'
---| 'gruvbox'
---| 'tokyomoon'

local M = {}
return M
