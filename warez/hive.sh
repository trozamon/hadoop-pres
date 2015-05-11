# Start the interactive hive shell
hive --hiveconf mapreduce.job.queuename=training

# Run a SQL script with Hive
hive --hiveconf mapreduce.job.queuename=training -f path/to/script.sql
