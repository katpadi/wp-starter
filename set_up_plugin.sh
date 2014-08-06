#!/bin/sh
chmod -R 777 wp-content
curl -L https://github.com/tommcfarlin/WordPress-Plugin-Boilerplate/archive/master.tar.gz | tar xz
mv WordPress-Plugin-Boilerplate-master WordPress-Plugin-Boilerplate
mv WordPress-Plugin-Boilerplate wp-content/plugins/
