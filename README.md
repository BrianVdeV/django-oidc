# Login Django para OIDC 

Login en Django usando OIDC para conectar con la app Outline
## Compose File Outline

```bash
image: outlinewiki/outline:latest
environment:
  DEFAULT_LANGUAGE: "es_ES"
  OIDC_CLIENT_ID: ${CLIENT_ID}
  OIDC_AUTH_URI: ${DEX_URL}/authorize
  OIDC_LOGOUT_URI: ${DEX_URL}/logout
  AWS_ACCESS_KEY_ID: ${KEY_ID}
  AWS_SECRET_ACCESS_KEY: ${ACESS_KEY}
  AWS_REGION: "us-east-1"
  AWS_S3_ENDPOINT: ${URL}
  AWS_S3_UPLOAD_BUCKET_NAME: "outline-bucket"
  AWS_S3_UPLOAD_BUCKET_URL: ${URL}
  AWS_S3_FORCE_PATH_STYLE: "true"
```

## Django como proveedor OIDC directo:
```bash
python manage.py migrate
python manage.py creatersakey
```

Agregar Outline a Clients
