n = int(input())

l = list(map(int, input().split()))

g = {}
for x in l:
    g[x-1] = 1 + g.pop(x-1, 0)

y1,y2 = 0,0
for x in range(10**5):
    y1,y2 = max((x+1)*g.pop(x,0)+y2,y1), y1

print(y1)