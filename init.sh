#! /bin/bash

source /wagtail/bin/activate

python manage.py migrate

exec gunicorn blogsite.wsgi:application --bind 0.0.0.0:8000 --workers 3