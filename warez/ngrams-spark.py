from pyspark.conf import SparkConf
from pyspark.context import SparkContext

# Create the job configuration
conf = SparkConf().setAppName('NGrams')

# Create the Spark Context
# The context is used to run the job and file I/O
sc = SparkContext(conf=conf)

# Load the data
ngrams = sc.textFile("ngrams.data")

# Split the data into an array
columns = ngrams.map(lambda line: line.split("\t"))

# Filter out the data where 'volumes == 1'
filtered = columns.filter(lambda arr: int(arr[3]) == 1)

# Write out tuples of the form (ngram, 1)
reducable = filtered.map(lambda arr: (arr[0], 1))

# Sum the tuples by key to get answer
answer = reducable.reduceByKey(lambda a, b: a + b)

# Print the answer
for k, v in answer.collect():
    print('\t'.join([k, str(v)]))
