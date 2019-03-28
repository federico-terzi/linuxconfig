This repository contains the configuration files to setup my favourite linux environment.
I keep them as a reference when I need to setup a new machine.

I use Ansible to manage all my packages and configurations.

# Quick start

A quick way to get started is using this bootstrap:

```
sudo sh -c "$(curl -sSL https://raw.githubusercontent.com/federico-terzi/linuxconfig/master/bootstrap.sh)"
```

If you want to install also custom additions, based on the current computer, you can
specify it using Environmental variables ( don't forget -E flag on sudo ).

These are useful to setup custom monitor setups and install specific patches.

#### Laptop configuration
```
LAPTOP=true sudo -E sh -c "$(curl -sSL https://raw.githubusercontent.com/federico-terzi/linuxconfig/master/bootstrap.sh)"
```

#### Bologna configuration
```
BOLOGNA=true sudo -E sh -c "$(curl -sSL https://raw.githubusercontent.com/federico-terzi/linuxconfig/master/bootstrap.sh)"
```

#### Sangiovanni configuration
```
SANGIO=true sudo -E sh -c "$(curl -sSL https://raw.githubusercontent.com/federico-terzi/linuxconfig/master/bootstrap.sh)"
```

# Wifi

To connect to a wifi network using the terminal, we can use this command:

```
nmcli d wifi connect "WIFINAME" password "PASSWORD"
```

## Setup wifi TPLink Archer T9E

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
# Volume controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym Shift+XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +1% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym Shift+XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -1% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Screen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 10
bindsym XF86MonBrightnessDown exec xbacklight -dec 10
```

Then we need to reload it using `WIN+SHIFT+r`

### Control brightness

To control brightness, we have to install `xbacklight` and enable the intel backlight:

```
sudo apt install -y xbacklight
```

And then create the file: `/etc/X11/xorg.conf` with the following content:

```
Section "Device"
    Identifier  "Intel Graphics" 
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```

**A logout is required for this to take effect**

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

# Setup Thunar file manager

Sometimes it's useful to navigate files using a GUI rather than the command line.
Because my base distro of linux is Xubuntu, I use Thunar as a file manager.

The problem is that when installing i3, most of the icons are not visible. To
solve the problem, we will need `lxappearance`:

```
sudo apt install lxappearance
```

Then we can select another theme, for example `Adawaita-dark`, and another
icon theme, for example `elementary Xfce`.

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

To launch GIMP, we need to copy the `gimp` script present in this repository into the
`/usr/local/bin` folder:

```
sudo cp gimp /usr/local/bin/gimp
sudo chmod +x /usr/local/bin/gimp
```

Now we can start gimp from dmenu by searching "gimp".

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

# Install Dropbox

To install Dropbox, i followed [this guide](https://linoxide.com/linux-how-to/install-dropbox-ubuntu/)

Basically, these are the steps:

```
# Download dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# Start the daemon
~/.dropbox-dist/dropboxd
```

At this point the browser will open to login into the Dropbox account. After that,
dropbox should start synchronizing all the files in the Dropbox folder.

Now we need to install the Dropbox cli:

```
sudo wget -O /usr/local/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"

sudo chmod +x /usr/local/bin/dropbox

# Now to check the status of dropbox, we can type:

dropbox status
```

To make dropbox start automatically at system startup, we need to add it as a service:

Copy the `dropbox.service` file of this repository into the systemd folder:

```
# If your user/group is not freddy, we will need to change it in this file.
sudo cp dropbox.service /etc/systemd/system/dropbox.service
```

We now need to configure systemd:

```
sudo systemctl daemon-reload
sudo systemctl enable dropbox
sudo systemctl status dropbox
```




