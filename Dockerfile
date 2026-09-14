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

# Reemplázala por:
CMD ["sh", "./entrypoint.sh"]