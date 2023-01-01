#-*- coding: utf-8 -*-

import sys

if len(sys.argv) != 2:
  raise ValueError('Please provide a subnet, i.e. "192.168.1."')
print("Script Name is {}".format(sys.argv[0]))

subnet = sys.argv[1]
print("pinging subnet {}0/24".format(subnet))
