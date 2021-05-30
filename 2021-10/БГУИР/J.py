n = int(input())
g = {}
l = []
for i in range(n):
  s = input()
  l.append(s)
  c = s[0]
  j = 1
  while(j<len(s)):
    if s[j] == c:
      g[c] = 1
    else:
      g[c] = g.pop(c, 0)
      c = s[j]
    j = j+1
  g[c] = g.pop(c, 0)

sum = 0
for x in g.keys():
  sum = sum + g[x] + 1
  g[x] = sum - g[x] - 1
print(sum)
for s in l:
  c = s[0]
  k = 0
  j = 1
  print(g[c]+k+1,end = ' ')
  while(j<len(s)):
    if s[j] == c:
      k = 1-k
    else:
      k = 0
      c = s[j]
    print(g[c]+k+1,end = ' ')
    j = j+1
  print('')