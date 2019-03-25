# Setup Wifi

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

# Other useful tools

Install redshift to remove blue light color that may strain eyes:

```
sudo apt install -y redshift
```

Then to run it, just type:

```
redshift -O 3000  # Note that 3000 is the color temperature
```

