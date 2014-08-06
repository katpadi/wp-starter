FROM wordpress
MAINTAINER Kat Padilla <hello@katpadi.ph>

RUN rm -rf /var/www/html/wp-content/themes/*

# PHP5 and Apache2 stuff
# Add configurations here
# RUN echo "upload_max_filesize = 8M;" >> /etc/php5/apache2/php.ini
# RUN echo "post_max_size = 10M;" >> /etc/php5/apache2/php.ini