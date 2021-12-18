f = open('text.md', 'r')
g = open('text.html', 'w')

l = [([],'')]

for line in f:
	if (line[0] == ' ')|(line[0] == '\n'):  
		l[0] = (l[0][0],'p')
		l = [([],'p')] + l
	elif line[0] == '-':
		l[0] = (l[0][0],'h2')
		l = [([],'p')] + l	
	elif line[0] == '=':
		l[0] = (l[0][0],'h1')
		l = [([],'p')] + l
	else:
		l[0][0].append(line)
                               
l.reverse()

g.write("<html>\n<body>\n")
for z in l:               
	x = z[0]
	y = z[1]
	g.write('<'+y+'>\n')
	for s in x:
		g.write(s+'<br>')
	g.write('</'+y+'>\n')
g.write("</html>\n</body>")
	