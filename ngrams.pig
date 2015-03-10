# Load the data.

data = LOAD 'ngrams.data' AS (ngram:chararray, year:int, matches:long,
    volumes:long);

# Running 'describe ngrams' gives:
# data: {ngram: chararray,year: int,matches: long,volumes: long}

filtered = FILTER data BY volumes == 1;
# filtered: {ngram: chararray,year: int,matches: long,volumes: long}

grouped = GROUP filtered BY ngram;
# grouped: {group: chararray,filtered: {(ngram: chararray,year: int,matches: long,volumes: long)}}

answer = FOREACH grouped GENERATE group, SUM($1.volumes);
# answer: {group: chararray,long}

ordered = ORDER answer BY $0 ASC;
# ordered: {group: chararray,long}

DUMP ordered;
