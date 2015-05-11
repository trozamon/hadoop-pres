from pyspark import SparkConf, SparkContext

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
filtered = columns.filter(lambda arr: arr(3).toInt == 1)

# Write out tuples of the form (year, 1)
reducable = filtered.map(lambda arr: (arr(1), 1))

# Sum the tuples by key to get yearly values
answer = reducable.reduceByKey(lambda (a, b): a + b)

print(str(answer.collect()))
