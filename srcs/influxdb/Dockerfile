# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 16:23:49 by esobchak          #+#    #+#              #
#    Updated: 2021/05/18 18:03:29 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

# Configure Supervisor :

COPY ./supervisord.conf /etc/supervisord.conf

# Configure Telegraf :

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Install and Configure Influxdb :

RUN apk add influxdb

# Expose Port :
EXPOSE 8086

# Start Supervisor :
ENTRYPOINT supervisord
