#!/bin/bash 


cd ~/Desktop

		###### Brew Installation ######
which brew &> /dev/null
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
else
    brew update &> /dev/null
fi

		###### OneDrive Installation ######
[ -e /Applications/OneDrive.app ] 

if [[ $? != 0 ]] ; then
    # Install One drive
    
    brew cask install onedrive

    [ -e /Applications/OneDrive.app ]  
   
    if [[ $? == 0 ]] ; then
         brew cask reinstall onedrive
    else
	echo "Installed OneDrive"
    fi
    
else
   echo "OneDrive already installed, moving on..."
fi

		###### Open OneDrive ######

open /Applications/OneDrive.app

read -p "Please login to continue OR press return to continue anyway..."


		###### Install bindfs ######

brew cask install osxfuse

if [[ $? == 0 ]] ; then
    brew cask reinstall osxfuse
fi

  
brew install bindfs

if [[ $? == 0 ]] ; then
    brew reinstall bindfs
fi


if [[ $? != 0 ]] ; then
    read -p "Please allow permissions to continue (If you already have, press return)..."
fi

		###### Create/Link Folders ######

			###### Desktop ######

if [[ -d "~/OneDrive\ -\ McMaster\ University/Desktop" ]] ; then
    
    
    bindfs ~/Desktop ~/OneDrive\ -\ McMaster\ University/Desktop
    
else 
    mkdir ~/OneDrive\ -\ McMaster\ University/Desktop
    bindfs ~/Desktop ~/OneDrive\ -\ McMaster\ University/Desktop 
fi

			###### Documents ######

if [[ -d "~/OneDrive\ -\ McMaster\ University/Documents" ]] ; then
    
    bindfs ~/Documents ~/OneDrive\ -\ McMaster\ University/Documents


else 
    mkdir ~/OneDrive\ -\ McMaster\ University/Documents
    bindfs ~/Documents ~/OneDrive\ -\ McMaster\ University/Documents 
fi

			###### Downloads #####

if [[ -d "~/OneDrive\ -\ McMaster\ University/Downloads" ]] ; then
    
    bindfs ~/Downloads ~/OneDrive\ -\ McMaster\ University/Downloads

else 
    mkdir ~/OneDrive\ -\ McMaster\ University/Downloads
    bindfs ~/Downloads ~/OneDrive\ -\ McMaster\ University/Downloads 
fi
