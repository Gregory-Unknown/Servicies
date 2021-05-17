# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/10 12:35:25 by esobchak          #+#    #+#              #
#    Updated: 2021/05/15 11:49:14 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

# Install DB :

RUN apk add mysql mysql-client\
    mariadb mariadb-common mariadb-client

# Configure Supervisor :

COPY ./supervisord.conf /etc/supervisord.conf

# Configure Telegraf :

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Configure DB :

RUN mkdir -p /run/mysqld/
RUN chmod -R 777 /var/lib/mysql/
COPY ./my.cnf /etc/
COPY ./mysql.sql /
COPY ./init_db.sh /

# Host dir :

VOLUME ["/var/lib/mysql"]

# Expose Port :

EXPOSE 3306

# Start DB and Supervisor :

ENTRYPOINT sh init_db.sh