n = int(input())
l = (input()).split()
for i in range(len(l)):
	l[i] = int(l[i])          
a = []                           
b = []                    
for i in range(n):
	b.append(-1)
for i in range(n):
	a.append(b.copy())
def f(x,y):
	if (a[x][y] == -1)&(x!=y): 
		if (g(x-1,y) == 1)|(g(x+1,y) == 1):
			a[x][y] = 1
			return 1
		else:
			a[x][y] = 0
			return 0		
	else:
		return a[x][y]
def g(x,y):
	if (a[x][y] == -1)&(x!=y): 
		if (f(x-1,y) == 1)|(f(x+1,y) == 1):
			a[x][y] = 1
			return 1
		else:
			a[x][y] = 0
			return 0		
	else:
		return a[x][y]
                  
for x in range(n):
	for y in range(n):
		f(x,y)

def h(l):
	b = True
	for x in l:
		if x == 0:
			
	return b

for l in a:
	if h(l):
		sum = sum + 1

print(sum)
