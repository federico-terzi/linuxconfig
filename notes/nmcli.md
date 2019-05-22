# Use nmcli to connect to wifi

List interfaces

```
nmcli radio
```

Force rescan

```
nmcli device wifi rescan
```

List wifi networks

```
nmcli device wifi list
```

Connect to a wifi network

```
nmcli device wifi connect SSIDNAME password PASSWORD
```

