#!/usr/bin/env bash

set -eoux pipefail

trash assets/data-visualization-with-kibana

mkdir --parents assets/data-visualization-with-kibana/test-data
unzip data-visualization-with-kibana/test-data.zip -d assets/data-visualization-with-kibana/test-data

(
  cd assets/data-visualization-with-kibana/test-data

  curl -H "Content-Type: application/x-ndjson" -XPOST -u elastic:Passw0rd http://localhost:9200/_bulk --data-binary "@orders.bulk.ndjson"
  curl -H "Content-Type: application/x-ndjson" -XPOST -u elastic:Passw0rd http://localhost:9200/_bulk --data-binary "@nginx-access-logs-2020-01.bulk.ndjson"
  curl -H "Content-Type: application/x-ndjson" -XPOST -u elastic:Passw0rd http://localhost:9200/_bulk --data-binary "@nginx-access-logs-2020-02.bulk.ndjson"
  curl -H "Content-Type: application/x-ndjson" -XPOST -u elastic:Passw0rd http://localhost:9200/_bulk --data-binary "@nginx-access-logs-2020-03.bulk.ndjson"
)
