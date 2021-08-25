FROM debian:stable-slim

RUN apt-get update
RUN apt-get install -y wget
RUN rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
  wget https://github.com/stripe/stripe-cli/releases/download/v1.7.0/stripe_1.7.0_linux_x86_64.tar.gz && \
  tar -zxvf stripe_1.7.0_linux_x86_64.tar.gz && \
  mv stripe /usr/local/bin/ && \
  rm stripe*

COPY ./run.sh /run.sh
RUN chmod +x /run.sh

CMD bash /run.sh
