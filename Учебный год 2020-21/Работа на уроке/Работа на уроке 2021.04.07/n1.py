def f(n):
	if n == 0:
		return 1
	elif n>0:
		s = 0
		for i in range(n):
			s = s + f(n-1-i)*f(i)
		return s
	else:
		return 0
                          
def g(n,i):
	if i<0:
		return 0
	elif n == 0:
		return 1
	else:
		return g(n-1,i+1)+g(n-1,i-1)
       
n = int(input())             
print(g(n,0))
	
