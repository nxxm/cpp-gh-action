FROM ubuntu:latest


 LABEL com.github.actions.name="nxxm CI"
 LABEL com.github.actions.description="Compile your code for linux"
 LABEL com.github.actions.icon="cloud"
 LABEL com.github.actions.color="red"

 LABEL repository="https://github.com/nxxm/nxxm_ci_docker"
 LABEL maintainer="Nxxm teams <damien@nxxm.io>"


# Install needed tools
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris
RUN apt-get -y update && apt-get install -y software-properties-common git build-essential locales ninja-build cmake libssl-dev python --assume-yes apt-utils
RUN locale-gen "en_US.UTF-8"
#RUN add-apt-repository ppa:jonathonf/gcc-7.3
#RUN apt-get update
RUN apt-get install -y gcc-7 g++-7
RUN apt-get update && apt-get install -y \
curl
RUN apt-get update && apt-get install -y \
unzip
RUN apt-get update && apt-get install -y \
sudo
# Add script and run the script 
ADD ./src/entrypoint.sh /entrypoint.sh
CMD ["bash", "/entrypoint.sh"]
