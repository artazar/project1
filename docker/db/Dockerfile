FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=1q2w3e
ENV MYSQL_DATABASE=wordpress
RUN echo 'bind-address    = 127.0.0.1' >> /etc/mysql/my.cnf && echo 'default_authentication_plugin = mysql_native_password' >> /etc/mysql/my.cnf
