n,m = list(map(int, input().split()))

k = 0
while(k*k<n+2*m):
    k+=1
if k*(k-1)>=n+2*m:
    print(4*k-2)
else:
    print(4*k)