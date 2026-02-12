# Django Template

![django test workflow](https://github.com/joeriksson/django-template/actions/workflows/django.yml/badge.svg)


A project template to use with Django projects. Includes:

- pages app
- users app
- custom user model (email instead of username)
- e-mail verification
- django debug toolbar (only in development)
- docker files for spinning up containers (python and postgresql)
- basic tests for pages and users
- different settings files for development and production

The biggest part of this project I got from the ["Django for professionals"](https://djangoforprofessionals.com) book, and built on what I learned going through its chapters. My thought was to have something to use as a baseline when building my own Django apps.

I could have used the [DjangoX](https://github.com/wsvincent/djangox) repo to get a ready made template. But I wanted to build it my self and choose what should be in it. Also I've built this to learn Django better myself.  

## Production and development settings

The setting file are split up in production and a development settings files. Also the project have one docker-compose.yml for production and one for development. Within the docker-compose files you can find the parameter for which settings file to use on the runserver command. To make it easier and less to type for each command, there is a Makefile with different common operations.

## Quick start

> Note: For a more detailed instruction how to use this template, see my blog post - [How to get started with my Django template](https://joeriksson.io/blog/how-to-get-started-with-my-django-template/)

1. Clone this repository

` https://github.com/Joeriksson/django-template.git`

2. Install [Docker Desktop](https://www.docker.com/products/docker-desktop) to be able to use the docker environment.

3. Create an .env file in the root folder with the the following parameters:

    ```ENVIRONMENT='development'
    SENDGRID_PASSWORD=<you sendgrid password>
    SENDGRID_USERNAME=<your sendgrid username>
    SECRET_KEY=<your secret key>
    DEBUG=True
    ```

4. In the directory where you cloned the repository, run the following command:

    `make dev_build`

5. Run a migration to build the databases

    `make dev_web_exec cmd='python manage.py migrate'`
    
    Then check in you browser that you see a start web page at `http://127.0.0.1:8000`

6. Create a Django super user to log in to the admin

    `make dev_web_exec cmd='python manage.py createsuperuser'`

7. Goto `http://127.0.0.1:8000/admin` and login with the super user account you just created.

8. Go on and build you app.

If you want to stop the container run:

  `make dev_down`

## Local Python environment with uv

If you want to run the app locally without Docker:

1. Install `uv` from [astral.sh/uv](https://docs.astral.sh/uv/).
2. Sync dependencies:
   `uv sync --frozen --no-install-project`
3. Run commands through uv:
   `uv run python manage.py migrate`
   `uv run python manage.py runserver`

## Run GitHub Actions locally with act

If you want to test the CI workflow locally:

1. Install [`act`](https://nektosact.com/installation/).
2. Make sure Docker is running.
3. Run one workflow matrix entry at a time:
   `make act_ci_310`
   `make act_ci_311`
   `make act_ci_312`

You can also run all local matrix checks sequentially:
`make act_ci_all`
