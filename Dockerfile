FROM python:3.8.4-alpine3.12

COPY requirements.txt /requirements.txt

RUN /sbin/apk add --no-cache ghostscript-dev libstdc++
RUN /sbin/apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/main qt-x11
RUN /usr/local/bin/pip install --no-cache-dir --requirement /requirements.txt

ENV EXCALIBUR_HOME="/excalibur" \
    PYTHONUNBUFFERED="1"

ENTRYPOINT ["/usr/local/bin/excalibur"]
CMD ["webserver"]
