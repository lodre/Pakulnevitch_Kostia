import math
n,s,f = list(map(int, input().split()))
s-=1
f-=1

g = []

for i in range(n):
    g.append(list(map(int, input().split())))

l = [math.inf]*(n+1)
rev = [1]*n
l[s] = 0
for _ in range(n-1):
    mi = n
    for i in range(n):
        if rev[i] == 1:
            if l[i]<l[mi]:
                mi = i
    if mi == n:
        break
    rev[mi] = -1
    for i in range(n):
        if rev[i] == 1:
            if g[mi][i] != -1:
                l[i] = min(l[i],l[mi]+g[mi][i])

if l[f]==math.inf:
    print(-1)
else:
    print(l[f])