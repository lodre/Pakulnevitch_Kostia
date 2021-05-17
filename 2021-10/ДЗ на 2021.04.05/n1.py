def sum(l):     
	s = ''
	for x in l:
		s = s+x
	return s

l = ["",[]]

f = open('text.txt', 'r')

for s in f:
	for x in s:
		if l[1].count(x) == 0:
			l[1].append(x)
		else:
			y = sum(l[1])
			if len(y) > len(l[0]):
				l[0] = y
			l[1] = []
	
print(l[0])