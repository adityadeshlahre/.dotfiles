# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# node npm fix
set -gx NPM_PACKAGES "$HOME/.npm-packages"

set -gx PATH $PATH $NPM_PACKAGES/bin

set -gx MANPATH $NPM_PACKAGES/share/man $MANPATH

set -gx NVM_DIR $HOME/.nvm

if test -s $NVM_DIR/nvm.sh
    bass source $NVM_DIR/nvm.sh
end

if test -s $NVM_DIR/bash_completion
    bass source $NVM_DIR/bash_completion
end

# Automatically use default node version
if type -q nvm
    nvm use latest >/dev/null
end

# rubyenv
status --is-interactive; and source (rbenv init -|psub)

# pyenv path
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths


# pnpm
set -gx PNPM_HOME "/home/cluz/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# android-dev-start
# set -Ux ANDROID_HOME $HOME/Android/Sdk
# set -Ux ANDROID_SDK_ROOT $ANDROID_HOME
# if not string match -q -- $ANDROID_HOME/tools $PATH
    # set -gx PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
# end
# android-dev-stop

# vim runtime
set -Ux VIMRUNTIME /usr/share/nvim/runtime
# vim runtime

# GO
set -Ux GOPATH $HOME/go
# set -Ux PATH $PATH $GOPATH/bin

# Add GOPATH bin to PATH
set -U fish_user_paths $GOPATH/bin $fish_user_paths

# gvm path

function gvm
    bash -c "source ~/.gvm/scripts/gvm && gvm $argv"
end

# bass source ~/.gvm/scripts/gvm


# set -Ux GVMPATH $HOME/.gvm/bin $GVMPATH
# status --is-interactive; and source $HOME/.gvm/scripts/gvm

# gvm path end

# Start ssh-agent if not already running
# if not set -q SSH_AUTH_SOCK
#     eval (ssh-agent -c)
#     ssh-add ~/.ssh/id_aditya_clinikally > /dev/null
# end
