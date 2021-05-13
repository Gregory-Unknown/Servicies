# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:57:59 by esobchak          #+#    #+#              #
#    Updated: 2021/05/13 10:46:15 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "Start minikube : "

minikube start --vm-driver=virtualbox
#minikube start --driver=docker


echo "get additions : "

minikube addons enable dashboard
minikube addons enable metallb

echo "get docker daemon : "

eval $(minikube docker-env)

echo "build images : "
docker build -t ft_nginx srcs/nginx
docker build -t ft_php srcs/php
docker build -t ft_wp srcs/wp
docker build -t ft_mysql srcs/mysql

echo "Start services : "

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/php.yaml
kubectl apply -f srcs/wp.yaml
kubectl apply -f srcs/mysql.yaml

echo "Start dashboards : "

minikube dashboard
