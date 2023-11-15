FROM registry.redhat.io/rhel9/postgresql-13
#FROM registry.access.redhat.com/ubi8/postgresql-10


ENV POSTGRESQL_USER=admin
ENV POSTGRESQL_PASSWORD=s3cr3tPassW00rd
ENV POSTGRESQL_DATABASE=naira

LABEL org.opencontainers.image.source https://github.com/simplai-monex/naira

USER 1000740000:1000

ADD dump.sql .
ADD check_db.sh .


CMD ["chmod", "+x",  "check_db.sh"]
#RUN chmod +x check_db.sh
CMD ["./check_db.sh"]