n = int(input())

l = []

for x in range(n):
	l.append(int(input()))

def g(x):
 	sum = 0 
	while(x>0):
		x = x//10   
		sum = sum + 1
	return sum

def f(a,x):

def main(x):
	a = []
	for i in range(g(x)):
		a.append(-1)
	b = f(a,0)
	if b == True:
		print('YES')
	else:
		print('NO')
	


for x in l:
	main(x)
