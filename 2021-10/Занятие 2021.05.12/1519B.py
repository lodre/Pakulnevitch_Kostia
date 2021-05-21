t = int(input())

l = []

for i in range(t):
	s = (input()).split()
	for j in range(3):
		s[j]= int(s[j])
	l.append(s)

for s in l:
	n = s[0]
	m = s[1]
	k = s[2]
	if k == n*m - 1:
		print('yes')
	else:
		print('no')

