n = int(input())

l = [('polycarp',1)]

def find(s):
	for x in l:
		if x[0] == s:
			return x[1]

for i in range(n):
	s = input()
	s=s.lower()
	s=s.split()     
	l.append((s[0],find(s[2])+1))

m = 1
for y in l:
	if y[1]>m:
		m = y[1]
print(m)