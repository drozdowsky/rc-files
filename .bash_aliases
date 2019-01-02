# main aliases
alias a='sudo apt'
alias g='git'
alias v='vim'
alias sv='sudo vim'
alias mkd='mkdir -pv'
alias t='tmux'
alias p='python'


# clipboard pipe alias
alias clip='xsel -ib'
alias clips='xsel -i'  # selection clipboard


# googledrive
alias mgd='google-drive-ocamlfuse ~/google/drive'
alias umgd='fusermount -u ~/google/drive'


# work
alias cdrep='cd ~/rp/reporting-portal/'
alias cdreps='cd ~/rp/reporting-portal/src'


# CTRL+SHIFT+I to save the st's buffer to ss
alias ss='vim /tmp/stbuf'


# sudo apt install trans-shell
# translating english - italian
alias iten='trans -s it -t en'
alias enit='trans -s en -t it' 


# Find in path 
fip() {
	rg "$1" $pwd --line-number
}


# make dir and cd into it
mkcd ()
{
    mkdir -pv -- "$1" &&
    cd -P -- "$1"
}


extract() {
  clrstart="\033[1;34m"  #color codes
  clrend="\033[0m"

  if [[ "$#" -lt 1 ]]; then
    echo -e "${clrstart}Pass a filename. Optionally a destination folder. You can also append a v for verbose output.${clrend}"
    return 1 #not enough args
  fi

  if [[ ! -e "$1" ]]; then
    echo -e "${clrstart}File does not exist!${clrend}"
    return 2 #file not found
  fi

  if [[ -z "$2" ]]; then
    DESTDIR="." #set destdir to current dir
  elif [[ ! -d "$2" ]]; then
    echo -e -n "${clrstart}Destination folder doesn't exist or isnt a directory. Create? (y/n): ${clrend}"
    read response
    #echo -e "\n"
    if [[ $response == y || $response == Y ]]; then
      mkdir -p "$2"
      if [ $? -eq 0 ]; then
        DESTDIR="$2"
      else
        return 6 #Write perms error
      fi
    else
      echo -e "${clrstart}Closing.${clrend}"; return 3 # n/wrong response
    fi
  else
    DESTDIR="$2"
  fi

  if [[ ! -z "$3" ]]; then
    if [[ "$3" != "v" ]]; then
      echo -e "${clrstart}Wrong argument $3 !${clrend}"
      return 4 #wrong arg 3
    fi
  fi

  filename=`basename "$1"`

  #echo "${filename##*.}" debug

  case "${filename##*.}" in
    tar)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (uncompressed tar)${clrend}"
      tar x${3}f "$1" -C "$DESTDIR"
      ;;
    gz)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
      tar x${3}fz "$1" -C "$DESTDIR"
      ;;
    tgz)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
      tar x${3}fz "$1" -C "$DESTDIR"
      ;;
    xz)
      echo -e "${clrstart}Extracting  $1 to $DESTDIR: (gip compressed tar)${clrend}"
      tar x${3}f -J "$1" -C "$DESTDIR"
      ;;
    bz2)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (bzip compressed tar)${clrend}"
      tar x${3}fj "$1" -C "$DESTDIR"
      ;;
    zip)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (zipp compressed file)${clrend}"
      unzip "$1" -d "$DESTDIR"
      ;;
    rar)
      echo -e "${clrstart}Extracting $1 to $DESTDIR: (rar compressed file)${clrend}"
      unrar x "$1" "$DESTDIR"
      ;;
    7z)
      echo -e  "${clrstart}Extracting $1 to $DESTDIR: (7zip compressed file)${clrend}"
      7za e "$1" -o"$DESTDIR"
      ;;
    *)
      echo -e "${clrstart}Unknown archieve format!"
      return 5
      ;;
  esac
}


compress() {
  if [[ -n "$1" ]]; then
    FILE=$1
    case $FILE in
    *.tar ) shift && tar cf $FILE $* ;;
*.tar.bz2 ) shift && tar cjf $FILE $* ;;
 *.tar.gz ) shift && tar czf $FILE $* ;;
    *.tgz ) shift && tar czf $FILE $* ;;
    *.zip ) shift && zip $FILE $* ;;
    *.rar ) shift && rar $FILE $* ;;
    esac
  else
    echo "usage: compress <foo.tar.gz> ./foo ./bar"
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
