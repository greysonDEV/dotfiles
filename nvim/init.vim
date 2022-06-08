source $HOME/.vimrc

lua << EOF
require('telescope').setup{
    defaults = {
        preview = false,
        layout_strategy = 'vertical',
        layout_config = { height = 0.8, width = 0.4 },
        file_ignore_patterns = {
            "%.o",
            "%.woff",
            "%.woff2",
            "%.dSYM",
            "%.ico",
            "%.png",
            "%.jpeg",
            "%.jpg",
            "%.pyc",
            "pycache",
            "node_modules/.*"
        }
    },
    pickers = {
        find_files = {
            prompt_prefix = '  ',
        }
    }
}
EOF
