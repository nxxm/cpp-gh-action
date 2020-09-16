FROM nxxm/nxxm-ubuntu-staging-98

 LABEL com.github.actions.name="nxxm CI"
 LABEL com.github.actions.description="Compile your code for linux"
 LABEL com.github.actions.icon="cloud"
 LABEL com.github.actions.color="red"

 LABEL repository="https://github.com/nxxm/nxxm_ci_docker"
 LABEL maintainer="Nxxm teams <damien@nxxm.io>"

ADD ./src/entrypoint.sh /entrypoint.sh
COPY . .
CMD ["bash", "/entrypoint.sh"]
