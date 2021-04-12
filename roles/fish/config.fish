# Load thefuck
type -q fuck; and thefuck --alias | source 

# Set the theme preferences
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts no

# Set the default editor
export EDITOR='nano -w'

# Virtualenvwrapper
test -e {$HOME}/.local/bin/virtualenvwrapper.sh ; and bass source {$HOME}/.local/bin/virtualenvwrapper.sh

# iter2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# ROS 
test -e /opt/ros/melodic/share/rosbash/rosfish ; and source /opt/ros/melodic/share/rosbash/rosfish
test -e /opt/ros/melodic/setup.bash ; and bass source /opt/ros/melodic/setup.bash

# ROS Catkin Workspace
# test -e ~/catkin_ws/devel/setup.bash ; and bass source ~/catkin_ws/devel/setup.bash

# Load Haru Simulator models
test -e ~/catkin_ws/src/haru-simulator/haru-description/models ; and set -x -g GAZEBO_PLUGIN_PATH ~/catkin_ws/devel/lib; and set -x -g GAZEBO_MODEL_PATH ~/catkin_ws/src/haru-simulator/haru-description/models