way = 0
k = 0
for i in range(100):
    if way == 0:
        if k == 0:
            k = 1
            way = 1
            print("a")
            k = 0
    if way == 1:
        if k == 0:
            k = 1
            way = 0
            print("b")
            k = 0