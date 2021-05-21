t = int(input())
ml = []
for ind in range(t):
	s = input()
	s = s.split()
	for i in range(len(s)):
		s[i] = int(s[i])
	n = s[0]
	m = s[1]
	a = []
	b = []             
	for ind in range(m+2):
		b.append(0)
	for ind in range(n+2):
		a.append(b.copy())
	for i in range(n):
		s2 = input()
		for j in range(m):
			if s2[j] == '*':
				a[i+1][j+1] = - 1
	ml.append([n,m,a])
def f(a,x,y):               
	if a[y+1][x+1] == -1:
		a[y+1][x+1] = 1 + min([a[y+2][x],a[y+2][x+1],a[y+2][x+2]])              
def sum(a):
	s = 0
	for l in a:
		for x in l:
			s = s + x
	return s
def main():
	for e in ml:    
		n = e[0]
		m = e[1]
		a = e[2] 
		y = n-1
		x = 0
		while(y>-1):  
			while(x<m):
				f(a,x,y)
				x = x+1
			x = 0
			y = y-1   
		print(sum(a))
main()