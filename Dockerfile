# Usamos una versión estable de Python
FROM python:3.12-slim

# Instalamos las dependencias necesarias para compilar mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    pkg-config \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /app

# Optimizamos la cache de capas de Docker instalando requisitos primero
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código
COPY . .

# Comando de inicio
# NOTA: Cambia 'config.wsgi' por el nombre de la carpeta donde esté tu wsgi.py
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && gunicorn config.wsgi --bind 0.0.0.0:8000"]