## Solution Guide: Creating Aliases


# Create an alias in your `~/.bashrc` file for `ls -a`.

echo "alias lsa='ls -a'" >> ~/.bashrc



echo "alias lsa='ls -a'" >> ~/.bashrc && source ~/.bashrc



# Create an alias in your `~/.bashrc` file for `cd ~/Documents`, `cd ~/Downloads`, `cd /etc`.

    Use the following command structure `alias docs='cd ~/Documents'` for each directory.

echo "alias docs='cd ~/Documents'" >> ~/.bashrc

echo "alias dwn='cd ~/Downloads'" >> ~/.bashrc

echo "alias etc='cd /etc'" >> ~/.bashrc


tail -4 ~/.bashrc


echo "alias rc='nano ~/.bashrc'" >> ~/.bashrc

source ~/.bashrc

lsa

docs

rc


mkdir ~/research && cp /var/logs/* /etc/passwd /etc/shadow /etc/hosts ~/research

echo "alias logs='mkdir ~/research && cp /var/logs/* /etc/passwd /etc/shadow /etc/hosts ~/research'" >> ~/.bashrc


source ~/.bashrc