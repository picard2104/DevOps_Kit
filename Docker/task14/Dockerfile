FROM nginx:stable-alpine
RUN rm -rf /etc/nginx/conf.d/*

RUN apk add --no-cache nginx-mod-http-image-filter

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY nginx/default.conf /etc/nginx/conf.d/
COPY nginx/red.conf /etc/nginx/conf.d/
COPY nginx/blue.conf /etc/nginx/conf.d/

COPY html/ /var/www/html/
COPY red/ /var/www/red/
COPY blue/ /var/www/blue/
COPY images/ /var/www/images/
COPY music/ /var/www/music/
COPY content1/ /var/www/content1/

COPY ssl/mikitaseversite.casacam.net /etc/letsencrypt/live/mikitaseversite.casacam.net

EXPOSE 80 443 8081 8082

CMD ["nginx", "-g", "daemon off;"]
