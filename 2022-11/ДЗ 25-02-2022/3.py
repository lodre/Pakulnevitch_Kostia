l = []
n = int(input())
count = 0
for i in range(1,n):
    l.append([])
    for j in range(i-1,-1,-1):
        l[len(l)-1].append([j,i])
        count+=1

g = [""]*(2*n+1)
for y in l:
  for x in y:
    for i in range(2*x[0]):
        if i%2 == 0:
            g[i]+="-"
        else:
            g[i]+=" "
    g[2*x[0]]+="*"
    for i in range(2*x[0]+1,2*x[1]):
        if i%2 == 0:
            g[i]+="+"
        else:
            g[i]+="|"
    g[2*x[1]]+="*"
    for i in range(2*x[1]+1,len(g)):
        if i%2 == 0:
            g[i]+="-"
        else:
            g[i]+=" "
for s in g:
    print(s)