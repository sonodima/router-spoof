<h1 align="center">router-spoof 📡</h1>
<p>
</p>

> ASH friendly script that spoofs mac addresses and changes network domain of OpenWRT based routers.<br>If set up this script with the commands below, it will launch every time the router starts.<br><br>Note that changes to the domain name only take place after a reboot, so in each session you will see the previous domain name.

## Install

```sh
wget "https://raw.githubusercontent.com/sonodima/RouterSpoof/master/router_spoof.sh" -O "/etc/init.d/router_spoof.sh"
chmod 755 "/etc/init.d/router_spoof.sh"
ln -s "/etc/init.d/router_spoof.sh" "/etc/rc.d/S99router_spoof"
./etc/init.d/router_spoof.sh
reboot
```

## Setup

> Edit 'INTERFACES' to select the interfaces you want to spoof.<br>Please note that spoofing every interface is not a good idea, and it may affect your internet connection.
```
vi "/etc/init.d/router_spoof.sh"
```

## Author

👤 **sonodima**

* Github: [@sonodima](https://github.com/sonodima)
