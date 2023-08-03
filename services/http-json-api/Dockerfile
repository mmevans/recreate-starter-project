FROM amazoncorretto:18.0.2 as base

# Download and install http json api
FROM base as build
RUN mkdir /jars && curl -L -o /jars/http-json.jar https://github.com/digital-asset/daml/releases/download/v2.6.1/http-json-2.6.1.jar

FROM base as release

RUN yum install -y shadow-utils gettext \
    && yum clean all \
    && groupadd --gid 1002 --system app \
    && useradd --uid 1001 --gid app --system app

RUN mkdir /app && chown app:app /app
USER app

COPY --chown=app:app --from=build /jars /app/jars
COPY --chown=app:app ./json-api-app.conf /app/json-api-app.conf
COPY --chown=app:app ./docker-entrypoint.sh /

ENV LEDGER_HOST localhost
ENV LEDGER_PORT 6865
ENV HTTP_PORT 7575
ENV DB_SCHEMA_NAME postgres
ENV LOG_LEVEL INFO

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
