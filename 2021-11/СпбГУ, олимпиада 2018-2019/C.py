n,a,b = list(map(int, input().split()))

r = ((n-1)//(a+b))

l = [0]
sum = 1
for _ in range(r):
    ll = []
    for x in l:
        ll.append(x+a)
        ll.append(x+b)
    ll = list(set(ll))
    sum+=len(ll)
    l = ll
print(sum)