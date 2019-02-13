FROM java:8-jre

MAINTAINER dpfaffenbauer <dominik@pfaffenbauer.at>

RUN apt-get update && \
    apt-get install -y \
        curl \
        ruby \
        unzip

COPY ./SenchaCmd-6.7.0.37-linux-amd64.sh.zip /home/sencha/cmd.sh.zip

RUN unzip -p /home/sencha/cmd.sh.zip > /home/sencha/cmd-install.sh && \
    chmod +x /home/sencha/cmd-install.sh && \
    /home/sencha/cmd-install.sh -q && \
    rm /home/sencha/cmd* && \
    mkdir -p /code

ENV PATH /root/bin/Sencha/Cmd/6.8.0.37/:$PATH

EXPOSE 1841

COPY ./entrypoint.sh /
RUN chmod 777 /entrypoint.sh

WORKDIR /code
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]