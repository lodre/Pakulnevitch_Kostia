def f(x):
	if x<=0:
		return 0           
	elif x>=100:
		return (x//100) + f(x%100)
	elif x>=20:
		return (x//20) + f(x%20)
	elif x>=10:
		return (x//10) + f(x%10)
	elif x>=5:
		return (x//5) + f(x%5)
	elif x>=1:
		return x

n = int(input())

print(f(n))