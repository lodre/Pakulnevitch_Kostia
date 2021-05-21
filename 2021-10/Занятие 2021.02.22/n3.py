import re

s = "0.10"

g = re.match(r'^([1-9]\d*|0)\.\d+$', s)

if g:
	print('True')
else:
	print('False')                                         
