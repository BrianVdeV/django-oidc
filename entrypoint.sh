#!/bin/sh
set -eu

mkdir -p /app/secrets /app/staticfiles

if [ ! -s /app/secrets/oidc.key ]; then
  echo "Generating OIDC RSA private key..."
  openssl genrsa -out /app/secrets/oidc.key 4096
  chmod 600 /app/secrets/oidc.key
fi


echo "Applying migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput


echo "Starting Gunicorn..."
exec gunicorn config.wsgi:application   --bind 0.0.0.0:8000   --workers "${GUNICORN_WORKERS:-3}"   --timeout 60   --access-logfile -   --error-logfile -
