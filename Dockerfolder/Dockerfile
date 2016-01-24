FROM continuumio/miniconda3:latest

RUN apt-get update && apt-get install -y \
    git \
    vim \
    tmux \
    nginx \
    gunicorn

RUN conda update conda -y && conda create -y --name app_env \
    flask

RUN source activate app_env

RUN git clone http://www.github.com/davluangu/mlapi

RUN /etc/init.d/nginx start
RUN rm /etc/nginx/sites-enabled/default
RUN touch /etc/nginx/sites-available/mlapi
RUN ln -s /etc/nginx/sites-available/mlapi /etc/nginx/sites-enabled/mlapi
