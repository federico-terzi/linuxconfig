This repository contains the configuration files to setup my favourite linux environment.
I keep them as a reference when I need to setup a new machine.

# Setup wifi TPLink Archer T9E

In order to setup the TPLink Archer T9E Wifi Card, you need a valid internet connection.
To do so I set up a router in WDS mode to convert the Wifi signal into ethernet.

When a valid connection is available:

```
sudo apt update
sudo apt install bcmwl-kernel-source
```

This will install Broadcom drivers, that are compatible with this wifi card. They have a few
problems: for example, **we can only connect to wifi networks with channel < 8.**
So I had to change the channel of my wifi.

At this point wifi should be working.

# Setup i3

The next step is to install i3wm:

```
sudo apt install i3
```

At this point, logout and then re-login **selecting i3 as desktop environment** in the top 
right of the login screen.

We now need to setup monitor ordering correctly, if you are using a known setup, search
for the correct screenlayout file in this repository, read the next section otherwise.

Copy the i3config file in this repository to the `~/.config/i3/config`


### Using arandr to setup monitor ordering

Now we need to setup monitor ordering, for this task we will use `arandr`, so let's 
install it.

```
sudo apt install arandr
```

Then we need to launch it and then setup monitor ordering as wanted. Then save the
screenlayout file. Inside this file there will be the xrandr script that set up
the monitors.

## Setup media keys and status bar

We need to make a few changes to the i3 configuration to enable media keys and
we also need to change i3status configuration to show the current volume level.

In the `~/.config/i3/config` file add the following lines:

```
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym Shift+XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +1% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym Shift+XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -1% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound
```

Then we need to modify the i3status configuration, so copy the i3status config file in
the home:

```
mkdir ~/.config/i3status
cp i3status ~/.config/i3status/config
```

Then we need to reload it using `WIN+SHIFT+r`

## Setup Keyboard layout switching

In order to setup keyboard layout switching with WIN+SPACE, I used [this](https://github.com/porras/i3-keyboard-layout) script. It's already included in this repository, but
we may need to make it executable using chmod.

Then, if you are starting from scratch with the i3 config file, you need to make
the following modifications:

```
# Comment the binding already present for the $mod+space

# Add the following binding:
bindsym $mod+space exec ~/linuxconfig/i3-keyboard-layout cycle us it

# And then, modify the bar function to include i3-keyboard-layout
bar {
	status_command i3status | ~/linuxconfig/i3-keyboard-layout i3status
}

```


# Setup ZSH

In order to setup zsh, we have to install it first:

```
sudo apt install -y zsh
```

Then we can download the [Oh My SH package](https://github.com/robbyrussell/oh-my-zsh)
using this command:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

At this point copy the zshrc in this repository to the ~/.zshrc file.

**At this point, logout and login again to complete the installation**

In particular, this file has the following modifications:

### Agnoster theme

I like the *agnoster* theme, to change that edit the ZSH\_THEME variable.

In order for it to work, we also need to install the [Powerpack fonts](https://github.com/powerline/fonts), using this command:

```
sudo apt install -y fonts-powerline
```

**A logout is needed for changes to take effect**

### Remove the user/machine

I don't like the user@machine in my shell. To remove it, we need to change the .zshrc
file and add the following line:

```
prompt_context() {}
```

# Setup VIM

Copy the `vimrc` file in this repository to `~/.vimrc`

```
cp vimrc ~/.vimrc
```

# Setup Github SSH auth 

We first need to generate a valid RSA pair using ssh-keygen ( press enter
to all the answers ) and then add it to the ssh agent.

```
ssh-keygen -t rsa -b 4096

ssh-agent /bin/sh
ssh-add ~/.ssh/id_rsa
```

Now we need to copy the public key ( found at `~/.ssh/id_rsa.pub` ) and add it to
the list of trusted keys on [Github Settings](https://github.com/settings/keys)

**Make sure to utilize SSH cloning with github, and not HTTPS.**
Using HTTPS will ask for user and password every time and ssh keys will not work.

If you need to change from HTTPS remote origin to SSH based one, use this command:

```
git remote set-url origin git@github.com:federico-terzi/linuxconfig.git
```

# Installing Google Chrome

Navigate to the [Chrome Download page](https://www.google.com/chrome/) and download
the 64 bit DEB package.

Then to install it:

```
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

# Install GIMP

To install GIMP, we will use `flatpak`, according to the [instructions](https://www.gimp.org/downloads/)

```
sudo apt install flatpak
sudo flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
```

To launch GIMP, use the following command:

```
flatpak run org.gimp.GIMP//stable
```

# Install Redshift to for night-shift 

Install redshift to remove blue light color that may strain eyes:

```
sudo apt install -y redshift
```

Then to run it, just type:

```
redshift -O 3000  # Note that 3000 is the color temperature
```

### Keybindings

In my custom i3 config, I assigned the following key binding to change the
redshift on the go:

* WIN+F1 > Set the temperature to 3000k
* WIN+F2 > Set the temperature to 4000k
* WIN+Shift+F1 > Remove red filter

