# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/10 12:35:20 by esobchak          #+#    #+#              #
#    Updated: 2021/05/11 13:21:08 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

RUN echo "Configure Nginx"

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN echo "Configure Supervisor"

COPY ./supervisord.conf /etc/supervisord.conf


Run echo "Install and Configure PhPmyAdmin"

RUN mkdir -p /run/php

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.7.6/phpMyAdmin-4.7.6-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.7.6-all-languages.tar.gz
RUN mv phpMyAdmin-4.7.6-all-languages/* /www/
RUN rm -rf phpMyAdmin-4.7.6-all-languages
COPY ./config.inc.php /www/phpmyadmin/

RUN echo "Configure Telegraf"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN echo "Expose Port"
EXPOSE 5000

RUN echo "Start Supervisor"
ENTRYPOINT supervisord