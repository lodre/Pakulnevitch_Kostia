n = int(input())
r = 0
cnt = 0
sp = int(input()[2:])
lims = [301]
for ind in range(n-1):
    s = input()
    if s[0] == "1":
        sp = int(s[2:])
        while lims[-1] < sp:
            cnt += 1
            lims.pop()
    elif s[0] == "2":
        cnt += r
        r = 0
    elif s[0] == "3":
        newlim = int(s[2:])
        if sp > newlim:
            cnt += 1
        else:
            lims.append(newlim)
    elif s[0] == "4":
        r = 0
    elif s[0] == "5":
        lims = [301]
    elif s[0] == "6":
        r += 1
print(cnt)