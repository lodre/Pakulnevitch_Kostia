n = int(input())
a = []
for x in range(n):
	m = int(input())
	l = (input()).split()
	for i in range(len(l)):
		l[i] = int(l[i])    
	g = []
	for x in range(m):
		g.append(0)      
	i = m - 1
	d = 0
	while(i>-1):
		d = max(l[i],d)
		if d>0:
			g[i] = 1
			d = d - 1
		i = i-1	
	a.append(g)
def p(s):
	for x in s:        
		print(str(x), end = ' ')
for s in a:
	p(s)