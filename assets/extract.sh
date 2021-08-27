#!/usr/bin/env bash

set -eoux pipefail

trash assets/data-visualization-with-kibana

mkdir --parents assets/data-visualization-with-kibana/test-data
unzip data-visualization-with-kibana/test-data.zip -d assets/data-visualization-with-kibana/test-data
