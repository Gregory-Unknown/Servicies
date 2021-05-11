# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_db.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esobchak <esobchak@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/11 17:13:41 by esobchak          #+#    #+#              #
#    Updated: 2021/05/11 17:15:34 by esobchak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

mariadb-install-db --user=root
mysqld --user=root & sleep 10
mysql --user=root --execute="CREATE DATABASE wordpress;"
mysql --user=root wordpress < mysql.sql
mysql --user=root --execute="CREATE USER 'groot'@'%' IDENTIFIED BY 'esobchak';
							GRANT ALL PRIVILEGES ON *.* TO 'groot'@'%' WITH GRANT OPTION;
							USE wordpress;
							FLUSH PRIVILEGES;"

supervisord