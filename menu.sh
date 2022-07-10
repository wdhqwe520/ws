#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="diyglobe"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear

if [[ "$IP" = "" ]]; then
    domain=$(cat /usr/local/etc/xray/domain)
else
    domain=$IP
fi
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
CITY=$(curl -s ipinfo.io/city)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipinfo.io/ip)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
swap=$(free -m | awk 'NR==4 {print $2}')
clear
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# Order ID
rm -f /usr/bin/ver
user=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $3}')
echo "$user" >/usr/bin/ver
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
 
total_xray=$(($c_xtls + $c_xvmess + $c_xvless ))
total_v2ray=$(($c_vmess + $c_vless))
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"p

# usage
vnstat -i eth0 >/root/t1
bulan=$(date +%b)
todayd=$(vnstat -i eth0 | grep today | awk '{print $8}')
today_v=$(vnstat -i eth0 | grep today | awk '{print $9}')
today_rx=$(vnstat -i eth0 | grep today | awk '{print $2}')
today_rxv=$(vnstat -i eth0 | grep today | awk '{print $3}')
today_tx=$(vnstat -i eth0 | grep today | awk '{print $5}')
today_txv=$(vnstat -i eth0 | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
    bulan=$(date +%b)
    month=$(vnstat -i eth0 | grep "$bulan " | awk '{print $9}')
    month_v=$(vnstat -i eth0 | grep "$bulan " | awk '{print $10}')
    month_rx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $3}')
    month_rxv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $4}')
    month_tx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $6}')
    month_txv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $7}')
else
    bulan=$(date +%Y-%m)
    month=$(vnstat -i eth0 | grep "$bulan " | awk '{print $8}')
    month_v=$(vnstat -i eth0 | grep "$bulan " | awk '{print $9}')
    month_rx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $2}')
    month_rxv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $3}')
    month_tx=$(vnstat -i eth0 | grep "$bulan " | awk '{print $5}')
    month_txv=$(vnstat -i eth0 | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
    yesterday=$(vnstat -i eth0 | grep yesterday | awk '{print $8}')
    yesterday_v=$(vnstat -i eth0 | grep yesterday | awk '{print $9}')
    yesterday_rx=$(vnstat -i eth0 | grep yesterday | awk '{print $2}')
    yesterday_rxv=$(vnstat -i eth0 | grep yesterday | awk '{print $3}')
    yesterday_tx=$(vnstat -i eth0 | grep yesterday | awk '{print $5}')
    yesterday_txv=$(vnstat -i eth0 | grep yesterday | awk '{print $6}')
else
    yesterday=NULL
    yesterday_v=NULL
    yesterday_rx=NULL
    yesterday_rxv=NULL
    yesterday_tx=NULL
    yesterday_txv=NULL
fi

# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Active)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
echo -e "\e[$banner_colour"
figlet -f $ascii "$banner"
echo -e "\e[$text Premium Script"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                    \e[30m[\e[$box SERVER INFORMATION\e[30m ]\e[1m                  \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$text Cpu Model            : $cname"
echo -e "  \e[$text Number Of Core       : $cores"
echo -e "  \e[$text Cpu Frequency        : $freq MHz"
echo -e "  \e[$text Total Amount Of Ram  : $tram MB"
echo -e "  \e[$text System Uptime        : $uptime"
echo -e "  \e[$text Isp/Provider Name    : $ISP"
echo -e "  \e[$text City Location        : $CITY"
echo -e "  \e[$text Time Location        : $WKT"
echo -e "  \e[$text Ip Vps/Address       : $IPVPS"
echo -e "  \e[$text Domain Name          : $domain\e[0m"
echo -e "  \e[$text Version Name         : V1(Websocket)"
echo -e "  \e[$text Client Name          : $username"
echo -e "  \e[$text Order ID             : $oid"
echo -e "  \e[$text Expired Status       : $exp $sts"
echo -e "  \e[$text Certificate Status   : Expired in $certifacate days"
echo -e "  \e[$text Provided By          : $creditt"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[${back_text}\e[30m[\e[${box}TRAFFIC           TODAY          YESTERDAY          MONTH  \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " UPLOAD       $today_tx $today_txv             $yesterday_tx $yesterday_txv       $month_tx $month_txv"
echo -e " DOWNLOAD     $today_rx $today_rxv             $yesterday_rx $yesterday_rxv       $month_rx $month_rxv"
echo -e " TOTAL        $todayd $today_v            $yesterday $yesterday_v        $month $month_v"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[${back_text}\e[30m[\e[${box}TOTAL USER           XRAY            V2RAY             SSH/OVPN
echo -e "                            $total_xray                         $total_v2ray                              $total_ssh"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e " \e[$back_text                       \e[30m[\e[$box MAIN MENU\e[30m ]\e[1m                        \e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$number (•1)\e[m \e[$below XRAY VMESS & VLESS\e[m              \e[$number (•7)\e[m \e[$below MENU THEMES\e[m"
echo -e "  \e[$number (•2)\e[m \e[$below TROJAN XRAY & GO\e[m                \e[$number (•8)\e[m \e[$below CLEAR LOG VPS\e[m"
echo -e "  \e[$number (•3)\e[m \e[$below PANEL WIREGUARDS\e[m                \e[$number (•9)\e[m \e[$below CHANGE PORT\e[m"
echo -e "  \e[$number (•4)\e[m \e[$below PANEL SHADOWSOCKS\e[m               \e[$number (10)\e[m \e[$below CHECK RUNNING\e[m"
echo -e "  \e[$number (•5)\e[m \e[$below OPENSSH & OPENVPN\e[m               \e[$number (11)\e[m \e[$below REBOOT VPS\e[m"
echo -e "  \e[$number (•6)\e[m \e[$below SYSTEM MENU\e[m                     \e[$number (12)\e[m \e[$below INFO ALL PORT\e[m"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e "  \e[$below Premium VPS by $creditt"
echo -e "  \e[$below Thank you for using script by @NORULEZZx"
echo -e " \e[$line════════════════════════════════════════════════════════════\e[m"
echo -e ""
echo -e "  \e[$below [Ctrl + C] For exit from main menu\e[m"
echo -e "\e[$below "
read -p "   Select From Options [1-12 or x] :  " menu
echo -e ""
case $menu in
1)
    xraay
    ;;
2)
    trojaan
    ;;
3)
    wgr
    ;;
4)
    ssssr
    ;;
5)
    ssh
    ;;
6)
    system
    ;;
7)
    themes
    ;;
8)
    clear-log
    ;;
9)
    change-port
    ;;
10)
    check-sc
    ;;
11)
    reboot
    ;;
12)
    info
    ;;
x)
    clear
    exit
    echo -e "\e[1;31mPlease Type menu For More Option, Thank You\e[0m"
    ;;
*)
    clear
    echo -e "\e[1;31mPlease enter an correct number\e[0m"
    sleep 1
    menu
    ;;
esac
