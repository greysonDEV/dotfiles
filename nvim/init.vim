source $HOME/.vimrc

lua << EOF
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "%.o",
            "%.dSYM",
            "%.png",
            "%.jpg",
            "%.pyc",
            "pycache",
            "./node%_modules"
        }
    }
}
EOF
