ARG CHIA_VERSION
FROM ghcr.io/chia-network/chia:${CHIA_VERSION}

ARG UID=11322
ARG GID=$UID

ENV CHIA_ROOT=/data

RUN groupadd -g $GID -r chiagroup \
  && useradd -u $UID --no-log-init -r -g chiagroup chiauser \
  && mkdir /data && chown -R $UID:$GID /data \
  && mkdir /.chia_keys && chown -R $UID:$GID /.chia_keys \
  && mkdir /plots && chown -R $UID:$GID /plots

USER $UID:$GID
