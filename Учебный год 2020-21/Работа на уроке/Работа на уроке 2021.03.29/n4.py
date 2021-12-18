s = 'A&B|C'
pos = [0]

def parse_s(s):
	l = ['->',[]]
	l[1] = [parse_r(s)]
	while(pos[0]<len(s)):
		if s[pos[0]] == ')':
			break
		else:
			pos[0] = pos[0]+2
			y = parse_r
			l[1].append(y)
	if len(l[1]) == 1:
		return l[1][0]
	else:
		return l

def parse_r(s):
	l = ['|',[]]
	l[1] = [parse_t(s)]
	while(pos[0]<len(s)):
		if ((s[pos[0]] == ')')|(s[pos[0]] == '-')):
			break
		else:
			pos[0] = pos[0] + 1
			y = parse_t(s)
			l[1].append(y)
	if len(l[1]) == 1:
		return l[1][0]
	else:
		return l

def parse_t(s):
	l = ['&',[]]
	l[1] = [parse_k(s)]
	while(pos[0]<len(s)):
		if ((s[pos[0]] == ')')|(s[pos[0]] == '-')|(s[pos[0]] == '|')):
			break
		else:
			pos[0] = pos[0] + 1
			y = parse_k(s)
			l[1].append(y)
	if len(l[1]) == 1:
		return l[1][0]
	else:
		return l

def parse_k(s):
	y = s[pos[0]]
	if y == '!':
		return ['!',[parse_k(s)]]
	elif y == '(':
		pos[0] = pos[0] + 1
		return parse_s(s)
	else:
		pos[0] = pos[0]+1 
		return s[pos[0]-1]

print(parse_s(s))