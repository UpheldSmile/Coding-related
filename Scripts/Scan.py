# This program is just a for fun program, would still use NMAP but is a different approach to go about enumeration
import socket

def scan_ports(ip, ports):
    open_ports = []
    for port in ports:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex((ip, port))
        if result == 0:
            open_ports.append(port)
        sock.close()
    return open_ports

def main():
    ip = input("Enter the IP address to scan: ")

    # Ask the user if they want to scan a range of common ports
    scan_common_ports = input("Do you want to scan a wider range of common ports? (yes/no): ").lower()
    
    if scan_common_ports == 'yes':
        #Array of common ports
        common_ports_range = range(1, 1024)
        ports_to_scan = list(common_ports_range)
    else:
        custom_ports = input("Enter the ports you want to scan (comma-separated): ")
        ports_to_scan = [int(port) for port in custom_ports.split(',')]

    open_ports = scan_ports(ip, ports_to_scan)

    if open_ports:
    print("Open ports on {}: {}".format(ip, ', '.join(map(str, open_ports))))
    else:
    print("No open ports found on {}".format(ip))

if __name__ == "__main__":
    main()
