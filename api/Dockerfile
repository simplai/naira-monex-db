FROM python:3.7

COPY ./requirements.txt /api/requirements.txt
WORKDIR /api
RUN pip install -r requirements.txt
COPY ./ /api/
ENV FLASK_ENV development
ENV FLASK_APP api.api.py
EXPOSE 5000

CMD ["python", "api.py"]
#production
#CMD ["uwsgi", "uwsgi.ini"]
