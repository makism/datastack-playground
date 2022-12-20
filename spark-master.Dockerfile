FROM cluster-base as spark-master

ENV SPARK_VERSION=spark-3.3.0
ENV HADOOP_VERSION=hadoop-3.3.4
ENV SPARK_HOME=/opt/spark
ENV PYTHONHASHSEED=1

RUN wget --no-verbose -O apache-spark.tgz "https://archive.apache.org/dist/spark/${SPARK_VERSION}/${SPARK_VERSION}-bin-without-hadoop.tgz" \
    && mkdir -p /opt/spark \
    && tar -xf apache-spark.tgz -C /opt/spark --strip-components=1 \
    && rm apache-spark.tgz

RUN wget --no-verbose -O hadoop.tgz "https://dlcdn.apache.org/hadoop/common/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz" \
    && mkdir -p /opt/spark \
    && tar -xf hadoop.tgz -C /opt/spark --strip-components=1 \
    && rm hadoop.tgz

WORKDIR /opt/spark

ENV SPARK_MASTER_PORT=7077
ENV PYSPARK_PYTHON=python3
ENV SPARK_MASTER_WEBUI_PORT=8080
ENV SPARK_LOG_DIR=/opt/spark/logs
ENV SPARK_MASTER_LOG=/opt/spark/logs/spark-master.out
ENV SPARK_WORKER_LOG=/opt/spark/logs/spark-worker.out
ENV SPARK_WORKER_WEBUI_PORT=8080
ENV SPARK_WORKER_PORT=7000
ENV SPARK_MASTER="spark://spark-master:7077"
ENV SPARK_WORKLOAD="master"

RUN mkdir -p $SPARK_LOG_DIR && \
    touch $SPARK_MASTER_LOG && \
    touch $SPARK_WORKER_LOG && \
    ln -sf /dev/stdout $SPARK_MASTER_LOG && \
    ln -sf /dev/stdout $SPARK_WORKER_LOG

COPY spark-conf/spark-env.sh /opt/spark/conf/spark-env.sh
RUN chmod +x /opt/spark/conf/spark-env.sh

ENV HADOOP_HOME=/opt/spark
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$HADOOP_HOME/bin:$PATH
ENV HADOOP_OPTIONAL_TOOLS="hadoop-aws"
ENV SPARK_DIST_CLASSPATH="$(hadoop classpath)"

EXPOSE 8888 8080 7077 7000

CMD /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master 
