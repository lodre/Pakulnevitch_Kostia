f = open('text.html', 'r')
g = open('text.md', 'w')

l = [['','p']]  

def end(s,i):
	while (s[i] != '>'):
		i = i+1 
	return i+1

for line in f:
	i = 0
	while(i<len(line)):
		c = line[i]
		if c == '<':                 
			d = line[i+1]
			if d == 'b':
				if line[i+2] == 'r':
					l[0][0] = l[0][0] + '\n'
					i = end(line,i)
				else:
					l[0][0] = l[0][0]Ù 
			elif d == 'h':                
				if line[i+2] != 't':
					if line[i+2] == '1':
						l = [['','h1']] + l
					elif line[i+2] == '2':
						l = [['','h2']] + l
				l[0][0] = l[0][0]+'<'
			elif d == 'p':               
				l = [['','p']] + l
				l[0][0] = l[0][0]+'<'
			else: 
				l[0][0] = l[0][0]+'<'
		elif c!= '\n':
			l[0][0] = l[0][0] + c 
		i = i+1
				                               
l.reverse()

print(l)
                           
for z in l:               
	x = z[0]
	y = z[1]
	g.write(x+'\n')
	if y == 'p':
		g.write('   \n')	
	elif y == 'h1':
		g.write('===\n')
	else:      
		g.write('---\n')