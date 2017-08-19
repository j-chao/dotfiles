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
    alias gs='git status'
    alias ga='git add .'
    alias gcm="git commit -m '"
    alias gp='git push'
    alias latexmk='latexmk -pdf -pvc'
    alias cpi='cd /Users/jchao100/Documents/CPI/code'
    alias gos='cd /Users/jchao100/go/src/github.com/JCHAO/cumulus-website'

# SSH
    alias lake-d='ssh dbsls0306'

# MySQL

    alias mysql='mysql -u root'
    alias mysql-pathway='mysql -u ptrd_own -h 10.86.244.56 -D ptrd01 -pNuN3TV3U'
    alias mysql-cpi-dmid='mysql -u jchao100 -h dbsrd2653 -D ocpm01'
    alias mysql-cpi-ddb='mysql -u jchao100 -h DBSRD2683 -D cpitooldb'
    alias mysql-cpi-tmid='mysql -u jchao100 -h dbsrt1100 -D ocpm01'
    alias mysql-cpi-tdb='mysql -u jchao100 -h dbsrt1139 -D cpitooldb'


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


# Custom scripts
# =================================================================
    export PATH=/Users/jchao100/bin:$PATH


# FZF
# =================================================================
    alias fzf="fzf --preview 'head -100 {}'"


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
    #export JBOSS_HOME=/Users/jchao100/EAP-7.0.0
    export JBOSS_HOME=/Users/jchao100/EAP-6.4.0
    export EAP_HOME=/Users/jchao100/EAP-6.4.0
    export PATH=${PATH}:${JBOSS_HOME}/bin


# Java 
# =================================================================
 export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
 setjdk() {
     export JAVA_HOME=$(/usr/libexec/java_home -v $1)
 }
 export PATH=${JAVA_HOME}/bin:$PATH
