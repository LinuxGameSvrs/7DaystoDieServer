#! /bin/bash
# Updates system and installs dependencies
sudo dpkg --add-architecture i386
sudo apt update && sudo apt upgrade -y && sudo apt install lib32gcc1 ufw steamcmd -y
# Declare a variable for the account signed in currently
mylogin=$(users)
# Creates service to start on boot
sudo touch /lib/systemd/system/7days.service
sudo echo -e '[Unit]' > /lib/systemd/system/7days.service
sudo echo -e 'Description=7 Days to Die' >> /lib/systemd/system/7days.service
sudo echo -e 'After=network.target nss-lookup.target\n' >> /lib/systemd/system/7days.service
sudo echo -e '[Service]' >> /lib/systemd/system/7days.service
sudo echo -e 'Type=simple' >> /lib/systemd/system/7days.service
sudo echo -e 'PIDFile=/run/7dtd.pid' >> /lib/systemd/system/7days.service
sudo echo -e 'Restart=on-failure' >> /lib/systemd/system/7days.service
sudo echo -e 'RestartSec=5' >> /lib/systemd/system/7days.service
sudo echo -e 'StartLimitInterval=60s' >> /lib/systemd/system/7days.service
sudo echo -e 'StartLimitBurst=3' >> /lib/systemd/system/7days.service
sudo echo -e "User=$mylogin" >> /lib/systemd/system/7days.service
sudo echo -e "Group=$mylogin" >> /lib/systemd/system/7days.service
sudo echo -e "ExecStartPre=/home/$mylogin/steamcmd +login anonymous +force_install_dir /home/$mylogin/server +app_update 294420 +quit" >> /lib/systemd/system/7days.service
sudo echo -e "ExecStart=/home/$mylogin/server/startserver.sh -configfile=/home/$mylogin/server/serverconfig.xml" >> /lib/systemd/system/7days.service
sudo echo -e 'ExecReload=/bin/kill -s HUP $MAINPID' >> /lib/systemd/system/7days.service
sudo echo -e 'ExecStop=/bin/kill -s QUIT $MAINPID' >> /lib/systemd/system/7days.service
sudo echo -e 'TimeoutSec=900\n' >> /lib/systemd/system/7days.service
sudo echo -e '[Install]' >> /lib/systemd/system/7days.service
sudo echo -e 'WantedBy=multi-user.target' >> /lib/systemd/system/7days.service
# Create symbolic link to steamcmd
ln -s /usr/games/steamcmd /home/$mylogin/steamcmd
# Configure Firewall
# If you change the default server ports in the config file, you need to change these ports 
sudo ufw allow 26900
sudo ufw enable
# Enable the service to start on boot
sudo systemctl enable 7days.service
# Make sure everything in your home directory is owned and grouped for that user
sudo chown $mylogin:$mylogin -R /home/$mylogin
# Initial startup of steam and 7 Days to Die server install
/home/$mylogin/steamcmd +login anonymous +force_install_dir /home/$mylogin/server +app_update 294420 +quit