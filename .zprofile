# Store stuff like env variables or configuration flags here. Basically things that need to be
# set once or update infrequently live here

# Path stuff
export PATH="${HOME}/.local/bin"

# Set by homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# CLI Stuff
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enable threads to spawn threads
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
