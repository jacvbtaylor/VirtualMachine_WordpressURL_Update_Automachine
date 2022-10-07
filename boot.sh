#this script is used in a cronjob
#to start wordpress, mariadb, and ssh 
service ssh start && service mariadb start && service apache2 start
