FROM ubuntu

RUN apt-get update && \
    apt-get install -y apche2 curl && \
    apt-get clean

ENV ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2_pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"

ADD https://github.com/victor-cleber/my_invoice/archive/refs/heads/main.zip /tmp

RUN unzip /tmp/main.zip -d /tmp

RUN mv /tmp/my_invoice-main/index.* /var/www/html

LABEL description="webserver"
LABEL version="1.0.0"

WORKDIR /var/www/html

VOLUME /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]