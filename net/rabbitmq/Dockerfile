FROM flitter/init

ADD rabbitmq /etc/service/rabbitmq/run

# Install RabbitMQ.
RUN wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
    echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server && \
    rm -rf /var/lib/apt/lists/* && \
    rabbitmq-plugins enable rabbitmq_management && \
    echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/sbin/my_init"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672
