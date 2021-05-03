# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:57:59 by esobchak          #+#    #+#              #
#    Updated: 2021/05/03 15:58:06 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "Start minikube : "

minikube start --vm-driver=docker
#minikube start --driver=docker

echo "get additions : "

minikube addons enable dashboard
minikube addons enable metallb

echo "get docker daemon : "

eval $(minikube docker-env)

echo "build images : "

docker build -t nginx srcs/nginx

echo "Start services : "

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml

kubectl get pods -l app=nginx
kubectl get svc

echo "Start dashboards : "

minikube dashboard
