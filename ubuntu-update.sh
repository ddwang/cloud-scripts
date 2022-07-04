#!/bin/sh

sudo apt update
sudo apt -y full-upgrade
sudo apt -y autoremove
sudo apt -y autoclean