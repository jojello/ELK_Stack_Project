# WEEK4 - HOMEWORK SUBMISSION

### Step 1: Ensure/Double Check Permissions on Sensitive Files

# Permissions on `/etc/shadow` should allow only `root` read and write access.

ls -l shadow

sudo chmod 600 shadow

# Permissions on `/etc/gshadow` should allow only `root` read and write access.

ls -l gshadow

sudo chmod 600 gshadow

# Permissions on `/etc/group` should allow `root` read and write access, and allow everyone else read access only.

ls -l group

sudo chmod 644 group

# Permissions on `/etc/passwd` should allow `root` read and write access, and allow everyone else read access only.

ls -l passwd

sudo chmod 644 passwd

### Step 2: Create User Accounts

# Add user accounts for `sam`, `joe`, `amy`, `sara`, and `admin`.


sudo adduser sam
sudo adduser joe
sudo adduser amy
sudo adduser sara
sudo adduser admin

# Ensure that only the `admin` has general sudo access.

sudo usermod -aG sudo admin

### Step 3: Create User Group and Collaborative Folder

# Add an `engineers` group to the system.

sudo groupadd engineers

# Add users `sam`, `joe`, `amy`, and `sara` to the managed group.

sudo gpasswd -M sam,sara,joe,amy engineers

# Create a shared folder for this group at `/home/engineers`.

  
sudo mkdir engineers

# Change ownership on the new engineers' shared folder to the `engineers` group.

sudo chgrp -R engineers engineers

### Step 4: Lynis Auditing

# Command to install Lynis:
sudo apt-get install lynis

# Command to see documentation and instructions:
man lynis

# Command to run an audit:
sudo lynis audit system



### Bonus
# Command to install chkrootkit: 
sudo apt install chkrootkit -y

# Command to see documentation and instructions:
man chkrootkit

# Command to run expert mode:
sudo chkrootkit -x
