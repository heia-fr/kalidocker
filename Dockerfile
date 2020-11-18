FROM kalilinux/kali-rolling
# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.version=$VERSION \
    org.label-schema.name='Kali Linux' \
    org.label-schema.description='Official Kali Linux docker image' \
    org.label-schema.usage='https://www.kali.org/news/official-kali-linux-docker-images/' \
    org.label-schema.url='https://www.kali.org/' \
    org.label-schema.vendor='Offensive Security' \
    org.label-schema.schema-version='1.0' \
    org.label-schema.docker.cmd='docker run --rm kalilinux/kali-rolling' \
    org.label-schema.docker.cmd.devel='docker run --rm -ti kalilinux/kali-rolling' \
    org.label-schema.docker.debug='docker logs $CONTAINER' \
    io.github.offensive-security.docker.dockerfile="Dockerfile" \
    io.github.offensive-security.license="GPLv3" \
    MAINTAINER="Steev Klimaszewski <steev@kali.org>"
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt-get -yqq update \
    && apt-get -y install --no-install-recommends metasploit-framework nmap hydra \
    && apt-get -y install --no-install-recommends sqlmap telnet openssh-client dnsutils \
    && apt-get -y install --no-install-recommends yersinia ettercap-text-only cisco-global-exploiter \
    && apt-get -y install --no-install-recommends cisco-auditing-tool snmp dsniff dnschef fping hping3 tshark python-scapy \
    && apt-get -y install --no-install-recommends net-tools iputils-ping netcat vim \
#    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean 
CMD ["bash"]