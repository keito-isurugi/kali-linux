#!/bin/bash

echo "=== LHOST IP Addresses ==="
echo ""

# Check if running in Docker container or macOS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux (inside Docker container)
    echo "1. VPN Interface (tun0):"
    ip addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || echo "   VPN not connected"
    echo ""
    
    echo "2. All Network Interfaces:"
    ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+' | grep -v '127.0.0.1'
    echo ""
    
    echo "3. All IPs:"
    hostname -I 2>/dev/null || hostname -i
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "1. VPN Interface (utun):"
    ifconfig | grep -A 4 "utun" | grep "inet " | awk '{print $2}' | head -1 || echo "   VPN not connected"
    echo ""
    
    echo "2. All Network Interfaces:"
    ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}'
    echo ""
    
    echo "3. Active Network Interface:"
    ipconfig getifaddr en0 2>/dev/null || echo "   No en0 interface"
    ipconfig getifaddr en1 2>/dev/null || echo "   No en1 interface"
fi