FROM centos:6.10

RUN yum install -y vim
ENV TZ Asia/Tokyo

RUN yum -y install httpd
COPY httpd.conf /etc/httpd/conf/httpd.conf

RUN yum -y install php php-cli php-common php-gd php-mbstring php-mcrypt php-pdo php-pear php-pgsql
RUN ["touch", "/var/log/php.log"]
RUN ["chmod", "a+w", "/var/log/php.log"]

RUN curl -sS https://getcomposer.org/installer | php

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
WORKDIR /var/www/html
EXPOSE 80