FROM python:3.9.19-slim-bookworm

RUN /usr/sbin/useradd --create-home --shell /bin/bash --user-group python

ARG DEBIAN_FRONTEND=noninteractive
RUN /usr/bin/apt-get update \
 && /usr/bin/apt-get install --assume-yes ghostscript libgl1 libglib2.0-0 libsm6 libxext6 libxrender1 \
 && rm -rf /var/lib/apt/lists/*

USER python
RUN /usr/local/bin/python -m venv /home/python/venv

COPY --chown=python:python requirements.txt /home/python/docker-excalibur/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/docker-excalibur/requirements.txt

ENV EXCALIBUR_HOME="/home/python/excalibur" \
    PATH="/home/python/venv/bin:${PATH}" \
    PYTHONDONTWRITEBYTECODE="1" \
    PYTHONUNBUFFERED="1" \
    TZ="Etc/UTC"

ENTRYPOINT ["/home/python/venv/bin/python", "/home/python/docker-excalibur/run.py"]

LABEL org.opencontainers.image.source="https://github.com/williamjacksn/docker-excalibur"

COPY --chown=python:python run.py /home/python/docker-excalibur/run.py
