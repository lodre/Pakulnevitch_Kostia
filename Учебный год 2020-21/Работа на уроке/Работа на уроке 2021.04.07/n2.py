a = []
n = int(input())          
                          
def g(x,i):
	if a[x][i] == -1:
		if x<2*n:
			if i<0:
				a[x][i] = 0
				return 0        	
			elif i == 0:
				a[x][i] = g(x+1,i+1)
				return g(x+1,i+1)
			else:
				y = g(x+1,i+1)+g(x+1,i-1)
				a[x][i] = y
				return y
		else:
			if i == 0:
				a[x][i] = 1
				return 1
			else:
				a[x][i] = 0
				return 0
	else:
		return a[x][i]
         
b = []                  
for x in range(2*n+1):
	b.append(-1)           
for x in range(2*n+1):
	a.append(b.copy())
print(g(0,0))                            
