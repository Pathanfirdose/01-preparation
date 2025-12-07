# #!/bin/bash --> shebang

    sh <script-name>
    bash <script-name>
    ./<script-name> --> in 3 ways we can run scripts but for last one we need execute permission to run the sript

# variables> --> placeholder for the value and follows DRY --Dont Reapeat Yourself

    PERSON1=firdose
    PERSON2=moinuddin

    hi $PERSON1 ${PERSON1}
    hello ${PERSON2} $PERSON2 --> We can refer variable in both ways

# Arguments/args/inputs --> passing variables while running script through arguments

    PERSON1=$1
    PERSON2=$2

    usage of argument variables
    Ex:- Sh <sript-name> firdose moinuddin --> here $1 is firdose and $2 is moinuddin
-----------------------------------------------------------------------------------------------
# variables from run time

    USERNAME

    read USERNAME --> it will display on terminal
    read -s PASSWORD --> it wont display

    echo $USERNAME

    usage of script
    ex:- sh <script-name> --> when we run the script it will prompt to eneter username and password
-----------------------------------------------------------------------------------------------

# array

    FRUITS=("apple" "mango" "banana")

    echo first fruit is ${FRUITS[0]} --> apple
    echo first fruit is ${FRUITS[1]} --> mango
    echo first fruit is ${FRUITS[2]} --> banana
    echo first fruit is ${FRUITS[@]} --> it will print all fruits

    Ex:- sh <script-name>
-----------------------------------------------------------------------------------------------

# How to take command as a variable in shell script
    Syntax:- VARIABLE=$(command)
        ex:- DATE=$(date) then echo $DATE --> it will print date
-----------------------------------------------------------------------------------------------
# Data types

    NUMBER1=$1
    NUMBER2=$2

    SUM=$(($NUMBER1+NUMBER2))

    echo "the summ of $NUMBER1 and $NUMBER2 is $SUM"
-----------------------------------------------------------------------------------------------
# Special variables

    $@ --> all the arguments passed to script
    $# --> number of variables passed to script
    $0 --> displays script name
    $PWD --> displays current working directory
    $HOME --> display home directory of current user
    sleep 100 &
    $! --> displays PID of last background command
    $? --> displays status of previous command success or failure 
        if  0 its success
        if 1 to 127 its failure
----------------------------------------------------------------------------------------------
# biceps * shopulder
chest * tricep
lat * legs
optimum nutrion and muscle blaze 
-----------------------------------------------------------------------------------------------
# conditions

    NUMBER1=$1

    if [ $NUMBER1 is -gt 20 ]
    then
        echo "given number : $NUMBER1 is greater than 20
    else
        echo "given number : $NUMBER1 is less than 20"
    fi
-----------------------------------------------------------------------------------------------
# 
    ex:- ls -ltr &>> output.txt  --> records output to given file
    ex:- ls -ltr tee -a output.txt --> -a is append it will display on terminal as well as save output to file 

# 
    set -e --> it will automatically detetct the error and exit
    touch -d --> to create the file with back date
    ex:- touch -d 20240801 frontend.lg

# crontab -e --> it will open crontab editor then insert like below
    <period> <full path of script>
    ex:- */2**** sh /home/ec2-user/scripts/18-delete-logs.sh
    then see the status
    tail -f cron 

# how to convert script into a command
    ex:- 19-backup.sh -->script
    step1:- chmod +x 19.backup.sh
    step2:- cp 19-backup.sh /bin/backup
    step3:- backup --> you just enter backup it will execute as a native command

    


# How would you find all files larger than 100MB in a directory and its subdirectories?
ANS find /path/to/directory -type f -size +100M

# Q2: What does the command chmod 755 file do? 
ANS ○ Changes the file's permissions to 755. 
○ 7: Full permission for the owner (read, write, execute). 
○ 5: Read and execute for group and others. 

# How do you recursively delete all .log files in a directory?
ANS find /path/to/directory -name "*.log" -type f -delete

# Q4: How do you create a tarball of /var/log and compress it with gzip? 
ANS tar -czvf logs.tar.gz /var/log

# Q5: How do you troubleshoot a network issue where a server is unreachable?
ANS Check network connectivity: ping <ip>
ANS Verify DNS resolution: nslookup <domain name>
ANS Check routes: ip route
ANS Verify firewall settings: sudo iptables -L
ANS Test specific port availability: nc -zv <server_ip> <port> or telnet <server ip> <pot>


