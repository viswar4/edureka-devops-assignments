#!/bin/bash
# List of hosts to install Git on
# Check the distribution
ostype=`cat /etc/os-release | grep -w NAME | cut -d '=' -f2`
if [ "$ostype" == '"Ubuntu"' ]; then
                # Ubuntu system
        echo "Detected Ubuntu system"
    which git
        if [ $? -eq 0 ]; then 
            echo "Git with version `git --version` is already installed"
                exit
        else
                echo "Installing git"
                                sudo add-apt-repository ppa:git-core/ppa
                sudo apt-get update
                sudo apt-get install git -y
                echo "Git with version `git --version` has been installed successfully"
        fi
elif [ "$ostype" == '"Linux"' ]; then
    # Linux system
                echo "Detected Linux system"
                which git
                if [ $? -eq 0 ]; then 
                echo "Git with version `git --version` is already installed"
                exit
                        else
                echo "Installing git"
                                sudo yum update
                                sudo yum install git -y
                        fi
elif [ "$ostype" == '"Alpine Linux"' ]; then
      echo "Detected Alpine Linux"
        which git
        if [ $? -eq 0 ]; then 
                echo "Git with version `git --version` is already installed"
                exit
                        else
                echo "Installing git"
                                sudo apk add git
                    fi
else
                echo "Unsupported system"
                exit 1
fi