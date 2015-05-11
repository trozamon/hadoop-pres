# Open the interactive PySpark shell
pyspark --master yarn-client --queue training

# Open the interactive PySpark shell locally
pyspark --master local

# Submit a PySpark job to the cluster
spark-submit --master yarn-client \
    --queue training \
    --num-executors 2 \
    --executor-memory 3g \
    warez/ngrams-spark.py
