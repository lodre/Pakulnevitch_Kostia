n = int (input ())    
	 
l = input().split()
             
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
                                                   
