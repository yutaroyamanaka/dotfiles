source ~/.git-completion.bash
source ~/.git-prompt.sh
export ANDROID_HOME=/Users/yutaro/Library/Android/sdk
PATH=${ANDROID_HOME}/platform-tools:${PATH}
PATH=${ANDROID_HOME}/ndk-bundle:${PATH}

alias ll="ls -la"
alias his="history"
alias k="kubectl"
function find_cd() {
    cd "$(find . -type d | peco)"  
}
alias fc="find_cd"

function peco-cd {
  local sw="1"
  while [ "$sw" != "0" ]
   do
		if [ "$sw" = "1" ];then
			local list=$(echo -e "---$PWD\n../\n$( ls -F | grep / )\n---Show hidden directory\n---Show files, $(echo $(ls -F | grep -v / ))\n---HOME DIRECTORY")
		elif [ "$sw" = "2" ];then
			local list=$(echo -e "---$PWD\n$( ls -a -F | grep / | sed 1d )\n---Hide hidden directory\n---Show files, $(echo $(ls -F | grep -v / ))\n---HOME DIRECTORY")
		else
			local list=$(echo -e "---BACK\n$( ls -F | grep -v / )")
		fi

		local slct=$(echo -e "$list" | peco )

		if [ "$slct" = "---$PWD" ];then
			local sw="0"
		elif [ "$slct" = "---Hide hidden directory" ];then
			local sw="1"
		elif [ "$slct" = "---Show hidden directory" ];then
			local sw="2"
		elif [ "$slct" = "---Show files, $(echo $(ls -F | grep -v / ))" ];then
			local sw=$(($sw+2))
		elif [ "$slct" = "---HOME DIRECTORY" ];then
			cd "$HOME"
		elif [[ "$slct" =~ / ]];then
			cd "$slct"
		elif [ "$slct" = "" ];then
			:
		else
			local sw=$(($sw-2))
		fi
   done
}
alias sd='peco-cd'

function ghql() {
  local selected_file=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
      pwd
    fi
  fi
}

bind -x '"\201": ghql'
bind '"\C-g":"\201\C-m"'

alias vim='nvim'
