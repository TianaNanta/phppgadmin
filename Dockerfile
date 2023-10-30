FROM dockage/alpine-nginx-php-fpm:latest

LABEL maintainer="TianaNanta <andrianjakananta@gmail.com>" \
    org.label-schema.name="phppgadmin" \
    org.label-schema.vendor="TianaNanta" \
    org.label-schema.description="phpPgAdmin Docker image, phpPgAdmin is a web-based administration tool for PostgreSQL." \
    org.label-schema.vcs-url="https://github.com/TianaNanta/phppgadmin" \
    org.label-schema.license="MIT"

ADD ./assets ${DOCKAGE_ETC_DIR}

RUN apk update && apk upgrade -y --no-cache \
    && apk --no-cache --update add postgresql-client \
    && apk --no-cache --update add php7.2-pgsql postgresql \
    && ${DOCKAGE_ETC_DIR}/buildtime/install \
    && cp -ar ${DOCKAGE_ETC_DIR}/etc/* /etc \
    && rm -rf /var/cache/apk/* ${DOCKAGE_ETC_DIR}/etc ${DOCKAGE_ETC_DIR}/buildtime
