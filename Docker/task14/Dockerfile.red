FROM nginx:alpine
COPY nginx/red.conf /etc/nginx/conf.d/
COPY red/ /var/www/red/
