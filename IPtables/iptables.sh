#!/bin/bash -       
# title           :     iptables.sh
# description     :     Script to setup the IPtables rules for hardening the OS.
# author          :     me
# date            :     2020-05-21
# version         :     0.1    
# usage           :     ./iptables.sh  (please run as sudo !!)
#==============================================================================

# Cleaning up the existing rules.
iptables -F
iptables -X
iptables -Z

# Set default policy to drop
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow ICMP traffic
iptables -A INPUT -p icmp -m state --state NEW -j ACCEPT

# Drop invalid packets
iptables -A INPUT  -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP

# Allow established and related traffic
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow specific protocols
iptables -A OUTPUT -p tcp -m tcp --dport 22 -m comment --comment "Outgoing SSH" -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -m comment --comment "Incoming SSH" -j ACCEPT

iptables -A OUTPUT -p tcp -m tcp --dport 80 -m comment --comment "HTTP" -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 443 -m comment --comment "HTTPS" -j ACCEPT

iptables -A OUTPUT -p tcp -m tcp --dport 53 -m comment --comment "DNS-TCP" -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 53 -m comment --comment "DNS-UDP" -j ACCEPT

iptables -A OUTPUT -p udp -m udp --dport 67:68 -m comment --comment "DHCP" -j ACCEPT
