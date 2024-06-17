#!/usr/bin/env bash

os=$(uname)
dir="$(pwd)/$(uname)"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

attn() {
    for i in $(seq "$1" -1 1); do
        printf "\r%s (%d) " "$2" "$i"
        sleep 0.5
        printf '\r\e[0m%s (%d) ' "$3" "$i"
        sleep 0.5
    done
    printf '\r\e[0m%s (0)\n' "$3"
}

do_something() {
    "$dir"/sshpass -p 'alpine' ssh -o StrictHostKeyChecking=no -p2222 root@localhost 'rm -rf /mnt4/Applications/Setup.app'
}

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}
attn 2 "${RED}[*] 警告" "[*] 警告"
attn 2 "${RED}[*] 如果你现在启动，你会被卡在 \"屏幕时间\" 这个设置步骤这里" "[*] 如果你现在启动，你会被卡在 \"屏幕时间\" 这个设置步骤这里"
attn 2 "${RED}[*] 如果你想使用iOS $1 ,您必须删除Setup.app " "[*] 如果你想使用iOS $1 ,您必须删除Setup.app"
attn 2 "${RED}[*] 查看 https://files.catbox.moe/96vhbl.mov 视频教程如何解决问题" "[*] 查看 https://files.catbox.moe/96vhbl.mov 视频教程如何解决问题"
echo "${BLINK}[*] 只有当您的设备存在激活文件activation_records时，您才会看到此消息${NORMAL}"
yes_or_no "是否删除Setup.app?" && do_something
