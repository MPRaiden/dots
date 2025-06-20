-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "chadracula",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}


M.ui = {telescope = { style = "bordered" }}

-- M.ui = {
--   tabufline = {
--     enabled = false,  -- disables buffer/tabline UI
--   },
-- }


M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

if vim.g.neovide then
 vim.g.neovide_padding_top = 20
end

return M
