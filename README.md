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

TODO

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

# Other useful tools

Install redshift to remove blue light color that may strain eyes:

```
sudo apt install -y redshift
```

Then to run it, just type:

```
redshift -O 3000  # Note that 3000 is the color temperature
```

