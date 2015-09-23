FROM shipimg/ubuntu1204_base:latest

# lein needs java to execute
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections;
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections;
RUN add-apt-repository ppa:webupd8team/java;
RUN apt-get update &&  apt-get install -y \
    oracle-java7-installer;

RUN apt-get update && apt-get install -y \
    wget;

RUN cd /tmp && \
    wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein;

RUN chmod +x /tmp/lein
RUN cp -vr /tmp/lein /usr/local/bin/lein2

# supress warnings about lein running as root
ENV LEIN_ROOT true

# download and use latest lein
RUN /bin/bash lein2
RUN ln -sf /usr/local/bin/lein2 /usr/local/bin/lein

CMD ["lein2"]