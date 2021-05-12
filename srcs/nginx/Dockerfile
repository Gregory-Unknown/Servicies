# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:58:55 by esobchak          #+#    #+#              #
#    Updated: 2021/05/12 17:15:33 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11.11

RUN echo "Install Utilities"

RUN apk update
RUN apk add wget
RUN apk add tar

RUN mkdir -p /www

RUN echo "Install and Configure Nginx"

RUN apk add nginx
RUN mkdir -p /run/nginx
COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN echo "Install and Configure Supervisor"

RUN apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf
RUN echo "Install and Configure SSL"

RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=ESOBCHAK/CN=cert"\
 -newkey rsa:2048\
 -keyout /etc/ssl/nginx-selfsigned.key\
 -out /etc/ssl/nginx-selfsigned.crt


RUN echo "Install and Configure Telegraf"

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
	mkdir -p /etc/telegraf
	#mv ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN echo "Install PHP"

RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session\
	php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi \
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN echo "Expose Port"
EXPOSE 80 443

RUN echo "Start Supervisor"
ENTRYPOINT supervisord