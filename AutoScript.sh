#The Great AutoScripter. Welcome to the mind of God
#screen -S 19168.RedCraft -X stuff 'say Linux server says hi\n'

#uncomment if running this initally. For Testing keep this commented... 
#screen -S 19168.RedCraft -L -X stuff 'java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui'

echo "                                         
 _____     _       _____         ___ _   
|  _  |_ _| |_ ___|     |___ ___|  _| |_ 
|     | | |  _| . |   --|  _| .'|  _|  _|
|__|__|___|_| |___|_____|_| |__,|_| |_|  
                                         "
sleep 1
echo '...'

#For automatic resets
#Global Variables
SEC=0
MIN=0
HOU=0
MSG=0
TEMP=""

#24832.RedCraft

echo 'AutoCraft starting'
screen -S 24832.RedCraft -X stuff '/say Linux AutoCraft Script: starting...\n'

while :
do

    #snoop here
    
    text=$(tail -1 ../logs/latest.log)
    snooper=$(ruby snoop.rb "$text")
    if [ "$snooper" != "0" ] && [ "$snooper" != "/say you do not have the nessisary permissions" ];
    then
	if [[ $text == *"$"* ]] && [[ $text != $TEMP ]];
	then
	    #screen -S 19352.MCShell -X stuff "$snooper\n"
            sleep 1
	    responce=$(cat MCShell.txt)
	    clean=$(ruby cleaner.rb "$responce")
	    screen -S 24832.RedCraft -X stuff "/say raw: $responce\n"
	    screen -S 24832.RedCraft -X stuff "$clean\n"
	else
	    screen -S 24832.RedCraft -X stuff "$snooper\n"
	fi
    fi
    
    #if [ "$snooper" == "/say you do not have the nessisary permissions" ];
    #then
	#screen -S 24832.RedCraft -X stuff "$snooper\n"
    #fi
    
    #end snoop
    
    if [ $SEC -eq 60 ];
    then
    #increment in case it has been a minute
	SEC=0
	MIN=$((MIN + 1))
    fi

    if [ $MIN -eq 60 ];
    then
    #increment in case it have been an hour
	echo 'it has been and hour'
	screen -S 24832.RedCraft -X stuff 'say Linux Hourly Save...\n'
	screen -S 24832.RedCraft -X stuff 'save-all\n'
	MIN=0
	MSG=0
	HOU=$((HOU + 1))
    fi
    
    if [ $HOU -eq 24 ];
    then
	echo 'it has been a day'
	screen -S 24832.RedCraft -X stuff 'say Linux will refresh in 10 minutes\n'
	sleep 5m
	screen -S 24832.RedCraft -X stuff 'say Linux will refresh in 5 minutes\n'
	sleep 4m
	screen -S 24832.RedCraft -X stuff 'say Linux will refresh in 1 minutes\n'
	sleep 50s
	screen -S 24832.RedCraft -X stuff 'say Linux will refresh in 10 seconds\n'
	sleep 5s
	screen -S 24832.RedCraft -X stuff 'say Linux will refresh in 5 seconds\n'
	sleep 1s
	screen -S 24832.RedCraft -X stuff 'say 4\n'
	sleep 1s
	screen -S 24832.RedCraft -X stuff 'say 3\n'
	sleep 1s
	screen -S 24832.RedCraft -X stuff 'say 2\n'
	sleep 1s
	screen -S 24832.RedCraft -X stuff 'say 1\n'
	
	#save all the things
	screen -S 24832.RedCraft -X stuff 'save-all\n'
	#end it
	screen -S 24832.RedCraft -X stuff 'stop\n'

	sleep 15s
	#start it again
	screen -S 24832.RedCraft -X stuff 'java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui\n'
	#reset variables
	SEC=0
	MIN=0
	HOU=0
    fi

    #increment!
    SEC=$((SEC + 1))
   	
    sleep 1
done




