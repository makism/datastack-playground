FROM apache/airflow:2.5.0-python3.10

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  vim \
  procps \
  wget \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget --no-verbose -O temurin.tgz "https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u352-b08/OpenJDK8U-jre_x64_linux_hotspot_8u352b08.tar.gz" \
  && mkdir -p /opt/temurin \
  && tar -xf temurin.tgz -C /opt/temurin --strip-components=1 \
  && rm temurin.tgz

ENV JAVA_HOME=/opt/temurin
ENV PATH="${JAVA_HOME}/bin:${PATH}"

USER airflow
