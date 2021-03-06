# Run Python on a Hadoop cluster
yarn jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -Dmapreduce.job.queuename=training \
    -input ngrams.data -output ngrams-output \
    -mapper warez/map.py -reducer warez/reduce.py \
    -file warez/map.py -file warez/reduce.py

# Look at the output from the job
hdfs dfs -cat ngrams-output/part*

# Run locally for testing
cat ngrams.data | python3.3 warez/map.py | python3.3 warez/reduce.py
