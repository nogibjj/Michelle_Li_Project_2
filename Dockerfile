#!/usr/bin/env bash

FROM alpine:latest
RUN apk update && apk add bash

WORKDIR /app
COPY main.sh /app
COPY my-dataset-test.csv /app
COPY my-dataset-train.csv /app