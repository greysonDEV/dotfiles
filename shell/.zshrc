# ==================================================
# 
# .zshrc (Greyson Murray)
#
# ==================================================


# --------------------------------------------------
# Aliases
# --------------------------------------------------
# make tree ignore certain folders by default
# alias tree="tree -I __pycache__"

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

# apps
alias spotify="open -a Spotify"

# blender must be opened from terminal for add-on development
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"

# alias tree to go through ignoretree first
alias tree="ignoretree"


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
    command tree -I $PATTERNS $@
}

# prints $PATH in human-readable way
function path {
    printf "%s\n" $path
}

# compiling and running .java file
function javar {
  javac "$@".java
  java "$@"
}


# --------------------------------------------------
# Prompt Customization
# --------------------------------------------------
PROMPT='%F{106}%B%n%b%f %F{015}%3~%f %F{015}%B$%b%f '
