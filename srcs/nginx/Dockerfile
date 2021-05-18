# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:58:55 by esobchak          #+#    #+#              #
#    Updated: 2021/05/18 18:03:38 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13.5

#FROM ft_alpine

# Install Utilities :

RUN apk update
#RUN apk add wget
RUN apk add openrc
#RUN apk add libc6-compat

RUN mkdir -p /www

# Install and Configure Nginx :

RUN apk add nginx
RUN mkdir -p /run/nginx
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Install and Configure Supervisor :

RUN apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf

# Install and Configure SSL :

RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=ESOBCHAK/CN=cert"\
 -newkey rsa:2048\
 -keyout /etc/ssl/nginx-selfsigned.key\
 -out /etc/ssl/nginx-selfsigned.crt


# Install and Configure Telegraf :

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Install PHP :

RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session\
	php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi \
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom


# Expose Port :
EXPOSE 80 443

# Start Supervisor :
ENTRYPOINT supervisord
