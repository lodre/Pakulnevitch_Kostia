a = []
def f(n,k):
	if a[n][k] == -1:
		if n<k:
			return f(n,k-1)
		else:
			s = 0
			for i in range((n // k)+1):
				s = s + f(n-i*k, k-1)
			a[n][k] = s
			return s
	else:
		return a[n][k]

def main(n):
	b = []
	for x in range(n+1):
		b.append(-1)
	for x in range(n+1):
		a.append(b.copy()) 
	for x in range(n):
		a[x+1][0] = 0
	for x in range(n):
		a[0][x+1] = 1
	a[0][0] = 1
	y = f(n,n)
	return y
	

n = int(input())
print(main(n))             
