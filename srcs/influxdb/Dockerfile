# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 16:23:49 by esobchak          #+#    #+#              #
#    Updated: 2021/05/15 12:29:47 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

# Install and Configure Influxdb :

RUN apk add influxdb

# Configure Supervisor :

COPY ./supervisord.conf /etc/supervisord.conf

# Configure Telegraf :

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Expose Port :
EXPOSE 8086

# Start Supervisor :
ENTRYPOINT supervisord