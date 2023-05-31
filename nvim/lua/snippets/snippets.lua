return {
  "L3MON4D3/LuaSnip",
  version = "<CurrentMajor>.*",
  build = "make install_jsregexp",
  config = function()
    local common = require('snippets.common')
    local ls = common.ls;

    local typescript = require('snippets.typescript_snippets')

    ls.add_snippets('typescript', typescript)
  end
}
