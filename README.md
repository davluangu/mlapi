# [WIP] Machine Learning API
#### Goal
Produce productionizable Python predictive models as dockerized REST APIs. I am currently exploring this project from the top of the stack going downward simply because that is where I am currently getting the most return on learnings per unit time.

#### Status
This is my tinkering around with various technologies. Until I remove the WIP and start tagging commits, everything is probably broken.

#### Planned stack:
- Docker 
- [nginx](https://hub.docker.com/_/nginx/) (this is based on a ~100mb Debian image) 
- gunicorn
- supervisor
- [conda](http://conda.pydata.org/docs/intro.html)
- Flask-RESTful [tutorial here](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask)
- Postgres (via SQL-Alchemy)
- scikit-learn, xgboost (predictive modeling)
- Seaborn (data visualization)

### Docker notes:
#####From the repo's root directory:
```bash
docker build -t --name mlapi-nginx .
```

#####Stop and remove all docker images:
```bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```
