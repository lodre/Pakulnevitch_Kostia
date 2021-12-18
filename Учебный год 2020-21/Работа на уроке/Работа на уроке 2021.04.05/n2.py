def add(l,i):
	g = []
	for x in l:
		y = x.copy()
		y.append(i)
		g.append(y)
	return g

def all(n,k):
	l = [[]]
	for j in range(n):
		g = []
		for i in range(k):
			g = (g + add(l,i)).copy()  
		l = g.copy()            
	return l

print(all(2,3))                    
