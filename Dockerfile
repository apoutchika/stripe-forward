FROM debian:stable-slim

RUN apt-get update
RUN apt-get install -y gnupg ca-certificates

RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 379CE192D401AB61
RUN echo "deb https://dl.bintray.com/stripe/stripe-cli-deb stable main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y stripe
RUN rm -rf /var/lib/apt/lists/*

COPY ./run.sh /run.sh
RUN chmod +x /run.sh


CMD bash /run.sh

