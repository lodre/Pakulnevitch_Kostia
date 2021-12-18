f = open('x.txt', 'r')

def parse(s):
	pos = 0
	len = 0
	count = 0
	for x in s:
		if ('0'<=x)&(x<='9'):
			if pos == 0:
				pos = 1
				len = len+1
				count = count + 1
			else:
				len = len + 1
		else:
			pos = 0
	return (len,count)

sum = (0,0)
for s in f:
	y = parse(s)
	sum = (sum[0]+y[0],sum[1]+y[1])
if sum[1]>0:
	print(sum[0]/sum[1])
else:
	print('No num')