#/usr/bin/env/ python

import itertools
import csv


# run module -t avail &2> applications.csv on Ceres to generate input data

appdict = {}
with open('applications.csv', 'r') as f:
    for line in itertools.islice(f, 1, None):  # start=1, stop=None
        app, ver = line.strip().split("/")
        if ver != '':
            if app in appdict:
                appdict[app].append(ver)
            else:
                appdict[app] = [ver]


print(appdict)

with open('applications-parsed.csv', 'w') as outfile:
    csvwrt = csv.writer(outfile)
    csvwrt.writerow(["Application","Version(s)"])
    for key, val in appdict.items():
        csvwrt.writerow([key,", ".join(val)])
