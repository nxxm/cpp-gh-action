FROM ubuntu:latest


# Install needed tools
RUN apt-get -y update && apt-get install -y software-properties-common git build-essential locales ninja-build cmake libssl-dev python
RUN locale-gen "en_US.UTF-8"
RUN add-apt-repository ppa:jonathonf/gcc-7.1
RUN apt-get update
RUN apt-get install -y gcc-7 g++-7
# Add script and run the script 
ADD ./src/entrypoint.sh /entrypoint.sh
CMD ["bash", "/entrypoint.sh"]
