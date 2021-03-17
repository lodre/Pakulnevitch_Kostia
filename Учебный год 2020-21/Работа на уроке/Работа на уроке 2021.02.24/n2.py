import re

s = "70.1"

g = re.match(r'^\d+\.\d+$', s)

if g:
	print('True')
else:
	print('False')                                         
