FROM debian:bullseye-slim

ADD launcher.sh /
RUN chmod +x /launcher.sh

# Install Stuff
RUN apt update
RUN apt -y install python3 python3-pip git

ENV ENVOY_LOGGER_CFG_PATH=/etc/envoy_logger/cfg.yaml

# entrypoint
CMD /launcher.sh
