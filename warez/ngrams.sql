-- Create the 'ngrams' table. For example, the word 'snake' appearred
-- 6449 times in 1755 volumes in the year 1943. This is represented by:
--
--    snake   1943   6449   1755
CREATE TABLE ngrams (ngram STRING, year INT, matches BIGINT,
    volumes BIGINT) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

-- Load the data from HDFS into a Hive table. This must be done so that Hive
-- knows where to find the data.
LOAD DATA INPATH 'ngrams.data' OVERWRITE INTO TABLE ngrams;

-- Execute a query that finds all words that were only in a single volume in
-- any given year.
SELECT ngram, COUNT(ngram) FROM ngrams WHERE volumes = 1 GROUP BY ngram
    ORDER BY ngram;
