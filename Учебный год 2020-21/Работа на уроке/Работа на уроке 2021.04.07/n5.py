a = []
l = [10,14,124,2421,12,412,4,32,4,12,3,12,12,533,43,3,2000]
n = len(l)

for x in range(n):
	a.append([])

def fu(l,n):
	x = l[n]
	L = []
	while(n<len(l)):
		if l[n]>x:
			if len(a[n])>len(L):
				L = a[n]
		n = n+1
	return [x]+L
	

def f(x):
	y = fu(l,x)
	a[x] = y
	return y

def main(l):                   
	a[-1] = [l[-1]]
	x = n - 2
	while x>-1:
		f(x)
		x = x-1
	
main(l)    

def max():     
	n = 0
	L = []
	while(n<len(l)):   
		if len(a[n])>len(L):
			L = a[n]
		n = n+1
	return L

            
print(max())         
