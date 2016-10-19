FROM openjdk:8-jre

ENV HOME /home/graphhopper

ENV GRAPHHOPPER_URL https://oss.sonatype.org/content/groups/public/com/graphhopper/graphhopper-web/0.8.0/graphhopper-web-0.8.0-bin.zip

RUN wget $GRAPHHOPPER_URL -P /tmp && unzip /tmp/graphhopper*.zip -d $HOME && rm /tmp/*.zip

ADD scripts $HOME
ADD properties $HOME

VOLUME ["/data"]

EXPOSE 8989

WORKDIR $HOME

CMD ["./start.sh"]
