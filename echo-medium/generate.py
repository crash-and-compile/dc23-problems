#! /usr/bin/python 

import sys
import os.path
import random

infilename = sys.argv[1]
outfilename = sys.argv[2]

if not os.path.exists(os.path.dirname(infilename)):
  os.makedirs(os.path.dirname(infilename))

if not os.path.exists(os.path.dirname(outfilename)):
  os.makedirs(os.path.dirname(outfilename))

infile = open(infilename, "w")
outfile = open(outfilename, "w")

for i in xrange(0,150):
  c = chr(random.randint(65,90))
  infile.write("%s\n" % c)
  outfile.write("%s\n" % c)
