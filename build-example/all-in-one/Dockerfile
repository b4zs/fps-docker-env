FROM alpine:latest
COPY --from=fps-node:latest / /
COPY --from=fps-php:latest / /
COPY --from=fps-nginx:latest / /

# missing user www-data

ADD init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/init.sh"]
