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
    alias mysql-cpi-sdb='mysql -u jchao100 -h dbsrs1808 -D cpitooldb'


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
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
fco() {
  local tags branches target
  tags=$(
git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
git branch --all | grep -v HEAD |
sed "s/.* //" | sed "s#remotes/[^/]*/##" |
sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
(echo "$tags"; echo "$branches") |
    fzf --no-hscroll --no-multi --delimiter="\t" -n 2 \
        --ansi --preview="git log -200 --pretty=format:%s $(echo {+2..} |  sed 's/$/../' )" ) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}


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

# Path to Airflow Workspace
# =================================================================
    export AIRFLOW_HOME=/Users/jchao100/Documents/CPI/code/airflow

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
