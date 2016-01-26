FROM continuumio/miniconda3

RUN apt-get update && \
	apt-get -y --force-yes install nginx supervisor

RUN conda install --yes gunicorn flask

COPY app .
EXPOSE 80
CMD supervisord -c /supervisord.conf -n
