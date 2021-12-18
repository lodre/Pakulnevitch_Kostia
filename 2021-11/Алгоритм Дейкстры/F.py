import math

n = int(input())
s = 0
f = n-1

costs = list(map(int, input().split()))
m = int(input())
g = []
for i in range(n):
    g.append([-1]*n)
for _ in range(m):
    x,y = list(map(int, input().split()))
    x-=1
    y-=1
    g[x][y] = costs[x]
    g[y][x] = costs[y]


l = [math.inf]*(n+1)
rev = [1]*n
l[0] = 0
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

if l[n-1]==math.inf:
    print(-1)
else:
    print(l[n-1])