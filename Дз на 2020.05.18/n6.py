nums = [12,4,12,41,24,23,452,3,5,2473,345,123,4,234,235]

def swap(l,i,j):
	x=l[i]
	l[i]=l[j]
	l[j]=x
	return l
                        
def heap(l,i):
	if(2*i+2<len(l)):
		if (l[i]>=l[2*i+1]):
			if (l[i]>=l[2*i+2]):
				return heap(heap(l,2*i+1),2*i+2)
			else:
				return heap(swap(l,i,2*i+2),0)
		else:
			return heap(swap(l,i,2*i+1),0)
	elif(2*i+2==len(l)):
		if (l[i]>=l[2*i+1]):
				return heap(l,2*i+1)
		else:
			return heap(swap(l,i,2*i+1),0)
	else:
		return l	
                   
def heapsort(l1,l2):
	if (l1 == []):
		return l2
	else:
		l=heap(l1,0)
		return heapsort(l[1:],l2 + [l[0]])
                     
                          
print(heapsort(nums,[]))

