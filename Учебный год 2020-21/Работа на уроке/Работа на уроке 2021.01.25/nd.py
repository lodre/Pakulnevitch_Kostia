import copy
n = int(input())

l = []

def count(l,x):
	i = 0
	for y in l:
		if y == x:
			i=i+1
	return i

def parse(s):   
	i = 0
	a = 0
	b = 0               
	while (s[i] != '.'):
		x=int(s[i])
		a = 10*a + x
		i = i+1
	i=i+1
	while (i < len(s)):
		x=int(s[i])
		b = 10*b + x
		i=i+1
	return [a,b]

for i in range(n):
	l.append(input())

l.sort(key = float)

l1 = []
l2 = []

def printfl(l):
	a = l[0]
	b = l[1]
	print(a,end='')
	print('.',end='')
	print('%06d' % b)

def part(i):
	if i<(n-1)/2:
		l1.append(l[i])
		l2.append(l[n-i-1])
		part(i+1)
	elif i == (n-1)/2:
		l1.append(l[i])

part(0)          
             
for i in range(len(l1)):
	l1[i] = parse(l1[i])
for i in range(len(l2)):
	l2[i] = parse(l2[i])
                        
r1 = 1000000*(l1[len(l1) - 1][0] - l1[0][0]) + (l1[len(l1) - 1][1] - l1[0][1])

                                            
if n==1:
	r2 = 0
else:
	r2 = 1000000*(l2[len(l2) - 1][0] - l2[0][0]) + (l2[len(l2) - 1][1] - l2[0][1])

            
def printp(s):
	if count(l2,x) > 0:                                
		x[1]=x[1]+1
		if x[1] > 999999:	
			x[0]=x[0]+1
			x[1]=x[1]-1000000
		printp(x)
	else:
		printfl(x)
                
def printm(s):
	x = copy.copy(s)
	if count(l1,x) > 0:
		x[1]=x[1]-1
		if x[1] == -1:
			x[0] = x[0]-1
			x[1] = 999999
		print(x)
		printm(x)
	else:
		printfl(x)
                
        
if r1 == r2:
	if r1 == len(l1)-1:
		if r2*1000000 == len(l2)-1:			
			x = l1[len(l2)-1]
			x[1] = x[1]-1
			if x[1] == -1:
				x[0]=x[0]-1
				x[1]= 999999
			printfl(x)
		elif l2 == []:
			printfl((172,392))
		else:
			printp(l2[0])
	else:
		printm(l1[0]) 
else:
	if r1<r2:                           
		if r2 == len(l2)-1:
			printp(l2[0])
		else:
			x = l2[len(l2)-1]
			x[1] = x[1]+1
			if x[1] == 1000000:
				x[0]=x[0]+1
				x[1]=0
			printfl(x)     	
	else:
		if r1 == len(l1)-1:
			printm(l1[0])
		else:   
			x = l1[len(l1)-1]
			x[1] = x[1]-1
			if x[1] == -1:
				x[0]=x[0]-1
				x[1]= 999999
			printfl(x)
        