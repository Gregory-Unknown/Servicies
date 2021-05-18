# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 16:12:49 by esobchak          #+#    #+#              #
#    Updated: 2021/05/18 14:34:45 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM ft_nginx


# Configure Supervisor :

COPY ./supervisord.conf /etc/supervisord.conf

# Configure Telegraf

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

# Install and Configure Grafana :

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN tar -xf grafana-enterprise-7.5.4.linux-amd64.tar.gz --strip-components=1 -C /
RUN rm grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN apk --no-cache add ca-certificates
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

COPY ./grafana.db /data/grafana.db

# Expose Port

EXPOSE 3000

# Start Supervisor

ENTRYPOINT supervisord
