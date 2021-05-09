# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:58:55 by esobchak          #+#    #+#              #
#    Updated: 2021/05/03 15:59:11 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.11.11

#RUN echo -e "http://nl.alpinelinux.org/alpine/v3.12/main\nhttp://nl.alpinelinux.org/alpine/v3.12/community" > /etc/apk/repositories

#RUN echo "Install Utilities"

#RUN apk update

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

RUN echo "Expose Port"
EXPOSE 80 443

RUN echo "Start Supervisor"
ENTRYPOINT supervisord
#CMD ["/usr/bin/supervisord"]
