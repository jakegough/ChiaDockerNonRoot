FROM ghcr.io/chia-network/chia:1.2.11

ENV CHIA_ROOT=/data

RUN mkdir /data \
  && chown -R 11322:11322 /data \
  && mkdir /.chia_keys \
  && chown -R 11322:11322 /.chia_keys \
  && mkdir /plots \
  && chown -R 11322:11322 /plots

USER 11322:11322
