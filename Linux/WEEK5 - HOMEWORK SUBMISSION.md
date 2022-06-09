## Week 5 Homework Submission File: Archiving and Logging Data


### Step 1: Create, Extract, Compress, and Manage tar Backup Archives

# Command to **extract** the `TarDocs.tar` archive to the current directory:
tar -xvf TarDocs.tar

# Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directory:
tar --exclude='Java' -cvWf ~/Projects/Javaless_Docs.tar ~/Projects/TarDocs/Documents

# Command to ensure `Java/` is not in the new `Javaless_Docs.tar` archive:
tar -tvf Javaless_Docs.tar | grep "Java"

 
# Command to create an incremental archive called `logs_backup.tar.gz` with only changed files to `snapshot.file` for the `/var/log` directory:
sudo tar -czvf ~/Projects/logs_backup.tar.gz --listed-incremental=~/Projects/snapshot.snar --level=1 /var/log


### Step 2: Create, Manage, and Automate Cron Jobs

# Cron job for backing up the `/var/log/auth.log` file:
# Note: I provided read permissions to sysadmin user for access to auth.log to make sure cron job could run without using sudo or running job as root:
sudo chmod +r auth.log

# If using crontab -e:
0 6 * * 3 tar -czvf /home/sysadmin/auth_backup.tgz /var/log/auth.log 

# If using sudo crontab -e:
0 6 * * 3 tar -czvf /auth_backup.tgz /var/log/auth.log
---

### Step 3: Write Basic Bash Scripts

# Brace expansion command to create the four subdirectories:
mkdir -p backups/{freemem,diskuse,openlist,freedisk}

# Paste your `system.sh` script edits below:

    ```bash
    #!/bin/bash

echo $(cat /proc/meminfo | grep "MemFree") > ~/backups/freemem/free_mem.txt

echo "Disk usage: \n $(df -H | awk '{print $1, $3}')\n" > ~/backups/diskuse/disk_usage.txt

echo "Open files:  $(lsof)" > ~/backups/openlist/open_list.txt

echo "System Disk space stats:  $(df -H | awk '{print $1, $4}') \n" >> ~/backups/freedisk/free_disk.txt

    ```

# Command to make the `system.sh` script executable:
sudo chmod +x system.sh


# Commands to test the script and confirm its execution:
# Run script: 
./system.sh
# Verify files present in folder backups: 
ls -R
# View contents of all files backups: 
cat diskuse/disk_usage.txt freedisk/free_disk.txt freemem/free_mem.txt openlist/open_list.txt


# Command to copy `system` to system-wide cron directory:
sudo cp system.sh /etc/cron.weekly/system.sh
---

### Step 4. Manage Log File Sizes
 
# Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file. 

 #   Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log`.

 #   - Add your config file edits below:

    ```bash
   /var/log/auth.log {
    missingok
    notifempty
    weekly
    compress
    delaycompress
    rotate 7
}
    ```
---

### Bonus: Check for Policy and File Violations

# Command to verify `auditd` is active:
systemctl status auditd.service

# Command to set number of retained logs and maximum log file size:
# Add the edits made to the configuration file below:
    ```
max_log_file = 35
num_logs = 7
    ```
# Command using `auditd` to set rules for `/etc/shadow`, `/etc/passwd` and `/var/log/auth.log`:
# Add the edits made to the `rules` file below:

    ```bash
-w /etc/shadow -p wra -k hashpass_audit
-w /etc/passwd -p wra -k userpass_audit
-w /var/log/auth.log -pr wra -k authlog_audit
    ```

# Command to restart `auditd`:
service auditd restart

# Command to list all `auditd` rules:
sudo auditctl -l

# Command to produce an audit report:
sudo aureport -au -i

# Command to use `auditd` to watch `/var/log/cron`:
sudo auditctl -w /var/log/cron -p wra -k cron-audit

# Command to verify `auditd` rules:
sudo auditctl -l
---

### Bonus (Research Activity): Perform Various Log Filtering Techniques

# Command to return `journalctl` messages with priorities from emergency to error:
sudo journalctl -p err -b

# Command to check the disk usage of the system journal unit since the most recent boot:
sudo journalctl --disk-usage -b -u systemd-journald

# Command to remove all archived journal files except the most recent two:
sudo journalctl --flush --rotate
sudo journalctl --vacuum-files=2

# Command to filter all log messages with priority levels between zero and two, and save output to `/home/sysadmin/Priority_High.txt`:
sudo journalctl -p 2 -b > ~/Priority_High.txt

# Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below:

# Bash file content run by cronjob (called ‘priority_script.sh’):
    ```bash
  #!/bin/bash
echo "Priority logs: $(journalctl -p 2 -b)" > ~/Priority_High.txt
    ```
# Crontab file edit running priority_script.sh:
0 1 * * * /home/sysadmin/Projects/priority_script.sh
