# Login Django para OIDC 

## Compose File Outline

```bash
image: outlinewiki/outline:latest
environment:
  FILE_STORAGE=local
  FILE_STORAGE_LOCAL_ROOT_DIR=/var/lib/outline/data
  FILE_STORAGE_UPLOAD_MAX_SIZE=26214400
volumes:
  - outline_data:/var/lib/outline/data
```

## Django como proveedor OIDC directo:
```bash
python manage.py migrate
python manage.py creatersakey
```
/admin/oidc_provider/client/
