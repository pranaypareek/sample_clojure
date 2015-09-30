FROM shipimg/ubuntu1204_base:latest

RUN apt-get update && apt-get install -y \
    wget;
