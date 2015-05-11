-- Execute a query that finds all words that were only in a single volume in
-- any given year.
SELECT ngram, COUNT(ngram) FROM ngrams WHERE volumes = 1 GROUP BY ngram
    ORDER BY ngram;
