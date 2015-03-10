data = LOAD 'ngrams.data' AS (ngram:chararray, year:int, matches:long,
    volumes:long);
filtered = FILTER data BY volumes == 1;
grouped = GROUP filtered BY ngram;
answer = FOREACH grouped GENERATE group, SUM($1.volumes);
ordered = ORDER answer BY $0 ASC;
DUMP ordered;
