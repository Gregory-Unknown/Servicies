# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/10 12:35:00 by esobchak          #+#    #+#              #
#    Updated: 2021/05/11 13:40:50 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

RUN echo "Configure Nginx"

COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN echo "Configure Supervisor"

COPY ./supervisord.conf /etc/supervisord.conf

Run echo "Install and Configure Wordpress"

RUN mkdir -p /run/wp

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN mv wordpress /www/
RUN rm latest.tar.gz
COPY ./wp-config.php /www/wordpress/

RUN echo "Configure Telegraf"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN echo "Expose Port"
EXPOSE 5050

RUN echo "Start Supervisor"
ENTRYPOINT supervisord