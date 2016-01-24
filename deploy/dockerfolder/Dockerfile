FROM continuumio/miniconda3:latest

RUN apt-get update && apt-get install -y \
    git \
    vim \
    tmux \
    nginx \
    gunicorn \
    supervisor

RUN conda update conda -y && conda create -y --name webapp_env flask
RUN source activate webapp_env

RUN mkdir /home/www && cd /home/www
RUN git clone http://www.github.com/davluangu/mlapi mlapi

RUN /etc/init.d/nginx start
RUN rm /etc/nginx/sites-enabled/default
RUN cp /home/www/mlapi/deploy/nginx/mlapi /etc/nginx/sites-available/mlapi
RUN ln -s /etc/nginx/sites-available/mlapi /etc/nginx/sites-enabled/mlapi
RUN /etc/init.d/nginx restart

RUN /home/www/mlapi/
RUN gunicorn app:app -b localhost:8000
