n = int (input())
s1 = input()
s2 = input()

s = ""

for i in range(n):
	if s1[i] == s2[i]:
		s = s + '0'
	else:
		s = s + '1'

print(s)