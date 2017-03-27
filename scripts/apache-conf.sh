#!/bin/bash
#Author : Raghupathi Kammari

#FILE="/root/labs/vlabs-dev-pages/scripts/links-to-google-groups.txt"
APACHE_VHOST="/etc/apache2/sites-available/000-default.conf"

sudo sed -i '/DocumentRoot/r /root/labs/vlabs-dev-pages/scripts/links-to-google-groups.txt' $APACHE_VHOST
