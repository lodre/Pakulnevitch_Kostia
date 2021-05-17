sf = input()
sm = input()
ss = input()

s1 = 'rock'
s2 = 'scissors'
s3 = 'paper'

if (sf!=sm)&(sf!=ss)&(ss!=sm):
	print('?')
else:
	if sf == sm:
		if (((sf == s1)&(ss==s3))|((sf == s3)&(ss==s2))|((sf == s2)&(ss==s1))):
			print('S')
		else:
			print('?')
	elif sf == ss:
		if (((sf == s1)&(sm==s3))|((sf == s3)&(sm==s2))|((sf == s2)&(sm==s1))):
			print('M')
		else:
			print('?')	
	else:
		if (((ss == s1)&(sf==s3))|((ss == s3)&(sf==s2))|((ss == s2)&(sf==s1))):
			print('F')
		else:
			print('?')
	