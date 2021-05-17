# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:57:59 by esobchak          #+#    #+#              #
#    Updated: 2021/05/15 11:33:35 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Start minikube :
minikube start --vm-driver=virtualbox

# Get additions :

minikube addons enable dashboard
minikube addons enable metallb

# Get docker daemon :

eval $(minikube docker-env)

# Build images :

docker build -t ft_nginx srcs/nginx
docker build -t ft_php srcs/php
docker build -t ft_wp srcs/wp
docker build -t ft_mysql srcs/mysql
docker build -t ft_ftps srcs/ftps
docker build -t ft_grafana srcs/grafana
docker build -t ft_influxdb srcs/influxdb

# Start services :

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/php.yaml
kubectl apply -f srcs/wp.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/influxdb.yaml

# Start dashboards :

minikube dashboard
