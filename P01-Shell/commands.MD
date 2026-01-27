Linux

ec2-user
DevOp321

ssh-keygen -f <keyname> # to generate the key

<key.pem> private key
<key.pub> public ley

ssh -i <key.pem> user@ip or hostname # to login into the server

```shell

pwd # show current directory

ls 
ls -l # list files
ls -lt # with time stamp
ls -ltr # time stamp and reverse order
ls -lr # reverse order
ls -la # shows hidden files
ls --help # command usgae

cat > <filename> write content then ctrl+D
cat >> <filename> write content without rewrite then ctrl+D
cat <filename> # read text

mv <old-file-name> <new-file-name> # rename file or to move file to another directory
mv <source-file-name> <directory-name> # moves source file to destination directory

cp <source-file> <destination-file> # copy file content to new another file

grep <word-to-find> <file-name> # to see specific word
grep -i <word-to-search> <file-name> # to search for a word regardless of case (case-insensitive)
# linux is case sensitive Devopsand devops are not same

wget <url-to-download> # to download file

curl <url-to-download> # to show the text on terminal and to run scripts
ex:- curl -sL https://example.com/path/to/script.sh | bash
     
| # pipe is used to send output to next command

ex:- echo https://raw.githubusercontent.com/daws-81s/notes/refs/heads/main/session-01.txt | cut -d "/" -f1

awk -F "/" '{print $1F}'

ex:- echo https://raw.githubusercontent.com/daws-81s/notes/refs/heads/main/session-01.txt | awk -F "/" '{print $1F}'

awk -F ":" '{print $1F}' # to print the first fragments in all columns
awk -F ":" '{print $1F,$3F}'

cat filename.txt | awk '{print $3}' | grep "error"


head <file-name> # first 10 lines
head -n 5 <file-name> first 5 lines
tail <file-name> # last 10 lines
tail -n 5 <file-name> # last 5 lines
cat <file-name> | head -n 10 | tail -n 5 # if we want to get middle lines
tail -f /var/log/messages # to see running logs of servers

:%d delete everything
:1d delete first lin
:s/which word/what you want # to replaces the word where your cursor is and only first occurance
:s/which word/what you want/g # to replaces the word where your cursor is and all occurance in that line
:3s/sbin/SBIN # to replace in particular line
:%s/sbin/SBIN/g # to replace all occurances in all lines in file

ESC mode
u # to undo the changes
shift+g # goes to bottom
gg goes to top
yy to copy
p to paste
10p it pastes 10 times
dd to delete the line

INSERT mode
to insert


drwxr-xr-x 2 ec2-user ec2-user   61 Dec  4 04:44 dir3 # dierectory
-rw-r--r-- 1 ec2-user ec2-user 1124 Dec  4 04:41 passwd # file

rw- # owner
r-- # group
r-- # others

r 4 Read
w 2 Write
x 1 Execute

when you dont assign group to user his group name will be same as his user name

chmod o+rwx <file-name>
chmod o-rwx <file-name>
chmod ugo+rwx <file-name>
chmod 777 <file-name>

# User management

useradd <user-name> # to add new user
ex:- useradd ramesh

id # info about current logged in user

id <user-name> # display about user
ex:- id ramesh

passwd <user-name> #    to setup password
ex:-passwd ramesh  #then it prompts to enter password

groupadd <group-name>
ex:-groupadd devops # to create new group

chgrp group1 file.txt # Changes the group of file.txt to group1

chgrp -R group1 /path/to/directory # Changes the group ownership of all files and subdirectories under the specified directory.

usermod -g <group-name> <user-name>
ex:- usermod -g devops ramesh # to add user to primary group

usermod -aG <group-name> <user-name>
ex:- usermod -g testing ramesh # to add user to secondary group

gpasswd -d <user-name> <group-name>
ex:- gpasswd -d ramesh testing # to remove user from group

we cannot remove users primary group so when we want delete user first we have to add he hiself to primary group then delete

userdel <user-name>
ex:-userdel ramesh # to delete user

groupdel <group-name>
ex:- groupdel testing # to delete group

grep -i <username> /etc/passwd # to see specific user details


vim /etc/ssh/sshd_config # sshd config file where we can edit authentication types

/home/ec2-user/.ssh/authorized_keys # authorized keys for users to authenticate
/home/root/.ssh/authorized_keys
/home/suresh/.ssh/authorized_keys

chown -R <user-name>:<group-name> <file-name>
ex:- chown -R ramesh:ramesh .ssh # to change the ownership of files or directory

chown user1 file.txt # to change the ownership of file

cat /proc/cpuinfo # checks cpu info
cat /proc/meminfo # checks memory info
cat /etc/os-release # checks Os type

ps
ps -ef # to see all the running processes "-e" means all "f" means full formate
ps -ef | grep nginx # to see the process related to nginx

sleep 100 # sleeps for 100 seconds in foreground
sleep 100 & # sleeps for 100 seconds in background
ps -ef | grep sleep

top 
#The top command is a real-time system monitoring tool in Linux that displays a        continuously updating view of processes, CPU usage, memory consumption, load average, and other system metrics, helping administrators quickly identify resource-intensive processes; it allows interactive actions like killing processes, sorting by CPU or memory, and filtering tasks, making it essential for diagnosing performance issues and observing how the system behaves over time.

kill <PID> # to kill process use this command with process instance id PID
kill -9 <PID> # to force kill

troubleshooting steps
--------------------

netstat -lntp # to check which ports opened

less /var/log/messages
tail -f /var/log/messages # -f means its following the logs
shift+g # to go up and gg to go down

ping <ip-host> 
# The ping command is a network diagnostic tool used to test connectivity between your machine and another host by sending ICMP echo requests and measuring how long it takes to receive replies, helping you verify if a device is reachable, check network latency, detect packet loss, and identify potential network issues such as high delay or disconnection.


telnet <ip> <port>
telnet 172.31.20.70 3306
# telnet is a command-line tool and protocol used to connect to remote systems over TCP, typically on port 23, allowing you to open an interactive text-based session with a server; although it can be used for basic remote login or testing open ports and network connectivity, it is largely considered insecure because it sends all data—including passwords—in plain text, so modern systems prefer SSH for secure access while still using Telnet mainly for troubleshooting or connecting to devices that only support it.

DNS resolver

nslookup <url> # to check the ip address of website
ex:- nslookup facebook.com

free -m # to check the ram

df -hT # disk space in human readable

cat /etc/nginx/nginx.conf

umask # can set default permission

ln file.txt hardlink.txt # Both file.txt and hardlink.txt now refer to the same data.

ln -s /path/to/file.txt symlink.txt # Creates symlink.txt as a shortcut to /path/to/file.txt

scp < path/to/loclfile > < username@remoteip:path/to/remote/destination > # to copy files from local to remote

scp < username@remoteip:path/to/remote/file > < path/to/local/destination > # to copy files from remote to local

rsync # rsync is used for copying and synchronizing files/directories efficiently between locations
rsync -e "ssh -i pemfile" -avz path/to/local/folder remoteuser@remoteip:path/in/remote
rsync -avz /local/path user@remote:/remote/path

nano
vim
less 
# The less command is used to view the content of a file or output in a terminal one screen at a time, making it ideal for reading large files. Unlike cat, it doesn't load the whole file into memory.
head 
# veiw first few lines of file
tail 
# veiw last few lines
ps -ef | grep sbin 
# The grep command is used to search for specific patterns (text or regular expressions) in files or command outputs. It’s a powerful tool for filtering and finding text in Linux.

find /path/to/search -name "filename"
find /path/to/search -iname "filename" # to find with case sensitive
find /path/to/search -type d -name "dirname" #to find directory
find /path/to/search -name "*.txt" #to find with extensions

***file compression***

tar -cvf archive.tar file1 file2  #to create tar file
tar -xvf archive.tar # to extract
tar -czvf archive.tar.gz folder # to create gziped tar archive folder
tar -xzvf archive.tar.gz #to extract

gunzip file.gz #decompress the file
gunzip -c file.gz > file #decompress and keep original

zip archive.zip file1 file2 #to zip files
zip -r archive.zip directory #to zip directory
zip archive.zip newfile #add files to existing archive

unzip #The unzip command is used to extract files from a .zip archive
unzip archive.zip
unzip archive.zip -d /path/to/directory
unzip -l archive.zip  #list content of archive

***process management*** 

ps # list active processes
top # display realtime system processes
htop # interactive process veiwer
kill # terminate by process id
killall # terminate by process name
pkill # kill process based on name or other attributes
bg # resume job in backgroung
fg # resume job in foreground
nice # set priority for process
renice # change priority for running process
vmstat

***Disk usage***

df # Report file system disk space usage
du # estimates file space usage
fdisk # partition table manipulator
mkfs # create a file system on partition
mount # mount a file system
unmount # unmount a file system

***Networking commands***

ifconfig # configure network interfaces
ip addr # show ip addresses
ip route #shows route tables
ip link # shows all network interfaces
ping # check connectivity to other network device
netstat # display network connections and routing tables
netstat -lntp
ss # show active tcp connections
ss -lntp
traceroute # trace the route to a network host
traceroute google.com
traceroute -m 15 google.com
tracepath # to trace the path of application
mtr google.com # to ping and see the path at same time
telnet 10.12.24.244 3306
nslookup # query name srveres
nslookup google.com
curl # tranfer data to and fro server
wget # download file from web
scp # secure copy files between hosts
ssh # secure connect to remote machine
ftp # file transfer using FTP
hostname # to see the hostname
iwconfig # to see the wireless connections on server
dig < app > # to see the hosting details of app
whois # see complete details of app
arp# see the mac addrrss of server or domain
watch < command > # to see output in loop

***user management***

whoami # show current user
who # who is logged in 
id # show user and group ids
last # displays all loged in users
echo $SHELL # to see in which shell are you
useradd -m < user > # to create new user or add new user
usermod -aG groupname username # adding user to any group
userdel < user > # to delete the user
passwd < user > # to set the password
su < user > # to switch the user
groupadd # to create group
groupdel # to delete group
gpasswd-a username groupname # to add users to group
cat /etc/group # to see the users in group

***system monitoring and performance***

uptime # show how long the system has been running
dmesg # displays kernel messages
free # shows memory usage
vmstat # report virtual memory statics
iostat # repots cpu and io stat
sar # collect and report system activity information
mpstat # show cpu usage per processor
iotop # display io usage by processor

***system***
uname # prints system name
hostname # shows system hostname
lsb_release # prints distribution specific information
lscpu # display CPU architecture information
lsusb # list usb devices
lspci # list pci devices
dmidcode # shows system hardware information
top # display active process and usage
uptime # to know since how long system is running
date # to know the date

#############################################################################################
***Linux folder structure ***


/ # root directory of the OS

/bin(binaries) # essential commands are here. ls, cat, grep, etc.

/sbin(system binaries) # admin commands, reboot, iptables, etc.

/boot # when linux server started, it refers boot directory for system configuration

/dev(devices) # monitor/terminal, keyboard, printers, etc.

/etc(extra configuration) # system configuration files, service configurations, etc.

/home(home directory of users) # all users directory are here, their personal files, user related configs..

/lib(Libraries) # libraries/dependencies required by OS equal to .dll in windows

/lib64(64 bit libs)

/media(Media devices) # CD, DVC, USB, etc.

/mnt(mount) # adding extra disks

/opt(optional) # if you want third party applications, custom applications you can keep here

/proc(processor) # /proc/cpuinfo /proc/meminfo

/root (Root user) # home directory of root user

/run (Running information of server)

/srv(service files) # When you use your server to serve as file server, you can use this

/swap(Swap space) # 1GM ram, OS will use this swap space for extension of RAM. Reserver space

/sys # system kernal info, devices info, etc

/tmp # temporary directory, not at all important

/usr # shared files and docs between all users...

/var(variables) # logs and messages










