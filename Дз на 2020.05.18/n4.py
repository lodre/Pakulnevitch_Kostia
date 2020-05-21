def find(s1,s2,i,j):
	if j<len(s1):
		if(i<len(s2)):
			if(s1[j]==s2[i]):
				return find(s1,s2,i+1,j+1)
			else:
				return find(s1,s2,0,j+1)
		else:
			return (j-i)
	else: 
		return -1

s1 = "iowjeoifewaljoijo" 
s2 = "al"

print(find(s1,s2,0,0))