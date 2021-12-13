FROM python:3.10.1-alpine3.15

RUN /sbin/apk add --no-cache ghostscript-dev libstdc++
RUN /sbin/apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.9/main qt-x11
RUN /usr/sbin/adduser -g python -D python

USER python
RUN /usr/local/bin/python -m venv /home/python/venv

COPY --chown=python:python requirements.txt /home/python/docker-excalibur/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/docker-excalibur/requirements.txt

ENV EXCALIBUR_HOME="/home/python/excalibur" \
    PATH="/home/python/venv/bin:${PATH}" \
    PYTHONUNBUFFERED="1"

ENTRYPOINT ["/home/python/venv/bin/python"]
CMD ["/home/python/docker-excalibur/run.py"]

LABEL org.opencontainers.image.source="https://github.com/williamjacksn/docker-excalibur"

COPY --chown=python:python run.py /home/python/docker-excalibur/run.py
