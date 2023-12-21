# This program is just a for fun program, would still use NMAP but is a different approach to go about enumeration
import socket

def scan_ports(ip, ports):
    # Initialize an empty list to store open ports
    open_ports = []

    # Loop through each port in the specified list
    for port in ports:
        # Create a socket object for the specified address family and socket type
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        # Attempt to connect to the specified IP address and port
        result = sock.connect_ex((ip, port))
        # Check if the connection attempt was successful (result == 0)
        if result == 0:
            open_ports.append(port)
            # If successful, add the open port to the list
        sock.close()
         # Close the socket connection
    return open_ports
     # Return the list of open ports

# Main program logic
def main():
    ip = input("Enter the IP address to scan: ")

    # Ask the user if they want to scan a range of common ports
    scan_common_ports = input("Do you want to scan a wider range of common ports? (yes/no): ").lower()
    
    if scan_common_ports == 'yes':
        #Range of common ports
        common_ports_range = range(1, 1024)
        # Convert the range to a list of common ports to scan
        ports_to_scan = list(common_ports_range)
    else:
        custom_ports = input("Enter the ports you want to scan (comma-separated): ")
         # Convert the comma-separated input to a list of integers
        ports_to_scan = [int(port) for port in custom_ports.split(',')]

    open_ports = scan_ports(ip, ports_to_scan)

    if open_ports:
    print("Open ports on {}: {}".format(ip, ', '.join(map(str, open_ports))))
    else:
    print("No open ports found on {}".format(ip))


# Check if the script is being run as the main program
if __name__ == "__main__":
    # Call the main function to start the program
    main()
