#https://codeforces.com/gym/102137/problem/C

n,m = map(int, input().split())

s = input()

l = []
for i in range(m):
	y = input().split()
	l.append([y[0],int(y[1]),int(y[2]),0])
               
def fs(i,r):          
	i = fr(i,r)
	while(i<n):     
		if s[i] == ')':
			i = i+1
			break
		elif s[i] == '-':  
			i = fr(i+1,1-r)
		else:
			i = fr(i+1,r)
	return i

def fr(i,r):                        
	if s[i] == '(':
		return fs(i+1,r)
	elif r == 0:
		add(s[i])
		return i+1
	else:
		der(s[i])
		return i+1
                           
def add(x):             
	for r in l:
		if x == r[0]:
			r[3] = r[3] + 1     
def der(x):
	for r in l:
		if x == r[0]:
			r[3] = r[3] - 1

fs(0,0)

r = 0
for x in l:       
	r = r + max((x[2])*(x[3]),(x[1])*(x[3]))

print(r)
