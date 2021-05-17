# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 15:18:00 by esobchak          #+#    #+#              #
#    Updated: 2021/05/15 14:06:49 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

# Install and Configure FTPS :

RUN apk add vsftpd
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

# Configure SSL :

RUN mkdir -p home/user/ && chmod -R 777 home/
RUN mkdir -p /etc/ssl/vsftpd/ && chmod -R 777 /etc/ssl/vsftpd/

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=ESOBCHAK/CN=cert"\
 -newkey rsa:2048\
 -keyout /etc/ssl/vsftpd/ftpd.key\
 -out /etc/ssl/vsftpd/ftpd.crt

# Install and Configure SSH :

RUN apk add openssh
RUN adduser -D groot && echo "groot:esobchak" | chpasswd

# Configure Supervisor :

COPY ./supervisord.conf /etc/supervisord.conf

# Configure Telegraf :

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Expose Port :
EXPOSE 21 1025

# Start Supervisor :
ENTRYPOINT supervisord