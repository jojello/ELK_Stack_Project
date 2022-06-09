## Solution Guide: Users and Groups

 id

running id sysadmin

id sysadmin >> ~/research/user_ids.txt

groups sysadmin

groups sysadmin >> ~/research/user_groups.txt

# Document in your research folder anything suspicious related to any of the users.


sudo usermod -G jack jack.

# Remove any users from the system that should not be there.

sudo deluser --remove-home jack

sudo addgroup developers 
sudo usermod -G developers sysadmin

7. The users adam, billy, sally and max should only be members of the developers group and their own groups. If you find any groups other than this, document the group and remove it.

      sudo delgroup hax0rs
