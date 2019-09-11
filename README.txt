# Ubuntu 18.04.03 Server Install
# You must have at least 20 GB of disk space for this system and 4GB of RAM

1. Choose Language

2. Choose Keyboard

3a. Highlight your Network Interface and press the Enter button
3b. Select "Edit IPv4" and press the Enter button
3c. Select "Manual" and fill in your desired computer information
(Alternatively, you can set this to DHCP and create a DHCP reservation on your router once this system receives an IP address. To find your IP, type "ifconfig" inside of the server)

4. Skip the proxy address page unless you use a proxy

5. Skip the Mirror Address Page

6. Select "Use An Entire Disk"

7. Choose your disk (Warning, this will erase all data on that disk)

8. Finish the install

9a. Your name:			Anything you want
9b. Your server's name: 	Anything you want
9c. Pick a username:		Anything you want
9d. Choose a password: 		Anything you want
9e. Confirm your password:	Same as above

10a. Skip Openssh Server if you have no need to remotely manage the system
10b. If enabled, run the command "sudo ufw allow 22" after running the script

11. Skip Featured Snaps

12. Wait for server to complete installation and select "Reboot"

13. Remove Server media and press the Enter button

14. Log into the server

15a. Run the following commands:
15b. git clone git://github.com/LinuxGameSvrs/7DaystoDieServer.git
15c. cd 7DaystoDieServer
15d. sudo chmod +x 7DaysServer_Stable.sh     or    sudo chmod +x 7DaysServer_LatestExperimental.sh
15e. sudo ./7DaysServer_Stable.sh
15f. You will be prompted to accept the user license agreement when installing SteamCMD

16. Edit the serverconfig.xml 
 After running this script, you are going to want to edit the serverconfig.xml file in /home/YOURUSERNAME/server/ directory. 
 Use "nano /home/YOURUSERNAME/server/serverconfig.xml" to navigate through the file.
 Here are some common parts to change
 
 ServerName 				value="The name of the server to the rest of the world"
 ServerMaxPlayerCount			value="12"
 TelnetEnabled				value="false"
 GameWorld				value="RWG"
 WorldGenSeed				value="random mix of letters and numbers"  <- change this if you start a new server but dont want to overwrite the old one
 WorldgenSize				value="number between 2048 and 16384"
 GameName				value="the name of the world save file in /home/YOURUSERNAME/.local/share/7DaysToDie/GeneratedWorlds" 
 GameDifficulty				value="number between 1 and 5"
 AirDropMarker				value="true"
 
 17a. Reboot the server with the following command:
 17b.	reboot
 
 18a. If you want to shutdown the server, use this command:
 18b.	sudo shutdown 15
 
 19. If you want this server to be available to the public, you must forward port 26900 from your router to the server IP address in your local network
 


