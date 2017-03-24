#!/bin/bash
#Author : Raghupathi Kammari

FILE="/root/labs/vlabs-dev-pages/scripts/apache.txt"
APACHE_VHOST="/etc/apache2/sites-available/000-default.conf"

sed -i "/</directory>/r $FILE' $APACHE_VHOST
