ARG CHIA_VERSION
FROM ghcr.io/chia-network/chia:${CHIA_VERSION}

ARG UID=11322
ARG GID=$UID

ENV CHIA_ROOT=/data

RUN apt-get update && apt-get install -y \
  acl \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $GID -r chiagroup \
  && useradd -u $UID --no-log-init --create-home -r -g chiagroup chiauser \
  && mkdir /data && chown -R $UID:$GID /data \
  && mkdir /.chia_keys && chown -R $UID:$GID /.chia_keys \
  && mkdir /plots && chown -R $UID:$GID /plots \
  && setfacl -m u:$UID:rwx /etc

USER $UID:$GID
