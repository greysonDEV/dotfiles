source $HOME/.vimrc

lua << EOF
require('telescope').setup{
    defaults = {
        preview = false,
        file_ignore_patterns = {
            "%.o",
            "%.dSYM",
            "%.png",
            "%.jpg",
            "%.pyc",
            "pycache",
            "node_modules/.*"
        }
    }
}
EOF
