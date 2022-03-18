n = int(input())
count = 0
l = [""]*(n-1)
for i in range(1,n):
    for j in range(i-1,-1,-1):
        for k in range(n-1):
            if(k!=j):
                l[k]+=" "
            else:
                l[k]+="|"
        count+=1
    count+=1
    for j in range(n-1):
        l[j]+=" "
for i in range(n-1):
    print("="*count)
    print(l[i])
print("="*count)