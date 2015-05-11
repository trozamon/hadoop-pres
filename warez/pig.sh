# Open the pig shell on flux-login
pig -Dmapreduce.job.queuename=training

# Open the pig shell for local development
pig -x local

# Run the included warez/ngrams.pig script
cd hadoop-pres
hdfs dfs -put ngrams.data ngrams.data
pig -Dmapreduce.job.queuename=training -f warez/ngrams.pig
