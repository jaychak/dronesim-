# read list of world files in
WORLDDIR="/home/jay/autopilot_ws/src/autopilot/worlds"
WORLDFILES="/home/jay/autopilot_ws/src/autopilot/worlds/wall_challenges_train/*.world"

# whether the trajectory is a success or not is saved log file. 
logdir='/home/jay/autopilot_ws/src/autopilot'

declare -a turning_array=('left' 'right')
declare -a flying_array=('0' '3.14')

for turning_direction in "${turning_array[@]}";
do
    for flying_direction in "${flying_array[@]}";
    do
	log="$logdir/log-$turning_direction-$flying_direction"
	if [ $flying_direction == '3.14' ]; 
	then log="$logdir/log-$turning_direction-3" 
	fi
        rm -rf $log
        # for file in list launch
        for world in $WORLDFILES
        do
                FNAME=$(basename ${world}) #get name of the world
                echo $FNAME
                SLOC="remote_images/wall_challenge/$(basename ${world} | cut -c1-4)" #cut .world from it
                COMMAND="roslaunch autopilot wall_challenge.launch sloc:='$SLOC-$turning_direction-$flying_direction' current_world:='/wall_challenges_train/$FNAME' steering_direction:='$turning_direction' logfile:='$log' spawn_dir:='$flying_direction'"
                echo $COMMAND
#                 
#                 xterm -hold -e $COMMAND &
#                 pidlaunch=$!
#                 echo $pidlaunch > "$WORLDDIR/../.pid"
#                 while kill -0 $pidlaunch; 
#                 do sleep 0.5
#                 done
#                 sleep 0.5m
        done
    done
done
