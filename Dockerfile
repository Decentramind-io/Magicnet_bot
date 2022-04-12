FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install imagemagick -y

RUN apt install curl -y
RUN apt install unzip -y

ADD MagicnetBot /fst/MagicnetBot
RUN chmod +x /fst/MagicnetBot/MagicnetBot2
RUN mkdir /fst/MagicnetBot/tasks
RUN mkdir /fst/MagicnetBot/tasks/in

#storj.io
RUN curl -L https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip -o uplink_linux_amd64.zip
RUN unzip -o uplink_linux_amd64.zip
RUN install uplink /usr/local/bin/uplink
RUN mkdir /root/.config/
RUN mkdir /root/.config/storj/
RUN mkdir /root/.config/storj/uplink/

#storj.io
ADD Storjconfig/access.json  /root/.config/storj/uplink/access.json
ADD Storjconfig/config.ini  /root/.config/storj/uplink/config.ini

ADD start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]