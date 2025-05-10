return{
   "kevinm6/kurayami.nvim",
   event = "VimEnter",               -- load plugin on VimEnter or
   -- lazy = false,                  --   don't lazy load plugin
   priority = 1000,                  
   config = function()        
      vim.cmd.colorscheme('kurayami')   -- this is enough to initialize and load plugin
   end,
}
