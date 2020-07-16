# PyEnv
set PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

set -g fish_user_paths "$HOME/.poetry/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
