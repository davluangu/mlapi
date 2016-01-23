FROM continuumio/miniconda3:latest

RUN conda update conda -y && conda create -y --name mlapp \
    flask

