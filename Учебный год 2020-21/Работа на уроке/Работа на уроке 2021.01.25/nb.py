import sys
print("? 0")
a = int(input())
        
b = 2**(a-1)  

l = []

def g(l,x):
	s = 0   
	for y in l:
		s = s*2 + y
	return int(s*2 + x)

def f():
	i = b   
	while(i>=1):
		print("? "+str(g(l,i)))
		j = int(input())
		if j == a:
			l.append(0)
		else:
			l.append(1)
		i = i/2

f()

print(int(g(l,0)/2))		 

sys.stdout.flush()

