f = open("dummy.hex", "w")
for i in range((2**16-1)-1):
    f.write("00000000\n")
f.close()