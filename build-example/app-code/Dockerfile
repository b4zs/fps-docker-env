FROM gcr.io/distroless/base as raw-clone

ADD html/ /var/www/html



FROM fps-php as build-php

COPY --from=raw-clone /var/www/html /var/www/html
RUN make build-backend
RUN chmod -Rf 777 var/log var/cache



FROM fps-node as build-node

COPY --from=build-php /var/www/html /var/www/html
RUN make build-frontend
RUN rm -rf node_modules



FROM gcr.io/distroless/base

COPY --from=build-node /var/www/html /var/www/html
