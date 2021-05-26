FROM nginx:alpine

COPY conf.d/*.conf /etc/nginx/conf.d/
COPY includes/*.conf /etc/nginx/includes/
COPY certs/* /etc/ssl/certs/
COPY run.sh /run.sh

RUN chmod +x /run.sh

ENV SERVER_ENABLE_HTTP_TRAFFIC="true" \
    SERVER_ENABLE_HTTPS_TRAFFIC="false" \
    SERVER_SSL_CERTIFICATE_FILE_NAME="default.pem" \
    SERVER_SSL_CERTIFICATE_KEY_NAME="default.key"

CMD ["/run.sh"]
