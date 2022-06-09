## Solution Guide: Managing Services

systemctl -t service --all

# The following services from the list are listed as present on the server: vsftpd.service (FTP), apache2.service (HTTP), nginx.service (HTTP),xinetd.service (Telnet), dovecot.service (IMAP or POP3)

# These services can help attackers gain access to the server, and none of them are necessary for the server to function properly.

# To stop a service:
sudo systemctl stop <service_name>

systemctl status <service_name>

# Note: You can run systemctl against multiple services like this: `systemctl status <service_name_1> <service_name_2>`.  You can start, stop, enable, and disable multiple services at once too. 

sudo systemctl disable <service_name>

# Note:** Do not actually disable `nginx` or `apache2` from the system because they are needed later.

sudo apt remove <service_name>

