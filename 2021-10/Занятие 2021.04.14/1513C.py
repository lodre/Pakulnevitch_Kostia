import sys
input = sys.stdin.buffer.readline

t = int(input())

mod = 10**9 + 7
x = [0]*(2*10**5 + 11)
x[0] = 1
a = [0]*(2*10**5 + 11)
x[0] = 1
a[9] = 1
for i in range(2*10**5 + 10):
  a[i] += a[i-9]
  a[i] += a[i-10]
  a[i] %= mod
for i in range(1, 2*10**5 + 10):
  x[i] = x[i-1]
  x[i] += a[i-1]
  x[i] %= mod
for _ in range(t):
    n, m = map(int, input().split())
    ans = 0
    while(n):
        ans += x[m+(n % 10)]
        n = n//10
        ans %= mod
    print(ans % mod)