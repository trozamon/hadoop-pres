# Get the sample data used later in the presentation
git clone git://github.com/trozamon/hadoop-pres.git

# Upload sample data for later use
hdfs dfs -put hadoop-pres/ngrams.data .
hdfs dfs -put hadoop-pres/ngrams.data ngrams.hive

# Download some data
hdfs dfs -get ngrams.hive .
