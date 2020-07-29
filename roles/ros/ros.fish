# ROS 
# Source the ROS basics (roscd, rosed, etc)
test -e /opt/ros/$ROS_DISTRO/share/rosbash/rosfish; and source /opt/ros/$ROS_DISTRO/share/rosbash/rosfish
test -e /opt/ros/`echo $ROS_DISTRO`/setup.bash; and bass source /opt/ros/`echo $ROS_DISTRO`/setup.bash

# Set Gazebo paths for Haru Simulator
test -e {$HOME}/catkin_ws/devel/lib; and set -x GAZEBO_PLUGIN_PATH $GAZEBO_PLUGIN_PATH {$HOME}/catkin_ws/devel/lib 
test -e {$HOME}/catkin_ws/src/haru-simulator/haru-description/models; and set -x GAZEBO_MODEL_PATH $GAZEBO_MODEL_PATH {$HOME}/catkin_ws/src/haru-simulator/haru-description/models

# Automatically source the workspace
function catkinSource --on-variable PWD
    status --is-command-substitution; and return
    if test -e ".catkin_workspace"
        bass source devel/setup.bash
        echo "Configured the folder as a catkin workspace"
    end
end

# Set aliases for debian creation
# Debian Creation Rules (sudo pip install -U bloom)
alias bloom_generate_kinetic='bloom-generate rosdebian --os-name ubuntu --os-version xenial --ros-distro kinetic'
alias generate_binary_pkg='fakeroot ./debian/rules binary'
alias debian_list_files='dpkg -c'

