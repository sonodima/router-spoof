#
#  router_spoof.sh
#
#  Script that spoofs mac addresses and changes network domain of OpenWRT based routers.
#



# Domain name changing

# Generate random domain name
GENERATED_DOMAIN="$(head /dev/urandom | tr -dc a-z | head -c 8).com"

# Set the generated domain name
echo "Setting domain: $GENERATED_DOMAIN"
uci set dhcp.dnsmasq.domain=$GENERATED_DOMAIN

# Apply changes
echo "Applying dhcp changes"
uci commit dhcp



# Mac spoofing

# Add interfaces you want to spoof to this list
INTERFACES="eth0 eth1 eth2 eth3 eth5"

# Iterate through each interface
echo $INTERFACES | tr ' ' '\n' | while read INTERFACE; do
    # Deactivate interface
    echo "Deactivating $INTERFACE"
    ifconfig $INTERFACE down

    # Set new address to interface
    NEW_MAC=$(hexdump -n6 -e '/1 ":%02X"' /dev/random | sed s/^://g)
    echo "Setting $NEW_MAC to $INTERFACE"
    ifconfig $INTERFACE hw ether $NEW_MAC > /dev/null 2>&1

    # Reactivate interface
    echo "Activating $INTERFACE"
    ifconfig $INTERFACE up
done
