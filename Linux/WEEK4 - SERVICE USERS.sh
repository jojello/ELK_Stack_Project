# Service Users

grep "ftp\|dove" /etc/passwd

sudo deluser --remove-all-files <username>

sudo deluser --remove-all-files dovecot

sudo adduser --system --no-create-home tripwire

id tripwire

ls /home

sudo tail /etc/shadow

sudo tail /etc/passwd

sudo visudo

# Add `tripwire ALL= NOPASSWD: /usr/sbin/tripwire` to the user section of the file and save it.

# The section should be as follows:

        ```bash
        # User privilege specification
        root ALL=(ALL:ALL) ALL
        tripwire ALL= NOPASSWD: /usr/sbin/tripwire
        ```

which tripwire

sudo chmod 700 /usr/sbin/tripwire

ls -l /usr/sbin/tripwire