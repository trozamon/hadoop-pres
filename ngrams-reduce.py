#!/usr/bin/env python3.3

import fileinput

year_count = dict()

for line in fileinput.input():
    tmp = line.split('\t')

    if tmp[0] not in year_count.keys():
        year_count[tmp[0]] = 0

    year_count[tmp[0]] = year_count[tmp[0]] + 1

for year in sorted(year_count.keys()):
    print('\t'.join([year, str(year_count[year])]))
