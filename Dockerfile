FROM ubuntu:precise
RUN echo deb http://archive.ubuntu.com/ubuntu/ precise main universe > /etc/apt/sources.list.d/precise.list
RUN apt-get update -q
RUN apt-get install -qy openvpn
ADD run.sh /usr/local/sbin/run
VOLUME /etc/openvpn 
EXPOSE 1194/udp 11194/tcp
RUN chmod +x /usr/local/sbin/run
CMD /usr/local/sbin/run
