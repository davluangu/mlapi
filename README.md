# Machine Learning API
The goal of this project is to productionize Python predictive models as dockerized REST microservices. I am currently exploring this project from the top of the stack going downward simply because that is where I am currently getting the most return on learnings per unit time.

#### Status: WIP
This is my tinkering around with various technologies. Until I remove the WIP and start tagging commits, everything is probably broken.

#### Planned stack:
- Docker 
- [nginx](https://hub.docker.com/_/nginx/) (based on a ~135mb Debian image) 
- gunicorn
- supervisor
- [conda](http://conda.pydata.org/docs/intro.html)
- Flask-RESTful [tutorial here](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask)
- Postgres (via SQL-Alchemy)
- scikit-learn, xgboost (predictive modeling)
- Seaborn (data visualization)

### Docker notes:
I decided to start from the official nginx docker image because nginx is at the top of my stack (I'm not sure if that is a good reason). 

##### Build the docker image:
```bash
docker build -t mlapi-nginx .
```
##### Run the docker image:
```bash
docker run -it -p 80:8000 --name mlapi_interact mlapi-nginx /bin/bash
docker run -it -p 80:8000 --name mlapi_deploy mlapi-nginx
```

##### Stop and remove all docker images:
```bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

###### References:
- [http://docs.gunicorn.org/en/stable/deploy.html](http://docs.gunicorn.org/en/stable/deploy.html)
- [https://realpython.com/blog/python/kickstarting-flask-on-ubuntu-setup-and-deployment/](https://realpython.com/blog/python/kickstarting-flask-on-ubuntu-setup-and-deployment/)
- [http://supervisord.org/configuration.html](http://supervisord.org/configuration.html)
- [https://github.com/danriti/nginx-gunicorn-flask](https://github.com/danriti/nginx-gunicorn-flask)

