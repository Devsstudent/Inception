FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN mkdir /var/run/mysqld; \
	chmod 777 /var/run/mysqld;

ADD setup.sh setup.sh

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

RUN echo  "[mysqld]\n\
skip-networking=0\n\
bind-address=0.0.0.0" >> /etc/mysql/my.cnf
ENTRYPOINT ["/bin/bash", "-c", "/setup.sh"]
