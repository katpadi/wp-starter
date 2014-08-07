#!/bin/sh
# Set up whatever shit
for arg in "$@"
do
	# Check if it's not the first time
	who_owns=`ls -ld wp-content | awk '{print $3}'`
	# If it's not www-data, there's not problem
	if [ "$who_owns" != "www-data" ]
	then
		if [ "$arg" = "theme" ]
		then
		    echo "Setting up _s..."
			chmod -R 777 wp-content
			curl -L https://github.com/Automattic/_s/archive/master.tar.gz | tar xz
			mv _s-master _s
			# wont overwrite, promise
			mv --backup=t _s/ wp-content/themes/
		elif [ "$arg" = "plugin" ]
		then
			echo "Setting up Tom McFarlin's plugin boilerplate..."
			chmod -R 777 wp-content
			curl -L https://github.com/tommcfarlin/WordPress-Plugin-Boilerplate/archive/master.tar.gz | tar xz
			mv WordPress-Plugin-Boilerplate-master WordPress-Plugin-Boilerplate
			mv --backup=t WordPress-Plugin-Boilerplate/plugin-name/ wp-content/plugins/
			rm -rf WordPress-Plugin-Boilerplate/
		else
			# do normal startup
		    continue
		fi
	else
		echo "WARNING: Can't continue. Needs human intervention"
		echo "BLOCKER: wp-content is owned by www-data"
		echo "Run this command first:"
		echo "######################";
		echo "\nsudo chown -R \"${USER}:\" wp-content\n"
		echo "######################";
		exit
	fi
done
# fig stuff
export MYSQL_ROOT_PASSWORD=password # change to whatever password
#export MYSQL_DATABASE=password # change_me to whatever DB name
fig up -d mysql
echo "Waiting for 5 seconds for DB to start up";
sleep 5
fig up -d --no-deps wordpress

echo "######################";
echo "\nWoot! We're done!\n";
echo "######################";