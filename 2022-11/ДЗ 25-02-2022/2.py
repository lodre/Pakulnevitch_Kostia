def create(n):
    l = []
    for i in range(1,n):
        for j in range(i-1,-1,-1):
            l.append([j,j+1])
    return l

def fp(t,n):
    if n == 0:
        return [t.copy()]
    t.append(0)
    a = fp(t,n-1)
    t[len(t)-1] = 1
    a += fp(t,n-1)
    t.pop(len(t)-1)
    return a

def s(sn, arr):
    for y in sn:
        i = min(y)
        j = max(y)
        if arr[i]>arr[j]:
            c = arr[i]
            arr[i] = arr[j]
            arr[j] = c
    return arr
        

n = int(input())
l = create(n)

b = True

for g in fp([],n):
    f = s(l,g)
    if (f!=sorted(g)):
        print(f,g)
        b = False
        break
print(b)