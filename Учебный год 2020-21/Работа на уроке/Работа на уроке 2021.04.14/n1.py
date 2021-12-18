n = int(input())

l = []
for x in range(n):
	h = (input()).split()
	for i in range(len(h)):
		h[i] = int(h[i])
	l.append(h)    

a = [0,1,2,3,4,5,6,7,8,9]


def g(x):
	if x < 1:
		return 0                
	elif x%10 == 9:
		return 10+100*g(x//10)
	else:
		return 1+(x%10)+10*g(x//10)
               
def f(x):
	if x<len(a):
		return a[x]
	else:
		y = g(f(x-1))
		a.append(y) 
		return y

for x in range(1000):
	f(x)

def le(x):
	sum = 0 
	while(x>0):
		x = x//10   
		sum = sum + 1
	return sum

def main():    
	for x in l:
		sum = 0
		while(x[0]>0):
			sum = sum + le(f((x[0]%10)+x[1])) 
			x[0] = x[0]//10
		print(sum)
                        
                      
main()
