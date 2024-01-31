#!/bin/bash
apt install net-tools
ufw default deny outgoing
ufw enable
ifconfig docker0 down
