a = []
l = [10,14,124,2421,12,412,4,32,4,12,3,12,12,533,43,3,2000]
n = len(l)

for x in range(n):
	a.append(([],0))

def fu(l,n):
	x = l[n]
	L = ([],0)
	while(n<len(l)):
		if l[n]>x:
			if a[n][0]>L[0]:
				L = a[n]
		n = n+1
	return ([x]+L[0],L[1]+1)
	

def f(x):
	y = fu(l,x)
	a[x] = y
	return y

def main(l):                   
	a[-1] = ([l[-1]],1)
	x = n - 2
	while x>-1:
		f(x)
		x = x-1
	
main(l)    

def max():     
	n = 0
	L = ([],0)
	while(n<len(l)):   
		if a[n][1]>L[1]:
			L = a[n][0]
		n = n+1
	return L
            
print(a)         
print(max())