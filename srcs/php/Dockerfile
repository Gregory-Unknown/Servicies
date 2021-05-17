# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/10 12:35:20 by esobchak          #+#    #+#              #
#    Updated: 2021/05/15 11:38:48 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

# Configure Nginx :

COPY ./default.conf /etc/nginx/conf.d/default.conf

# Configure Supervisor :

COPY ./supervisord.conf /etc/supervisord.conf


# Install and Configure PhPmyAdmin :

RUN mkdir -p /run/php

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mkdir -p /www/phpmyadmin
RUN tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages/* /www/phpmyadmin/
RUN rm -rf phpMyAdmin-5.1.0-all-languages
COPY ./config.inc.php /www/phpmyadmin/

# Configure Telegraf :

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Expose Port :
EXPOSE 5000

# Start Supervisor :
ENTRYPOINT supervisord