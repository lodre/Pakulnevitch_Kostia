n = int(input())
m = -1
i = -1
for ind in range(n):
    x,y = list(map(int, input().split()))
    if y == 1:
        if x>m:
            i = ind+1
            m = x
print(i)