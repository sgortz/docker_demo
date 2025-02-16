# React + TypeScript + Vite

This template app was used to study containerizing an Single-Page-Application using Docker and Nginx.

```
docker build -t image-name .
docker run --rm -d -p 5173:5173 --name instance image-name

# check out container's file directories
docker exec -it instance /bin/sh
```
Access `localhost:5173` to access your application.
