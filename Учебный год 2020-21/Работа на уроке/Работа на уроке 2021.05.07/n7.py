n = int(input())

l = []

for i in range(n-1):
	s = (input()).split()
	l.append((i,int(s[0])-1,int(s[1])-1))

g = []

for i in range(n):
	g.append(0)

for x in l:
	g[x[1]] = g[x[1]] + 1
	g[x[2]] = g[x[2]] + 1

i = 0
r = -1
while (i<n):
	if g[i]>2:
		r = i
	i = i+1

def h(j,r):
	return (l[j][1]==r)|(l[j][2]==r)

if r == -1:
	for j in range(n-1):
		print(j) 
else:
	j = 0
	t1 = 0
	t2 = 3
	while(j<n-1):
		if (h(j,r))&(t1<3):
			print(t1)
			t1 = t1+1
		else:
			print(t2)
			t2 = t2+1
		j = j+1