n = int(input())

l = []
g = [1]

def li(x1,x2):   
	for i in range(len(g)):
		if x1 == g[i]:
			if x2 == g[i-1]:
				return True
			else:
				return False

def find(x):
	for y in l:                
		if (y[0]==x)&(g.count(y[1])==0):
			return y[1]
		if (y[1]==x)&(g.count(y[0])==0):
			return y[0]

for i in range(n):
	s = input()
	s = s.split()
	for i in range(3):
		s[i] = int(s[i])
	l.append(s.copy())

for i in range(n-1):
	g.append(find(g[i]))

sum = 0
for h in l:
	sum = sum+h[2]

sum2 = 0
for h in l:
	if (li(h[0],h[1])):
		sum2 = sum2 + h[2]

sum3 = sum - sum2           

print(min(sum2,sum3))