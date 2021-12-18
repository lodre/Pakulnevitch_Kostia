l = input()
l = l.split(maxsplit = 2)
n = int(l[0])           
m = int(l[1])                                
s2 = input()
def sub(k,i,s):
	if s == k:
		print('NO')
		return 0
	else:
		if i == len(s2):
			print('YES')
			return 0
		else:
			if s2[i] == '1':
				return sub(k,i+1,s+1)
			else:
				return sub(k,i+1,0)
l = []

for i in range(m):
	l.append(int (input ()))        
for x in l:
	sub(x,0,0) 
 
