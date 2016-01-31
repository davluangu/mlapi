# [WIP] Machine Learning API
This is my tinkering around with various technologies. This is a work in progress. Until I remove the WIP and start tagging commits, everything is probabaly broken.

## Goal
Produce productionizable Python predictive models as dockerized REST APIs. I am currently exploring this project from the top of the stack going downward simply because that is where I am currently getting the most return on learnings per unit time.

## Planned stack:
- Docker 
- [nginx](https://hub.docker.com/_/nginx/) (this is based on a ~100mb Debian image) 
- gunicorn
- supervisor
- [conda](http://conda.pydata.org/docs/intro.html)
- Flask-RESTful [tutorial here](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask)
- Postgres (via SQL-Alchemy)
- scikit-learn, xgboost (predictive modeling)
- Seaborn (data visuzliation)
