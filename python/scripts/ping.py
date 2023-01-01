import sh

print "Scanning..."

for i in range(1,15):
	address = "8.8.8." + str(i)
	try: 
		sh.ping(address, "-c 1", _out="/dev/null")
		print "ping to", address, "OK"
	except sh.ErrorReturnCode_1:
		print "no response from", address
