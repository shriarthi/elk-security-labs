#!/bin/bash

# ----------------------------
# ELK Log Ingestion Script
# ----------------------------
# This script ingests sample logs into Elasticsearch via Logstash.
# Author: Your Name
# Date: 2025-12-10
# ----------------------------

# Set paths
LOGSTASH_PIPELINE="./logstash/logstash.conf"
WEB_LOGS="./data/sample_weblogs.log"
SEC_LOGS="./data/sample_security.log"

# Check if Logstash config exists
if [ ! -f "$LOGSTASH_PIPELINE" ]; then
  echo "[ERROR] Logstash pipeline not found: $LOGSTASH_PIPELINE"
  exit 1
fi

# Check if logs exist
if [ ! -f "$WEB_LOGS" ]; then
  echo "[ERROR] Web log file not found: $WEB_LOGS"
  exit 1
fi

if [ ! -f "$SEC_LOGS" ]; then
  echo "[ERROR] Security log file not found: $SEC_LOGS"
  exit 1
fi

echo "[INFO] Starting log ingestion with Logstash..."

# Run Logstash (assumes installed locally)
logstash -f "$LOGSTASH_PIPELINE" --path.data ./logstash-data

if [ $? -eq 0 ]; then
  echo "[INFO] Log ingestion completed successfully."
else
  echo "[ERROR] Log ingestion failed."
  exit 1
fi
