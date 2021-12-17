n = int(input())
def root(n):
    l = 0
    r = n
    for i in range(1000000):
        d = (l+r)/2
        if d*d>n:
            r = d
        else:
            l = d
    return l

print(root(n))



def root(a,n):
    l = 0
    r = len(a)-1
    for i in range(1000000):
        d = (l+r)//2
        if a[d]>n:
            r = d
        else:
            l = d
    return l

a = []
for i in range(1000):
    a.append((i-20)*(i-20)*(i-20))
print(root(a,n))