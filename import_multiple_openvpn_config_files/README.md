# Import multiple openvpn configuration

Based on the method described in:
https://unix.stackexchange.com/questions/301845/scripting-a-way-to-quickly-import-ovpn-files-to-networkmanager-on-ubuntu/301856

1. In the directory where you have the configuration files run:

```
for i in *; do nmcli connection import file "$i" type openvpn; done
```

2. Alternatively, If you only want to import specific files (example: files that start with pt):

```
for i in pt*.ovpn; do nmcli connection import file "$i" type openvpn; done
```

3. Copy the script set_ovpn_user_pass.sh to some location of your file system (example: ~/scripts/set_ovpn_user_pass.sh).

4. cd into the directory where the NetworkManager configuration files are. Example for Fedora:
```
cd /etc/NetworkManager/system-connections
```

5. Run your script for all the files in the directory:

```
for i in *; do sudo ~/scripts/set_ovpn_user_pass.sh "$i"; done
```
6. Restart NetworkManager:

```
sudo systemctl restart NetworkManager
```
