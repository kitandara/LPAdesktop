FROM openjdk:8
COPY . /usr/src/LPAdesktop
RUN apt update
RUN apt install maven genisoimage -y
ADD https://api.github.com/repos/kitandara/LPAd_SM-DPPlus_Connector/git/refs/heads/master version.json
WORKDIR /usr/src/
RUN git clone https://github.com/kitandara/LPAd_SM-DPPlus_Connector.git
WORKDIR /usr/src/LPAd_SM-DPPlus_Connector
RUN mvn install
WORKDIR /usr/src/LPAdesktop
RUN mvn install
RUN chmod +x /usr/src/LPAdesktop/entrypoint.sh
CMD ["/usr/src/LPAdesktop/entrypoint.sh"]
