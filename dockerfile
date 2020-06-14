FROM debian:buster

ENV BIRD_RUN_USER=bird
ENV BIRD_RUN_GROUP=bird
ENV BIRD_RUN_DIR=/run/bird
ENV BIRD_ARGS=""

RUN apt-get update && apt-get install -y \
    bird procps inetutils-traceroute && \
    rm -rf /var/lib/apt/lists/*

COPY scripts/start.sh /start.sh
RUN chmod +x start.sh && \ 
    mkdir -p ${BIRD_RUN_DIR} && \
    chown --silent ${BIRD_RUN_USER}:${BIRD_RUN_GROUP} ${BIRD_RUN_DIR} && \
    chmod 775 ${BIRD_RUN_DIR}

CMD ["/start.sh"]
