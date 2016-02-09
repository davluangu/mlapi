FROM nginx

# Force bash always
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    curl \
    bzip2 \
    vim \
    git \
    build-essential \
    supervisor

EXPOSE 80

# install conda
ENV CONDA_INSTALLER="Miniconda3-latest-Linux-x86_64.sh"
ENV PATH=/miniconda/bin:$PATH

RUN curl -O http://repo.continuum.io/miniconda/${CONDA_INSTALLER}
RUN bash ${CONDA_INSTALLER} -b -p /miniconda
RUN rm ${CONDA_INSTALLER}

# install python packages into root conda environment
RUN conda update -y conda
RUN conda install -y flask gunicorn boto3 ipython pandas

# install xgboost
RUN git clone --recursive https://github.com/dmlc/xgboost
RUN cd xgboost; make -j4

# copy flask app
COPY app /var/www/html

# copy supervisor configuration
COPY supervisord.conf /etc/supervisor/supervisord.conf

# copy nginx configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx_flask.conf /etc/nginx/conf.d/nginx_flask.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
