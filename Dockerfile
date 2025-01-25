FROM registry.redhat.io/rhel9/postgresql-13
#FROM registry.access.redhat.com/ubi8/postgresql-10


ENV POSTGRESQL_USER=admin
ENV POSTGRESQL_PASSWORD=s3cr3tPassW00rd
ENV POSTGRESQL_DATABASE=naira

LABEL org.opencontainers.image.source https://github.com/simplai-monex/naira

#USER 1000740000:1000

ADD dump.sql .

COPY --chmod=0755 check_db.sh /docker-entrypoint-initdb.d/

#CMD ["bash", "check_db.sh"]