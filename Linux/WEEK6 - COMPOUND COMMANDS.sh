# Compound Commands

# Create a research directory and copy all system logs as well as the `shadow`, `passwd`, and `hosts` files in one long command.

mkdir ~/research && cp -r /var/log/* /etc/passwd /etc/shadow /etc/hosts ~/research

# We'll use `&&` to combine the two following commands together:

mkdir ~/research && sudo cp -r /var/log/* /etc/passwd /etc/shadow /etc/hosts ~/research

# Create a list of all `exec` files and save it to a text file in the research folder using one long command.

sudo find /home -type f -perm 777 > ~/research/exec_lst.txt

sudo find /home -type f -perm 777 > ~/research/exec_lst.txt

cd /home/sysadmin/research

cat exec_lst.txt


# Create a list of the 10 most active processes. The list should only contain the `USER`, `PID`, `%CPU`, `%MEM` and `COMMAND`. Save this list to a text file in your research directory with  long command.

ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head > ~/research/top_processes.txt


# Parsing the output of the `ps` command will require using a program like `awk`.

ps aux --sort -%mem

ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'}


ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head > ~/research/top_processes.txt


#### Bonus


ls /home > ~/research/users.txt && cat /etc/passwd | awk -F ":" '{if ($3 >= 1000) print $0}' >> ~/research/users.txt