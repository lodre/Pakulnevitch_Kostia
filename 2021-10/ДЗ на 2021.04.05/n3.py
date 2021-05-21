def sum(l):     
	s = ''
	for x in l:
		s = s+x
	return s

l = ["",'f',""]

f = open('text2.txt', 'r')

for s in f:
	for x in s:
		if l[1] != x:
			l[0] = l[0]+x
			l[1] = x
		else:
			if len(l[0]) > len(l[2]):
				l[2] = l[0]
			l[1] = 'f'
			l[0] = ''
	
print(l[0])
print(len(l[0]))