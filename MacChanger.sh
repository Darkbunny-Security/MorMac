#!bin/bash
#
# Code by: CØÐ'A®C; Agent-2k40
#
# DarkBunny

Draw(){
		clear;
        echo "===================================================="
        echo "»»»»»»»»»»»»»»»»»»»»»» MorMac ««««««««««««««««««««««"
        echo "===================================================="
        echo ""
        echo "----------------------------------------------------"
        echo " _ _ "
        echo "(˘©˘) Changing your Mac, your security been better"
        echo ""
        echo '"DarkBunny, ever close of you."'
        echo "----------------------------------------------------"
        echo ""
}

Interface(){
        read -p "[+] Use interface: " interface; echo "";
}

Clock(){
		read -p "[+] Time between changes: " Times; echo "";
}

Repeat(){
		read -p "[+] Repeat x times, insert x: " X; echo "";
}

# continue until $n equals x times
n=1
Loop(){
        while [ $n -le $X ]; do

        		Draw;

                echo "[*] Trying → "$n
                echo ""
                echo "[!] Network Down >>>>>>>>>>>>>>>>>>>>>>>>>>>>"
                echo ""


                # Stop service network
                sudo service network-manager stop

                if ! /sbin/iwconfig "up"
                then
                        echo "[!] Service of network: Stop"; echo ""
                else
                        echo "[!] Service of network: Run error"; echo ""
                fi

                sudo macchanger -r $interface

                echo ""

                #Run service network
                sudo service network-manager start

                if ! /sbin/iwconfig "down"
                then
                        echo "[!] Service of network: Run"
                else
                        echo "[!] Service of network: Stop error"
                fi

                echo "[!] Network Up >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
                sleep $Times && clear

                n=$(( n+1 )) # increments $n
        done
}

MacChanger(){
        Draw; Interface; Clock; Repeat; Loop;
}

End(){
        Draw; echo "[-] Finalizando"; sleep 2; clear; clear; exit;
}

#__________________________________
MacChanger; End;
#__________________________________

