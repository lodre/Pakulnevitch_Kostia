#https://codeforces.com/gym/102203/problem/B
 
s = (input()).split()
             
n = int(s[0])
m = int(s[1])
 
s = input()
 
r = 0
R = 0
 
for x in s:
	if x == '1':
		r = r+1
	else:
		R = max(R,r)
		r = 0
        
for i in range(m):
	s = int(input())
	if s>R:
		print('YES')
	else:
		print('NO')