#!/usr/bin/env python3.3

import fileinput

for line in fileinput.input():
    split = line.split("\t")

    if int(split[3]) == 1:
        print('\t'.join([split[0], '1']))
