#!/bin/bash

# Function to clear the screen and display the menu
display_menu() {
    echo "=== DNS Query Tool ==="
    echo "1. Full Dig Command (Raw Output)"
    echo "2. Query IPv4 address"
    echo "3. Query IPv6 address"
    echo "4. Query Mail servers"
    echo "5. Query Nameservers"
    echo "6. Query Text data"
    echo "7. Query Canonical names"
    echo "8. Query Start of Authority"
    echo "9. Propagation Check"
    echo "10. Reverse DNS Lookup"
    echo "0. Exit"
    echo "======================"
}

# Function to perform a full dig command
full_dig() {
    clear
    echo "=== Full Dig Command ==="
    read -rp "Enter the domain: " domain
    dig "$domain" || echo "Error: Invalid domain or no response"
    echo "========================"
}

# Function to query specific record types
query_record() {
    clear
    record_type=$1
    echo "=== Query $record_type Record ==="
    read -rp "Enter the domain: " domain
    dig +short "$domain" "$record_type" || echo "Error: Invalid domain or no response"
    echo "========================"
}

# Function for propagation check
propagation_check() {
    clear
    echo "=== DNS Propagation Check ==="
    read -rp "Enter the domain: " domain
    read -rp "Enter a nameserver to compare: " nameserver
    echo "Querying Google (8.8.8.8)..."
    google_result=$(dig @"8.8.8.8" "$domain" +short)
    echo "Querying Cloudflare (1.1.1.1)..."
    cloudflare_result=$(dig @"1.1.1.1" "$domain" +short)
    echo "Querying $nameserver..."
    custom_result=$(dig @"$nameserver" "$domain" +short)

    echo "=== Results ==="
    echo "Google: $google_result"
    echo "Cloudflare: $cloudflare_result"
    echo "$nameserver: $custom_result"
    echo "================"
}

# Function for reverse DNS lookup
reverse_dns_lookup() {
    clear
    echo "=== Reverse DNS Lookup ==="
    read -rp "Enter the IP address: " ip
    dig +short -x "$ip" || echo "Error: Invalid IP or no response"
    echo "========================"
}

# Main script loop
while true; do
    display_menu
    read -rp "Enter your choice: " choice

    case $choice in
        1) full_dig ;;
        2) query_record "A" ;;
        3) query_record "AAAA" ;;
        4) query_record "MX" ;;
        5) query_record "NS" ;;
        6) query_record "TXT" ;;
        7) query_record "CNAME" ;;
        8) query_record "SOA" ;;
        9) propagation_check ;;
        10) reverse_dns_lookup ;;
        0)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
