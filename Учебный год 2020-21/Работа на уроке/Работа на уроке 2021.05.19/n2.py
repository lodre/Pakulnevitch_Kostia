#https://codeforces.com/gym/102203/problem/B

n,m = map(int, input().split())

s = input()

l = []
s0 = 0
i = 0
while(i<n):
	if s[i] == '0':
		l.append(s0)
		s0 = 0
	else:
		s0+=1
	i+=1

R = max(l)

for i in range(m):
	s = int(input())
	if s>R:
		print('YES')
	else:
		print('NO')      
        
