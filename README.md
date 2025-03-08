# Interactive-dig-Menu
DNS Query Tool (Interactive dig Menu)
This Bash script provides an interactive menu for performing various DNS lookups using dig. It simplifies common DNS queries, making it useful for system administrators, network engineers, and developers who need to troubleshoot domain records.

Features:
Full dig Query: Displays raw dig output for a domain.
Record Type Lookups: Quickly query A, AAAA, MX, NS, TXT, CNAME, and SOA records.
DNS Propagation Check: Compare results from Google DNS (8.8.8.8), Cloudflare DNS (1.1.1.1), and a user-specified nameserver.
Reverse DNS Lookup: Perform PTR record lookups for IP addresses.
User-Friendly Menu: Allows easy selection of DNS queries without needing to remember dig command syntax.
Usage:
Run the script in a terminal:

chmod +x dns_query.sh
./dns_query.sh

This script is a helpful tool for quickly diagnosing DNS-related issues and verifying record propagation.
