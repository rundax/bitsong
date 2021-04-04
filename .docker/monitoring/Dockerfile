FROM python:3.7.5-slim-stretch
WORKDIR /src

RUN apt update && apt install -y git

RUN git clone https://github.com/SimplyVC/panic_cosmos.git /src && git checkout $MONITORING_TAG

RUN pip install pipenv
RUN pipenv sync

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./docker-entrypoint.d/ /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "pipenv", "run", "python", "run_alerter.py" ]
