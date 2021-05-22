a = []

def f(n):
	if a[n] == -1:                 
		if n>1:
			return f(n-1)+f(n-2)
		else:
			return 1
	else:
		return a[n]

def main(n):
	for x in range(n+1):
		a.append(-1) 
	a[0] = 0
	y = f(n)
	return y
	

n = int(input())
print(main(n))             
