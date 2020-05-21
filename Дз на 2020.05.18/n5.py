nums = [12,4,12,41,24,23,452,3,5,2473,345,123,4,234,235]

def qsort(nums):
	if(nums==[]):
		return []
	else:     
		q = nums[0]
		s = []
		m = []
		e = []
		for n in nums:
			if n < q:
				s.append(n)
			elif n > q:
				m.append(n)
			else:
				e.append(n)
	return qsort(s) + e + qsort(m)

l = qsort(nums)

print(l)