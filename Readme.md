# Django Template

A project template to use with Django projects. Includes:

- pages app
- users app
- custom user model (email instead of username)
- e-mail verification
- django debug toolbar
- docker files for spinning up containers (python and postgresql)
- basic tests for pages and users

The biggest part of this project I got from the ["Django for professionals"](https://djangoforprofessionals.com) book, and built on what I learned going through its chapters. My thought was to have something to use as a base when building my own Django apps.

I could have used the [DjangoX](https://github.com/wsvincent/djangox) repo to get a ready made template. But I wanted to build it my self and choose what should be in it. Also I've built this to learn Django better myself.  

## Quick start

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

3. In the directory where you cloned the repository, run the following command:

`docker-compose up -d --build`

4. The container should now be up and running. Check in you browser that you see a start web page at `http://127.0.0.1:8080`

5. Run a migration to build the databases

`docker-compose exec web python manage.py migrate`

6. Create a Django super user to log in to the admin

`docker-compose exec web python manage.py createsuperuser`

7. Goto `http://127.0.0.1:8080/admin` and login with the super user account you just created.

8. Go on and build you app.

If you want to stop the container run:

`docker-compose down`

## Don't want to use SMTP email service?

This project template is configured to use the Sendgrid smtp service, to send verifications links at signup etc.
If you don't want to use that functionality, change this line in the settings.py:

`EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'`

to

`EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'`

The emails will then be send to the console in the docker container, and can be viewed with:

`docker-compose logs`

And you can also comment out the whole following section in settings.py:

```EMAIL_HOST = 'smtp.sendgrid.net'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_PASSWORD = os.environ['SENDGRID_PASSWORD']
EMAIL_HOST_USER = os.environ['SENDGRID_USERNAME']
```

## Django debug toolbar

As long as DEBUG (currently read from the .env file) is true, the Django debug toolbar will be visible in the web app. This is set with an if statement in the project/urls.py.

## Known Issues

I haven't yet got the test for the EditProfile to work. Will spend more time on it further on.

https://github.com/Joeriksson/django-template/issues/1
