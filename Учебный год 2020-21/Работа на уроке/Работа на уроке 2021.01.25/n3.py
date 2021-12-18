l = input()
l = l.split()
n = int(l[0])           
m = int(l[1])                                

s = input()
           
      
pos = [0]
                

def f():
	if pos[0] == 0:
		return 1
	else:
		if s[pos[0]-1] == '-':
			return -1
		else:
			return 1

def g(x):
	if x == '-':
		return 1
	else:
		return -1

def mul(l,x):
	for i in range(len(l)):
		l[i] = x*l[i]

def parse_e():
	x = parse_s()
	while (pos[0]<len(s)):
		op = s[pos[0]]  
		pos[0] = pos[0]+1
		x.extend(parse_s())
	pos[0] = pos[0]+1	
	print(x)
	return x

def parse_s():
	if pos[0]>=len(s):
		return []
	else:                     
		if s[pos[0]]=='(':
			y = g(s[pos[0]-1])
			pos[0]=pos[0]+1
			x = parse_e()
			mul(x,y)
			pos[0]=pos[0]+1
			return x
		else:
			i = f()
			pos[0] = pos[0]+1 
			return [(s[pos[0]-1],i)]

x = parse_e()
                        
        
l = []

for i in range(m):
	st = input()
	st = st.split()
	l.append([st[0], int(st[1]), int(st[2])])
              
                                       
def fin(x,i):
	for j in range(len(l)):
		if x==(l[j])[0]:
			if i>0:
				return ((l[j])[2])*i
			else:
				return ((l[j])[1])*i 

sum = 0

for h in x:
	sum = sum + fin(h[0],h[1])

print(sum) 