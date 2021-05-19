#https://codeforces.com/gym/102203/problem/I

s = (input()).split()
             
n = int(s[0])
k = int(s[1])

s = 1

for i in range(k+1):
	if i <= 0:
		s = 1
	elif (n == 0):
		s = 0
	else:
		s = (((n//2)*s)+(n%2)+(n//2)-1)%998244353 


print(s)
