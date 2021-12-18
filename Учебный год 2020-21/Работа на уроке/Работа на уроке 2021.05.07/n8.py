n = int(input())

s = (input()).split()

for i in range(n):
	s[i] = int(s[i])

def d(l,i):
	if i == 0:
		return (l[2:]).copy()
	elif i == len(l)-1:
		return (l[:(len(l)-2)]).copy()
	else:             
		l.pop(i-1)
		l.pop(i-1)
		l.pop(i-1)
		return l.copy()

def f(l):               
	if l == []:
		return 0
	m = 0
	for i in range(len(l)):
		m = max(m,l[i]+f(d(l.copy(),i)))
	return m

print(f(s))