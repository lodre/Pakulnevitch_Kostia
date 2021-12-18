def f(n,m):               
	l = []                      
	for i1 in range(n+1):
		for j1 in range(m+1):
			for i2 in range(n+1):
				for j2 in range(m+1):
					l.append(((i1,j1),(i2,j2)))
	g = []
	for x in l:
		if ((x[0][0]>x[1][0])&(x[0][1]>x[1][1])):
			g.append(x)
	return len(g)

def g(n,m):
	return (n*m*(n+1)*(m+1))/4


                   
for n in range(15):
	for m in range(15):      
		print(f(n,m))
		print(g(n,m))

                     
print(f(6,3))
print(g(6,3))