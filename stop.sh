# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    stop.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/03 15:58:12 by esobchak          #+#    #+#              #
#    Updated: 2021/05/03 15:59:11 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

echo "Clean minikube : "

minikube stop
minikube delete --all