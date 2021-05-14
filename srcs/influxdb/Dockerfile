# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 16:23:49 by esobchak          #+#    #+#              #
#    Updated: 2021/05/14 16:25:12 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx

RUN echo "Install and Configure Influxdb"

RUN apk add influxdb

RUN echo "Configure Supervisor"

COPY ./supervisord.conf /etc/supervisord.conf

RUN echo "Configure Telegraf"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN echo "Expose Port"
EXPOSE 8086

RUN echo "Start Supervisor"
ENTRYPOINT supervisord