# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 15:18:00 by esobchak          #+#    #+#              #
#    Updated: 2021/05/14 15:47:46 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

RUN echo "Install and Configure FTPS"

RUN apk add vsftpd
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN echo "Configure SSL"

RUN mkdir -p home/user/ && chmod -R 777 home/
RUN mkdir -p /etc/ssl/vsftpd/ && chmod -R 777 /etc/ssl/vsftpd/

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=ESOBCHAK/CN=cert"\
 -newkey rsa:2048\
 -keyout /etc/ssl/vsftpd/ftpd.key\
 -out /etc/ssl/vsftpd/ftpd.crt

RUN echo "Install and Configure SSH"

RUN apk add openssh
RUN adduser -D user && echo "user:esobchak" | chpasswd

RUN echo "Configure Supervisor"

COPY ./supervisord.conf /etc/supervisord.conf

RUN echo "Configure Telegraf"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN echo "Expose Port"
EXPOSE 21 1025

RUN echo "Start Supervisor"
ENTRYPOINT supervisord