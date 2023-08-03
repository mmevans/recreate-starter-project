#!/bin/sh

cat /app/json-api-app.conf | envsubst > /app/json-api-app.with-env.conf

echo "using config file: "
cat /app/json-api-app.with-env.conf

exec java \
  -jar /app/jars/http-json.jar \
  --config /app/json-api-app.with-env.conf \
  --log-level $LOG_LEVEL \
  --log-encoder json