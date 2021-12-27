def root0(a):
    l = 0
    r = len(a)-1
    for i in range(1000000):
        d = (l+r)//2
        if a[d]>0:
            r = d
        else:
            l = d
    return l

def root(a,x):
    l = 0
    r = len(a)-1
    for i in range(1000000):
        d = (l+r)//2
        if a[d]>x:
            r = d
        else:
            l = d
    return l

a = []
for i in range(1000):
    a.append((i-20)*(i-20)*(i-20))
print("f(x)=0\nx=",end="")
print(root0(a))
print("f(x)=",end="")
y = int(input())
print("x=",end="")
print(root(a,y))