n = int(input())
m = int(input())
if (m%n==0):
    k = m//n
    while((k%2==0) & (k!=0)):
        k=k//2
    if k == 1:
        print("YES")
    else:
        print("NO")
else:
    print("NO")