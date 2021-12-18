s = 0

n = int(input())
 
sp = 0
r = 0
R = 0

for i in range(n):
	l = (input()).split()
	for i in range(len(l)):
		l[i] = int(l[i])  
	if l[0] == 1:
		sp = l[1]
	elif l[0] == 2:
		if r == 1:
			R = 1
	elif l[0] == 3:
		if sp>l[1]:
			s = s+1
	elif l[0] == 4:
		r = 0
		if R>1:
			s = s+1
		R = 0 
	elif l[0] == 6:
		r = 1

if R == 1:
	s = s + 1

print(s)