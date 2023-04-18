export HADOOP_HOME=/opt/spark
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$HADOOP_HOME/bin:$PATH
export HADOOP_OPTIONAL_TOOLS="hadoop-aws"
export SPARK_DIST_CLASSPATH=$(hadoop classpath)