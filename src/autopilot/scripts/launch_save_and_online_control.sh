#create online folder and ensure the permissions are set to writing
rm -rf /home/jay/data/remote_images/set_online
mkdir -p /home/jay/data/remote_images/set_online/RGB
mkdir -p /home/jay/data/remote_images/set_online/depth
chmod 777 /home/jay/data/remote_images/set_online/RGB
chmod 777 /home/jay/data/remote_images/set_online/depth
chmod 777 /home/jay/data/remote_images/set_online

#start off the simulated world in background
roslaunch autopilot oa_world.launch

#launch the LSTM network on qayd
#ssh kkelchte@ssh.esat.kuleuven.be "ssh qayd 'start_lstm'"

#launch the CNN network on emerald
#ssh kkelchte@ssh.esat.kuleuven.be "ssh qayd 'start_cnn'"




