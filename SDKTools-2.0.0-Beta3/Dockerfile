FROM java:8-jre

RUN apt-get update && \
    apt-get install -y curl ruby unzip node gcc-multilib apache2 rsync

RUN useradd -m sencha && \
    cd && cp -R .bashrc .profile /home/sencha && \
    mkdir -p /code && \
    chown -R sencha:sencha /home/sencha /code

ENV HOME /home/sencha
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

COPY ./SenchaSDKTools-2.0.0-beta3-linux-x64.run $HOME/SDK.run
COPY ./sencha.conf /etc/apache2/sites-enabled/000-default.conf
RUN INSTALL4J_ADD_VM_PARAMS="-Djava.awt.headless=true" $HOME/SDK.run  --mode unattended

#USER sencha
COPY ./entrypoint.sh /

WORKDIR /code
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]