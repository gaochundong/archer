# 查看帮助

brew help bundle


# 导出列表

brew bundle dump --file=./Brewfile

默认参数下会导出vscode/go/cargo等其他应用的插件

brew bundle dump --file=./Brewfile --formula --cask --tap

如果文件已存在，则增加 -f 参数覆盖

brew bundle dump --file=./Brewfile --formula --cask --tap -f


# 安装列表

brew bundle --file=./Brewfile
