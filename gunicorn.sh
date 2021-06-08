#!/usr/bin/env bash

NAME='ecommerce'
DJANGODIR=/home/ubuntu/git/ecommerce_backend
USER=ubuntu
GROUP=ubuntu
NUM_WORKERS=3
DJANGO_SETTINGS_MODULE=ecommerce_backend.settings
DJANGO_WSGI_MODULE=ecommerce_backend.wsgi
TIMEOUT=120

cd $DJANGODIR || exit
export PATH="/home/ubuntu/anaconda3/envs/ecommerce/bin":PATH
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

RUNDIR=$(dirname $SOCKFILE)
test -d "$RUNDIR" || mkdir -p "$RUNDIR"

gunicorn ${DJANGO_WSGI_MODULE}:application \
--name $NAME \
--workers $NUM_WORKERS \
--timeout $TIMEOUT \
--user=$USER --group=$GROUP \
--bind=127.0.0.1:8000 \
--log-level=debug \
--log-file=-