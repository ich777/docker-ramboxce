FROM ich777/novnc-baseimage

LABEL maintainer="admin@minenet.at"

RUN export TZ=Europe/Rome && \
#	apt-get update && \
#	apt-get -y install --no-install-recommends libxcursor-dev libnss3 libgdk-pixbuf2.0-0 libgtk-3-0 libasound2 && \
#	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
#	echo $TZ > /etc/timezone && \
#	rm -rf /var/lib/apt/lists/* && \
	sed -i '/    document.title =/c\    document.title = "Rambox CE - noVNC";' /usr/share/novnc/app/ui.js && \
	rm /usr/share/novnc/app/images/icons/*

ENV DATA_DIR=/ramboxce
ENV CUSTOM_RES_W=1024
ENV CUSTOM_RES_H=768
ENV NOVNC_PORT=8080
ENV RFB_PORT=5900
ENV X11VNC_PARAMS=""
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV DATA_PERM=770
ENV USER="ramboxce"

RUN mkdir $DATA_DIR && \
	useradd -d $DATA_DIR -s /bin/bash $USER && \
	chown -R $USER $DATA_DIR && \
	ulimit -n 2048

ADD /scripts/ /opt/scripts/
COPY /icons/* /usr/share/novnc/app/images/icons/
COPY /conf/ /etc/.fluxbox/
RUN chmod -R 770 /opt/scripts/

EXPOSE 8080

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]