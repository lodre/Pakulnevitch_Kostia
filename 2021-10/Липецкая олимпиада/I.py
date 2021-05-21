l = (input()).split()
             
n = int(l[0])
k = int(l[1])

s = 1

for i in range(k+1):
	if i <= 0:
		s = 1
	elif (n == 0):
		s = 0
	else:
		s = (((n//2)*s)+(n%2)+(n//2)-1)%998244353 


print(s)