import time

n = int (input ())    
                                  

 
def read(l,x,i,k):
	if i == len (s):
		l.append((x,k))
		return l
	else:
		if s[i] == ' ':
			l.append((x,k))
			return read(l,0,i+1,k+1)
		else:
			x = 10*x + int(s[i])
			return read(l,x,i+1,k)

ll = input()	 
l = ll.split()
             
for i in range(n):
	l[i] = int(l[i])            
           
for i in range(n):
	l[i] = (l[i],i+1)



def f(x):
	return x[0]
                           
l.sort(key = f)
      

s = ''          

for x in l:
	print(str(x[1]), end = ' ')
                                                   
                            
import time

n = int (input ())    
                                  

 
def read(l,x,i,k):
	if i == len (s):
		l.append((x,k))
		return l
	else:
		if s[i] == ' ':
			l.append((x,k))
			return read(l,0,i+1,k+1)
		else:
			x = 10*x + int(s[i])
			return read(l,x,i+1,k)
