# FROM registry.access.redhat.com/ubi8/nginx-120
FROM registry.redhat.io/rhel9/postgresql-15

ENV POSTGRESQL_USER=admin
ENV POSTGRESQL_PASSWORD=admin
ENV POSTGRESQL_DATABASE=naira

#ENV NGINX_VERSION=1.20
#
## Add application sources
#ADD $NGINX_VERSION/test-app/nginx.conf "${NGINX_CONF_PATH}"
#ADD $NGINX_VERSION/test-app/nginx-default-cfg/*.conf "${NGINX_DEFAULT_CONF_PATH}"
#ADD $NGINX_VERSION/test-app/nginx-cfg/*.conf "${NGINX_CONFIGURATION_PATH}"
#ADD $NGINX_VERSION/test-app/*.html ./
#
## Run script uses standard ways to run the application
#CMD nginx -g "daemon off;"