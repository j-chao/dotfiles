# Powerline-shell
# ========================================================
function _update_ps1() {
    PS1="$(/Users/jchao100/.powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh


# BASH prompt
# ========================================================
export PS1="\u:\W $ "


# ALIAS
# ========================================================
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
    killall Finder /System/Library/CoreServices/Finder.app'
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;
    killall Finder /System/Library/CoreServices/Finder.app'

    alias vimrc='vim ~/.vimrc'
    alias bashp='vim ~/.bash_profile'
    alias ga='git add .'
    alias gp='git push'
    alias mysql='mysql -u root'
    alias latexmk='latexmk -pdf -pvc'
    alias cdc='cd /Users/jchao100/Documents/cumulus'
    alias gos='cd /Users/jchao100/go/src/github.com/JCHAO/cumulus-website'

# SSH
    alias t_dev='ssh dbsls0306'
    alias stampede='ssh juchao@stampede.tacc.utexas.edu'
    alias ls5='ssh juchao@ls5.tacc.utexas.edu'
    alias isp='ssh juchao@isp.tacc.utexas.edu'


# TERMINAL COLOR CONFIGS
# =================================================================
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
  

# iTERM 2 SHELL INTEGRATION
# =================================================================
    test -e "${HOME}/.iterm2_shell_integration.bash" && \
        source "${HOME}/.iterm2_shell_integration.bash"
  

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


# Path to Go & Buffalo
# =================================================================
    export GOPATH=/Users/jchao100/go
    export PATH=/Users/jchao100/go/bin:$PATH


# Path to MySQL
# =================================================================
    export PATH=/usr/local/mysql/bin:$PATH


# JBOSS Config
# =================================================================
    #export JBOSS_HOME=/usr/local/opt/jboss-as/libexec
    export JBOSS_HOME=/Users/jchao100/EAP-7.0.0
    export PATH=${PATH}:${JBOSS_HOME}/bin
