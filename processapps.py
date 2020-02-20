#/usr/bin/env/ python

import itertools
import csv


# run this command  on Ceres to generate input data
# module -t --redirect avail > applications.csv

# in directory with the applications.csv file run this script

appdict = {}
with open('applications.csv', 'r') as f:
    for line in itertools.islice(f, 1, None):  # start=1, stop=None
        linedict = line.strip().split("/")
        if len(linedict) > 1:
            app = linedict[0]
            ver = linedict[1]
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
        csvwrt.writerow([key, ", ".join(val)])
