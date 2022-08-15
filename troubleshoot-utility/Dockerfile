FROM centos:7

RUN yum install -y epel-release

RUN yum install -y nginx

COPY default.conf /etc/nginx/conf.d/default.conf

COPY index.html /usr/share/nginx/html/rohit/index.html

COPY start_nginx.sh /etc/nginx/start_nginx.sh

ENTRYPOINT ["bash", "/etc/nginx/start_nginx.sh"]

CMD ["Docker"]
