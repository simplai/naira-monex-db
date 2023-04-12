FROM registry.redhat.io/rhel9/postgresql-13

VOLUME /var/lib/pgsql/data

ENV POSTGRESQL_USER=admin
ENV POSTGRESQL_PASSWORD=admin
ENV POSTGRESQL_DATABASE=naira

ADD dump12042023.sql .

# RUN psql -U $POSTGRESQL_USER $POSTGRESQL_DATABASE < dump03042023.sql