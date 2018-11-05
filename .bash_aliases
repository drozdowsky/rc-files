alias mgd='google-drive-ocamlfuse ~/googledrive'
alias umgd='fusermount -u ~/googledrive'

alias a='sudo apt'
alias g='git'
alias v='vim'
alias sv='sudo vim'
alias mkd='mkdir -pv'
alias hcat='highlight --force --line-numbers'
alias iten='trans -s it -t en'
alias enit='trans -s en -t it' 

fip() {
	grep -r "$1" $pwd
}

mkcd ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}


extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}


