# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/10 12:35:25 by esobchak          #+#    #+#              #
#    Updated: 2021/05/13 13:13:33 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

RUN echo "Install DB"

RUN apk add mysql mysql-client\
    mariadb mariadb-common mariadb-client

RUN echo "Configure Supervisor"

COPY ./supervisord.conf /etc/supervisord.conf

RUN echo "Configure Telegraf"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN echo "Configure DB"

RUN mkdir -p /run/mysqld/
RUN chmod -R 777 /var/lib/mysql/
COPY ./my.cnf /etc/
COPY ./mysql.sql /
COPY ./init_db.sh /

RUN echo "Host dir"

VOLUME ["/var/lib/mysql"]

RUN echo "Expose Port"

EXPOSE 3306

RUN echo "Start DB and Supervisor"

ENTRYPOINT sh init_db.sh