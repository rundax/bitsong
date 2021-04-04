FROM python:3.5.2-alpine

WORKDIR /src

RUN apk add --no-cache  git

RUN git clone https://github.com/SimplyVC/panic_cosmos.git /src && git checkout $MONITORING_TAG

RUN pip install pipenv
RUN apk add --no-cache build-base libffi-dev
RUN mkdir -p /root/.local/share/virtualenv/wheel/3.5/embed/1
RUN pipenv sync

