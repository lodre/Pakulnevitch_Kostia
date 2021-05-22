a = []
l = [10,14,124,2421,12,412,4,32,4,12,3,12,12,533,43,3,2000]
n = len(l)

for x in range(n):
	a.append((1,-1))
a[0] = (1,0)

def fu(l,n):    
	x = l[n]
	N = n
	L = (1,-1)
	while(n>0):		
		n = n-1 
		if l[n]<x:
			if a[n][0]>=L[0]:
				L = (a[n][0]+1,n)   
	a[N] = L          
		

def main(l):                   
	for i in range(len(l)):
		fu(l,i)
	
main(l) 

def max():     
	n = 0
	L = (1,0)
	while(n<len(l)):                
		if a[n][0]>L[0]:
			L = a[n]
		n = n+1
	return L[1]
 
def printt(x):
	if (x == 0):
		print(l[0],end=' ')
	elif (x == -1):
		print(l[x],end=' ')
	else:
		printt(a[x][1])
		print(l[x],end=' ')
        
x = max()
                             
printt(x)                               
