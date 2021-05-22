def g(n,i):
	if i<0:
		return 0
	elif n == 0:
		if i == 0:
			return 1
		else:
			return 0
	else:
		return g(n-1,i+1)+g(n-1,i-1)
       
n = int(input())             
print(g(2*n,0))    	
