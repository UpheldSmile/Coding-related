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

    # Ask the user if they want to scan a wider range of common ports
    scan_common_ports = input("Do you want to scan a wider range of common ports? (yes/no): ").lower()
    
    if scan_common_ports == 'yes':
        #Array of common ports
        ports_to_scan = [20, 21, 22, 23, 25, 53, 67, 68, 69, 80, 110, 115, 119, 123, 135, 137, 139, 143, 161, 194, 389, 443, 445, 514, 515, 587, 993, 995, 1433, 1521, 3306, 3389, 5432, 5900, 5984, 6379, 7001, 8000, 8080, 8443, 8888, 9090, 9200, 9300, 10000, 11211, 27017, 28017]
    else:
        custom_ports = input("Enter the ports you want to scan (comma-separated): ")
        ports_to_scan = [int(port) for port in custom_ports.split(',')]

    open_ports = scan_ports(ip, ports_to_scan)

    if open_ports:
        print("Open ports on {}: {}".format(ip, open_ports))
    else:
        print("No open ports found on {}".format(ip))

if __name__ == "__main__":
    main()
