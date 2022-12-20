FROM cluster-base as jupyterlab

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

ENV PYSPARK_SUBMIT_ARGS="--packages io.delta:delta-core_2.12:2.1.0,com.amazonaws:aws-java-sdk-bundle:1.12.262,org.apache.hadoop:hadoop-aws:3.3.4 pyspark-shell"

WORKDIR /opt/workspace

EXPOSE 8888

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=