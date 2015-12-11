FROM java:openjdk-7u91-jdk 

# suppress warnings in apt-get that TERM is not set
ENV DEBIAN_FRONTEND=noninteractive

# update install and install required archives
RUN apt-get update && apt-get install -y wget git curl zip bzip2 vim

# remove downloaded archive files
RUN apt-get clean

RUN mkdir /opt/xlview
ADD https://dist.xebialabs.com/public/trial/xl-testview/xl-testview-server-1.3.2.zip /opt/xlview/xlviewserver.zip
RUN unzip -n /opt/xlview/xlviewserver.zip -d /opt/xlview
RUN ln -s /opt/xlview/xl-testview-server-1.3.2 /opt/xlview/xl-view-server

EXPOSE 6516

CMD ["/opt/xlview/xl-view-server/bin/server.sh"]
