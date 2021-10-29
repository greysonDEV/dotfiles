# ==================================================
# 
# .zshrc (Greyson Murray)
#
# ==================================================


# --------------------------------------------------
# Configurations
# --------------------------------------------------


# --------------------------------------------------
# Aliases
# --------------------------------------------------
# make tree ignore certain folders by default
# alias tree="tree -I __pycache__"

# vim
alias vim="nvim"

# configuring and sourcing .zshrc file
alias cfg="vim ~/.zshrc"
alias src="source ~/.zshrc"

# git
alias gs="git status"
alias ga="git add"
alias gall="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpom="git push origin main"
alias gb="git branch"
alias grs="git restore --staged"
alias gd="git diff"

# Make
alias remake="make clean && make"

# apps
alias spotify="open -a Spotify"

# blender must be opened from terminal for add-on development
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"

# force tree to go through ignoretree first
alias tree="ignoretree"

# Django runserver
alias runserver="python3.9 manage.py runserver"


# --------------------------------------------------
# Scripts
# --------------------------------------------------
# ignores files/dirs listed in .treeignore for tree command
function ignoretree() {
    for arg in $@
    do
        if [ $arg = "-I" ]
        then
            command tree $@
            return
        fi
    done

    PATTERNS=$(paste -d "|" -s ~/.treeignore)  
    # -a flag shows hidden files (dotfiles, etc.)
    command tree -a -I $PATTERNS $@
}

# prints $PATH in human-readable way
function path {
    printf "%s\n" $path
}

fignore=(.o .out)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# --------------------------------------------------
# Prompt Customization
# --------------------------------------------------
# PROMPT='%F{247}%B%n%b%f %3~ $ '
export PS1='%{%B%F{green}%}%n%b%{%f%}%{%F{white}%}@%{%f%}%{%B%F{green}%}%m %b%{%F{cyan}%}%3~ %{%f%}%% '
