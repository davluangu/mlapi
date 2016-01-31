FROM nginx

# Force bash always
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    curl \
    bzip2 \
    vim \
    supervisor

EXPOSE 80

ENV CONDA_INSTALLER="Miniconda3-latest-Linux-x86_64.sh"
ENV PATH=/miniconda/bin:$PATH

RUN curl -O http://repo.continuum.io/miniconda/${CONDA_INSTALLER}
RUN bash ${CONDA_INSTALLER} -b -p /miniconda
RUN rm ${CONDA_INSTALLER}

RUN conda update conda
RUN conda install flask gunicorn

COPY app /var/www/html
COPY supervisord.conf /etc/supervisor/supervisord.conf

RUN rm /etc/nginx/conf.d/*
COPY nginx.conf /etc/nginx/nginx.conf
