g = []
for i in range(10):
    g.append([0]*10)


n = int(input())
a = [int(x)%10 for x in input().split()]
g[a[0]][a[0]]+=1
a = a[1:]
for x in a:
    gg = []
    for i in range(10):
        gg.append([0]*10)
    for i in range(10):
        for j in range(10):
            gg[(x+i)%10][x] += g[i][j]
            gg[((x-1)*j+i)%10][(x*j)%10] += g[i][j]
    g = gg
for x in g:
    sum = 0
    for y in x:
        sum+=y
    print(sum%1000000007,end=" ")
print('')