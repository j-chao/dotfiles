# Powerline-shell
function _update_ps1() {
    PS1="$(/Users/jchao100/.powerline/powerline-shell/powerline-shell.py --cwd-mode=dironly $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# BASH prompt
export PS1="\u:\W $ "

# ALIAS
# ========================================================
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
    killall Finder /System/Library/CoreServices/Finder.app'

    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;
    killall Finder /System/Library/CoreServices/Finder.app'

    alias vimrc='vim ~/.vimrc'
    alias bashp='vim ~/.bash_profile'
    alias cdc='cd /Users/jchao100/Documents/cumulus'

# SSH
    alias dap='ssh bdpd-vm05-0.uhc.com'

    alias stampede='ssh juchao@stampede.tacc.utexas.edu'
    alias ls5='ssh juchao@ls5.tacc.utexas.edu'
    alias isp='ssh juchao@isp.tacc.utexas.edu'


# TERMINAL COLOR CONFIGS
# =================================================================
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
  

# iTERM 2 SHELL INTEGRATION
# =================================================================
    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
  

# HomeBrew Cask 
# Application install location
# =================================================================
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"


# AWS Completer
# =================================================================
    complete -C '/usr/local/bin/aws_completer' aws


# Path to AWS Elastic Beanstalk CLI
# =================================================================
    export PATH=/Users/jchao100/Library/Python/2.7/bin:$PATH
