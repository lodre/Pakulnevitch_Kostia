t = int(input())

for _ in range(t):
    n,s1,s2 = input().split()
    n = int(n)
    k = len(s1)+len(s2)
    i = 0
    while(i<min(len(s1),len(s2))):
        if s1[i]!=s2[i]:
            break
        k-=2
        i+=1
    if (n>=k)&((n-k)%2==0):
        print("YES")
    else:
        print("NO")