#Shebang statements
#!/bin/sh

#Checking the OS of the User and splitting into substring using delimeter to get the actual OSTYPE.
VER=$(grep '^NAME' /etc/os-release)
SUB=$(echo $VER | cut -d '=' -f 2)
TYPE=$(echo $SUB | cut -d '"' -f 2)
echo "$TYPE"

#Using the OS Type of the user to control commands to execute using decision making statements.
if [[ "$TYPE"=="Ubuntu" || "$TYPE"=="Debian" ]];
then
	sudo apt update -y
	if ! command -v wget &> /dev/null
	then
		sudo apt install -y wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo apt install -y curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo apt install -y nodejs
	fi
elif [[ "$TYPE"=="Rhel" || "$TYPE"=="CentOs" ]];
then
	sudo yum -y update
	if ! command -v wget &> /dev/null
	then
		sudo yum install wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo yum -y install curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo yum -y install nodejs
	fi
elif [[ "$TYPE"=="Fedora" ]];
then
	sudo dnf -y update
	if ! command -v wget &> /dev/null
	then
		sudo yum install wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo dnf install curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo dnf install nodejs
	fi
elif [[ "$TYPE"=="SUSE" || "$TYPE"=="OpenSUSE" ]];
then
	sudo zypper update
	if ! command -v wget &> /dev/null
	then
		sudo zypper install wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo zypper install curl
	fi
	if ! command -v node &> /dev/null
	then
		zypper addrepo http://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_15.0 node 10
		Zypper refresh
		zypper install nodejs10
	fi
elif [[ "$TYPE"=="Arch" || "$TYPE"=="Manjaro" ]];
then
	sudo pacman -syu
	if ! command -v wget &> /dev/null
	then
		sudo pacman -sy wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo pacman -sy curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo pacman -sy nodejs
	fi
fi
