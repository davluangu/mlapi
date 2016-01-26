FROM nginx

# Force bash always
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    htop \
    git \
    vim \
    tmux \
    gunicorn \
    supervisor

# Install miniconda for python 3
RUN wget --quiet http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    chmod -R a+rx /opt/miniconda

RUN conda update -y conda

RUN conda update conda -y
RUN conda install -y flask
RUN conda install -y --name webapp_env -c https://conda.anaconda.org/asmeurer gunicorn

RUN mkdir /var/www && cd /var/www
RUN git clone http://www.github.com/davluangu/mlapi /var/www/mlapi

RUN /etc/init.d/nginx start
RUN rm /etc/nginx/sites-enabled/default
RUN cp /var/www/mlapi/deploy/nginx/mlapi /etc/nginx/sites-available/mlapi
RUN ln -s /etc/nginx/sites-available/mlapi /etc/nginx/sites-enabled/mlapi
RUN /etc/init.d/nginx restart


RUN cd /var/www/mlapi/
RUN gunicorn app:app -b localhost:8000
