# Get the logcat dump from an android phone

Install ADB
```
sudo apt-get install android-tools-adb android-tools-fastboot
```

Then to get the logcat
```
adb logcat -d > dump.txt
```
