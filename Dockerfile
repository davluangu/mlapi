FROM nginx

# Force bash always
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    curl \
    bzip2 \
    vim \
    supervisor

EXPOSE 80

# install conda
ENV CONDA_INSTALLER="Miniconda3-latest-Linux-x86_64.sh"
ENV PATH=/miniconda/bin:$PATH

RUN curl -O http://repo.continuum.io/miniconda/${CONDA_INSTALLER}
RUN bash ${CONDA_INSTALLER} -b -p /miniconda
RUN rm ${CONDA_INSTALLER}

# install python packages into root conda environment
RUN conda update conda
RUN conda install flask gunicorn

# copy flask app
COPY app /var/www/html

# copy supervisor configuration
COPY mlapi.conf /etc/supervisor/conf.d/mlapi.conf

# copy nginx configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY flask.conf /etc/nginx/conf.d/flask.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf"]
