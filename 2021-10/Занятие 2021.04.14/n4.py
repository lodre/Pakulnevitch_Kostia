from tkinter import *
import random
import math
root = Tk()
l = [(100,100,100),(-100,100,100),(100,-100,100),(-100,-100,100)] #coordinates, charge

g = []
for i in range(70*len(l)):
	x = (i/70)*2*math.pi                                    
	g.append([l[i//70][0]+25*math.sin(x),l[i//70][1]+25*math.cos(x)])


c = Canvas(root, width=600, height=600, bg='white')
c.pack()

for z in l:                                                                            	             
	if z[2]>0:
		c.create_oval(300+z[0]-25, 300+z[1]-25, 300+z[0]+25, 300+z[1]+25, fill ='red')       
	else:
		c.create_oval(300+z[0]-25, 300+z[1]-25, 300+z[0]+25, 300+z[1]+25, fill ='blue')                                

def mi(x):
	return x



for z in g:
	for i in range(5000):
		x = z[0]
		y = z[1]
		s = [0.,0.]
		for t in l:      
			x0 = t[0]
			y0 = t[1]
			ch = t[2]
			c2 = ch/(((x-x0)*(x-x0)+(y-y0)*(y-y0))**(0.5))    
			s[0] = s[0] + c2*(x-x0)/(((x-x0)*(x-x0)+(y-y0)*(y-y0))**(0.5))
			s[1] = s[1] + c2*(y-y0)/(((x-x0)*(x-x0)+(y-y0)*(y-y0))**(0.5))
		s[0] = s[0]/mi((s[0]*s[0] + s[1]*s[1])**(0.5))
		s[1] = s[1]/mi((s[0]*s[0] + s[1]*s[1])**(0.5))
		c.create_line((int(z[0])+300), (int(z[1])+300), (int(z[0] + s[0])+300), (int(z[1] + s[1])+300))
		z[0] = z[0] + s[0]
		z[1] = z[1] + s[1]
		b = 0
		for zz in l:
			if (zz[0]-z[0])*(zz[0]-z[0])+(zz[1]-z[1])*(zz[1]-z[1])<625:
				b = 1
		if (z[0]*z[0]>90000)|(z[1]*z[1]>90000)|(b==1):
			break
  

root.mainloop()