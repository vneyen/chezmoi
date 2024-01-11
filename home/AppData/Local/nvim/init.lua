-- ███    ██ ███████  ██████  ██    ██ ██ ███    ███ 
-- ████   ██ ██      ██    ██ ██    ██ ██ ████  ████ 
-- ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ 
-- ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ 
-- ██   ████ ███████  ██████    ████   ██ ██      ██ 

require "config.bootstrap"
-------------------------------------------------------------------------------
LAZY_PLUGINS_SPECS = {}
local lazyadd = function(spec)
   table.insert(LAZY_PLUGINS_SPECS, { import = spec })
end
lazyadd "config.plugins.which-key"
lazyadd "config.plugins.treesitter"
lazyadd "config.plugins.mason-lspconfig"
lazyadd "config.plugins.lspconfig"
lazyadd "config.plugins.cmp"
lazyadd "config.plugins.telescope"
lazyadd "config.plugins.devicons"
require "config.lazy"
