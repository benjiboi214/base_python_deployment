FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1

RUN apk update \
  # Install pipenv
  && pip install pipenv

RUN mkdir /app
WORKDIR /app

COPY ./Pipfile.lock ./Pipfile.lock

RUN pipenv --bare install --ignore-pipfile --dev

COPY ./entrypoint.sh entrypoint.sh
RUN sed -i 's/\r$//g' entrypoint.sh
RUN chmod +x entrypoint.sh

COPY ./start.sh start.sh
RUN sed -i 's/\r$//g' start.sh
RUN chmod +x start.sh

COPY /api ./api

WORKDIR /app/api

ENTRYPOINT ["/app/entrypoint.sh"]

