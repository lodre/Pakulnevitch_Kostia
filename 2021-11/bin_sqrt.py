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