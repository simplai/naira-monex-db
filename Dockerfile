FROM registry.redhat.io/rhel9/python-39


# Add application sources with correct permissions for OpenShift
USER 0
ADD api/ .
RUN chown -R 1001:0 ./
USER 1001

RUN pip install -U "pip>=19.3.1" && \
    pip install -r requirements.txt

ENV FLASK_ENV=development
ENV FLASK_APP=api
ENV FLASK_SECRET=b'_5#y2L"F4Q8z\n\xec]/'

CMD ["flask", "run"]

#FROM registry.redhat.io/rhel9/postgresql-13
#
#ENV POSTGRESQL_USER=admin
#ENV POSTGRESQL_PASSWORD=admin
#ENV POSTGRESQL_DATABASE=naira

# FROM registry.access.redhat.com/ubi8/nginx-120

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