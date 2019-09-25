# Django Template

A project template to use with Django projects. Includes:

- pages app
- users app
- custom user model (email instead of username)
- e-mail verification
- django debug toolbar
- docker files for spinning up containers (python and postgresql)

## Quick start

1. Clone this repository

` https://github.com/Joeriksson/django-template.git`

2. Install [Docker Desktop](https://www.docker.com/products/docker-desktop) to be able to use the docker environment.

3. In the directory where you cloned the repository, run the following command:

`docker-compose up -d --build`

4. Check in you browser that you see a start web page at `http://127.0.0.1:8080`

5. Run a migration to build the databases

`docker-compose exec web python manage.py migrate`

6. Create a Django super user to log in to the admin

`docker-compose exec web python manage.py createsuperuser`

