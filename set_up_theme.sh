#!/bin/sh
chmod -R 777 wp-content
curl -L https://github.com/Automattic/_s/archive/master.tar.gz | tar xz
mv _s-master _s
mv _s wp-content/themes/