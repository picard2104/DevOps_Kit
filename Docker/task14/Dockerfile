FROM nginx:1.27.4-alpine-slim

RUN apk add --no-cache nginx-mod-http-image-filter

RUN mkdir -p \
    /var/www/html \
    /var/www/red \
    /var/www/blue \
    /var/www/images \
    /var/www/music \
    /etc/nginx/ssl

COPY nginx/*.conf /etc/nginx/conf.d/

COPY html/ /var/www/html/
COPY red/ /var/www/red/
COPY blue/ /var/www/blue/
COPY images/ /var/www/images/
COPY music/ /var/www/music/

COPY ssl/ /etc/nginx/ssl/

EXPOSE 80 443 8081 8082

CMD ["nginx", "-g", "daemon off;"]
