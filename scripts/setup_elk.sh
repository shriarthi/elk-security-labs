#!/bin/bash
# Simple Docker ELK stack for testing

docker network create elk-net

docker run -d --name elasticsearch --net elk-net -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:8.11.0

docker run -d --name kibana --net elk-net -p 5601:5601 docker.elastic.co/kibana/kibana:8.11.0

docker run -d --name logstash --net elk-net -v $(pwd)/logstash:/usr/share/logstash/pipeline -p 5044:5044 docker.elastic.co/logstash/logstash:8.11.0

