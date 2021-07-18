FROM python:3.9-alpine
MAINTAINER Andrew Tsai

# Run Python unbuffered mode.
# Does not allow Python to buffer output.
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
# Install postgresql-client 
RUN apk add --update --no-cache postgresql-client && \
  apk add --update --no-cache --virtual .tmp-build-deps \
  gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D django
USER django