#!/bin/bash
# old_groups.sh
# Writing out old users' groups

# path to list of users
USERS=/home/jcsheeron/linuxAdmin/users.list
# path to group list
echo -n > /home/jcsheeron/linuxAdmin/groups.list

for user in 'cat "$USERS" | cut -d':' -f1' ; do
	echo -n "$user": >> /home/jcsheeron/linuxAdmin/groups.list
	sudo -u "$user" groups | tee -a /home/jcsheeron/linuxAdmin/groups.list
done
#End of script

