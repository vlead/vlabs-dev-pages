#!/bin/bash
#Author : Raghupathi Kammari

rm -rf /etc/apache2/sites-available/000-default.conf
cp /root/labs/vlabs-dev-pages/scripts/000-default.conf /etc/apache2/sites-available/
