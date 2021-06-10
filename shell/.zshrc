# ==================================================
# 
# .zshrc (Greyson Murray)
#
# ==================================================


# --------------------------------------------------
# Aliases
# --------------------------------------------------
# make tree ignore certain folders by default
alias tree="tree -I __pycache__"

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

# apps
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias spotify="open -a Spotify"

# blender must be opened from terminal for add-on development
alias blender="/Applications/Blender.app/Contents/MacOS/Blender"


# --------------------------------------------------
# Scripts
# --------------------------------------------------
# prints $PATH in human-readable way
function path {
    printf "%s\n" $path
}

# compiling and running .java file
function javar {
  javac "$@".java
  java "$@"
}

# enforcing .gitignore file
function fixgitignore {
	git add .
	git commit -m "prepare .gitignore enforcement"
	git rm -r --cached .
	git add .
	git reset -- .gitignore
	git commit -m "enforcing .gitignore"
	git push origin main
}


# --------------------------------------------------
# Prompt Customization
# --------------------------------------------------
PROMPT='%F{106}%B%n%b%f %F{015}%3~%f %F{015}%B$%b%f '
RPROMPT='%F{015}%*%f'
