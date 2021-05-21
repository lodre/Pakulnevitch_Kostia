#https://codeforces.com/contest/1499/problem/B

t = int(input())

for i in range(t):
	s = input()
	n = len(s)
	i = 0                
	while(i<n-1):
		if (s[i] == '1')&(s[i+1] == '1'):
			break
		else:
			i = i+1
	while(i<n-1):
		if (s[i] == '0')&(s[i+1] == '0'):
			break
		else:
			i = i+1
	if i == n-1:
		print('YES')
	else:
		print('NO')
