FROM nginx:1.20-alpine

RUN rm /etc/nginx/conf.d/default.conf || true
ADD  nginx-config/* /etc/nginx/

#COPY --from=app-code /var/www/html /var/www/html

#ADD public_html/ /var/www/html/
#RUN cat /var/www/html/.git/refs/heads/master
