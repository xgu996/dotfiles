return {
  -- 安装 project.nvim 插件
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup({
        -- 配置 project.nvim 的选项
        detection_methods = { "pattern" },  -- 自动检测项目根目录的方法
        patterns = { ".git", "Makefile", "package.json", "setup.py", ".env" },  -- 识别项目根目录的文件或文件夹
        -- 可选的其他设置
        show_hidden = true,                 -- 显示隐藏文件
        silent_chdir = true,                -- 自动切换目录时不显示消息
        manual_mode = false,                -- 如果为 true，不会自动切换目录，需手动调用
      })

      -- 将项目目录自动设置为工作目录
      require('telescope').load_extension('projects')
    end
  },
}
