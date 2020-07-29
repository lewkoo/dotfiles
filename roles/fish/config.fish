# Load thefuck
type -q fuck; and thefuck --alias | source 

# Set the theme preferences
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts no

# Set the default editor
export EDITOR='nano -w'

# Virtualenvwrapper
test -e {$HOME}/.local/bin/virtualenvwrapper.sh; and bass source {$HOME}/.local/bin/virtualenvwrapper.sh

# iter2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

