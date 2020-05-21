def print_cir(n):             
	for y in range(0,2*n):
		for x in range(0,2*n):
			if ((x-n)*(x-n) + (y-n)*(y-n) < n*n):
				print("*", end =" ")
			else:
				print(" ", end =" ")
		print(" ")

n = 10

print_cir(n)