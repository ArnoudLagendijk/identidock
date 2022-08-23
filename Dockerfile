FROM python:3.8-buster
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install flask==2.2.2 uwsgi==2.0.20 requests==2.28.1 redis==4.3.4
WORKDIR /app
COPY app /app
COPY start.sh /
COPY uwsgi.ini /
USER uwsgi
CMD [ "/start.sh" ]
