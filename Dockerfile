FROM nginx

ARG SSL_CERT
ARG SSL_KEY

USER 0

RUN rm -rf /etc/nginx/conf.d/default.conf &&\
    rm -rf /usr/share/nginx/html/index.html &&\
    mkdir /etc/nginx/cert &&\
    echo "${SSL_CERT}" > /etc/nginx/cert/ssl.cert &&\
    echo "${SSL_KEY}" > /etc/nginx/cert/ssl.key

COPY index.html /usr/share/nginx/html/

COPY custom-nginx/test.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["bash", "-c", "nginx -g 'daemon off;' && /etc/init.d/nginx start"]
