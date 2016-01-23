FROM continuumio/miniconda3:latest

RUN tmux

RUN apt-get update && apt-get install -y \
    nginx \
    gunicorn

RUN conda update conda -y && conda create -y --name mlapp \
    flask

