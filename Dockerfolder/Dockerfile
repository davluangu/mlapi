FROM continuumio/miniconda3:latest

RUN apt-get update && apt-get install -y \
    tmux \
    nginx \
    gunicorn

CMD tmux

RUN conda update conda -y && conda create -y --name mlapp \
    flask

RUN source activate mlapp

RUN mkdir /home/www
