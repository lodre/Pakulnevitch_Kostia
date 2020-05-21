                
def kat(n):
	if n>0:
		j=0
		i=0
		for i in range(0,n):
			j = j + ((kat(i))*(kat(n-1-i)))
		return j
	else:
		return 1
                        
def print_kat(n):
	for i in range(0,n):
		print(kat(i))

n=15

print_kat(n)        
