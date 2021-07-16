FROM python:3.9-alpine
MAINTAINER Andrew Tsai

# Run Python unbuffered mode.
# Does not allow Python to buffer output.
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D django
USER django