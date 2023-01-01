import sys

if len(sys.argv) != 2:
 raise ValueError('Please provide a subnet, i.e. "192.168.1."')

print(f'Script Name is {sys.argv[0]}')

subnet = sys.argv[1]
print(f'pinging subnet {subnet}0/24')
