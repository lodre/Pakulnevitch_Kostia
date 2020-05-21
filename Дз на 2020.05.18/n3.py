def length(n):
	if n>0:
		return 1+(length(n // 10))
	else:
		return 0

def print_line(n,m):
	i=0
	print("-"*n, end ="")
	for i in range(0,m):
		print("+"+("-"*n), end ="")
	print("")

def print_tab(n,m): 
	i=0
	x=0
	y=0   
	l = length(n*m)
	print(" "*l, end ="|")
	for i in range (1,n+1):
		print("%*d" % (l,i), end ="|")
	print("")
	print_line(l,n)
	for y in range (1,m+1):
		print("%*d" % (l,y), end ="|")
		for x in range (1,n+1):
			print("%*d" % (l,(x*y)), end ="|")
		print("")
		print_line(l,n)
			 

n = 5
m = 10          


print_tab(n,m)