FROM python:3.9.5-alpine3.13

COPY requirements.txt /requirements.txt

RUN /sbin/apk add --no-cache ghostscript-dev libstdc++
RUN /sbin/apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/main qt-x11
RUN /usr/local/bin/pip install --no-cache-dir --requirement /requirements.txt

COPY run.py /run.py

ENV EXCALIBUR_HOME="/excalibur" \
    PYTHONUNBUFFERED="1"

ENTRYPOINT ["/usr/local/bin/python"]
CMD ["/run.py"]
