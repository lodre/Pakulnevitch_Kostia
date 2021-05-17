t = int(input())

g = []

def f(a,n):               
	for i in range(n-1):
		for j in range(n-1):
			if (a[i][j]=='1')&(a[i+1][j]=='0')&(a[i][j+1]=='0'):
				return False
	return True

for i in range(t):
	n = int(input())
	a = []
	for j in range(n):
		s = input()
		l = []
		for c in s:
			l.append(c)
		a.append(l.copy())
	if f(a,n):
		g.append('YES')
	else:
		g.append('NO')

for s in g:
	print(s)