import sys
print("? 0")
a = int(input())

l=[]

def f():
	for i in range(29):
		print("? "+str(2**i))
		b = int(input())
		if b>a:
			l.append(0)
		else:
			l.append(1)       

f()
j = 0
for x in l:
	j = j+x

if j==a:
	l.append(0)
else:
	l.append(1)

l.reverse()

def g(l):
	s = 0
	i = 0
	for x in l:
		s = 2*s + x
	return s

print(g(l))