n = 10
k = 10

def f(n,k):
	if n == 0:
		if k == 0:
			return 1
		else:
			return 0
	elif k == 0:
		return 1
	elif n>k:
		return f(n-1,k)
	else:
		return f(n-1,k-n) + f(n-1,k)

print(f(n,k))
