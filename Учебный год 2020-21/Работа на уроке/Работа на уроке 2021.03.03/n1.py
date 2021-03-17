s = "a|b|[1-9]"
pos = 0

def alt():
	global pos
	print(pos) 
	l = [concat()]
	while (s[pos] == '|'):
		pos = pos+1
		l.append(concat())
		if (pos==len(s)):
			break
	return ('Alt', l)

def concat():
	global pos
	print (pos)
	l = [] 
	while ((s[pos] != '|') & (s[pos] != ')')):
		if s[pos] == '(':
			pos = pos+1
			x = alt()
			pos = pos+1
		elif (s[pos] == '['):
			x = ('Range',[s[pos+1],s[pos+3]])
			pos = pos + 4
		else:
			x = ('Char', s[pos])
		pos = pos+1
		l.append(x)	
		if (pos==len(s)):
			break
	
	return ('Concat', l)

def fix(t):
	s = t[0]
	l = t[1]
	if s == 'Alt':
		if len(l) == 1:
			return fix(l[0])
		else:                           
			for i in range(len(l)):
				l[i] = fix(l[i])
			return t
	elif s == 'Concat':
		if len(l) == 1:
			return fix(l[0])
		else:
			for i in range(len(l)):
				l[i] = fix(l[i])
			return t
	else: 
		return t
 

p = alt()

p = fix(p)

print(p)
			
	        

def sum(s):
	su = 0
	for c in s:
		su = su + ord(c)
	print(chr(su))
