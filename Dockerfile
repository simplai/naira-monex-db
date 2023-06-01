FROM registry.redhat.io/rhel9/postgresql-13
#FROM registry.access.redhat.com/ubi8/postgresql-10

#VOLUME /var/lib/pgsql/data

ENV POSTGRESQL_USER=admin
ENV POSTGRESQL_PASSWORD=s3cr3tPassW00rd
ENV POSTGRESQL_DATABASE=naira

ADD dump.sql .
ADD dump01062023c.sql .
ADD dump01062023s.sql .