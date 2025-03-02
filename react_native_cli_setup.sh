

#react anjtive setup from documentation
      #  right now it is npx @react-native-community/cli@latest init AwesomeProject
             #               terminal one npm start 
               #             terminal two npm run android



#################################for emulator###############################################################

#open jdk 
#android adb 
#usb debugging on 
#sdk manager 
#android home path not setup error bahut common hai 
################################################################################################################################



 
################################################################################################################################
#clean old installation 
# Remove any previously installed packages
sudo apt remove android-tools-adb sdkmanager google-android-cmdline-tools-*-installer
sudo apt autoremove

# Clean up directories (optional, be careful with this if you have other projects)
rm -rf ~/Android
 
################################################################################################################################




 
################################################################################################################################

# create new directory for sdk
# Create base directory
mkdir -p ~/Android/Sdk
cd ~/Android/Sdk
 
################################################################################################################################





 
################################################################################################################################
#    download all these in that directory
# Download command-line tools

wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip

# Unzip the package
unzip commandlinetools-linux-9477386_latest.zip

# Create the proper directory structure
mkdir -p cmdline-tools
mv cmdline-tools latest
mkdir cmdline-tools
mv latest cmdline-tools/
 
################################################################################################################################





 
###################################   setting ystem path variables                 #############################################################################################
 
#setting path variables 
#!/bin/bash

BASHRC_FILE="$HOME/.bashrc"

# Remove existing Android SDK path definitions
sed -i '/export ANDROID_HOME=/d' "$BASHRC_FILE"
sed -i '/export ANDROID_SDK_ROOT=/d' "$BASHRC_FILE"
sed -i '/export PATH=.*ANDROID_HOME/d' "$BASHRC_FILE"

# Append new Android SDK paths
echo "# Android SDK paths" >> "$BASHRC_FILE"
echo "export ANDROID_HOME=\$HOME/Android/Sdk" >> "$BASHRC_FILE"
echo "export ANDROID_SDK_ROOT=\$HOME/Android/Sdk" >> "$BASHRC_FILE"
echo "export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin" >> "$BASHRC_FILE"
echo "export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> "$BASHRC_FILE"
echo "export PATH=\$PATH:\$ANDROID_HOME/emulator" >> "$BASHRC_FILE"

# Reload the bash setup
source "$BASHRC_FILE"

echo "Android SDK paths updated successfully!"



echo $ANDROID_HOME
echo $PATH
#cross check setting up
 
################################################################################################################################





 
#######################         #installing java jdk nad sdk            #########################################################################################################

# Install Java first
sudo apt update
sudo apt install openjdk-11-jdk

# Install required SDK components
cd ~/Android/Sdk/cmdline-tools/latest/bin
./sdkmanager --update
./sdkmanager "platform-tools" "build-tools;34.0.0" "platforms;android-34" "ndk;26.1.10909125"
./sdkmanager --licenses
 #########################################################################################################



### verify device connection 
# Check if your device is detected
~/Android/Sdk/platform-tools/adb devices







#hurray sdk setup done 


#on developer mode and usb debuffing in phone , also connect via usb 
#create new cli reat native project and npm start and npn run android
