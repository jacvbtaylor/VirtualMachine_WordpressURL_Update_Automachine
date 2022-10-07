#!/bin/bash
#this script is used to update wordpress URL for CTF as a virtual machine in tryhackme  
#by @jacvbtaylor
#change enp0s3 to your appropiate network

sql_statement()
{
        ip4=$(/sbin/ip -o -4 addr list enp0s3 | awk '{print$4}' | cut -d/ -f1)
        echo "use wordpress"
        echo "UPDATE wp_options SET option_value=\"http://${ip4}/wordpress\" WHERE option_name = \"home\";"
        echo "UPDATE wp_options SET option_value=\"http://${ip4}/wordpress\" WHERE option_name = \"siteurl\";"
}

mysql -u root -ppassword wordpress < <(sql_statement)
