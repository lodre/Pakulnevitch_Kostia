import re

s = "0.0101"

g = re.match(r'^([1-9]\d*|0)\.\d*[1-9]$', s)

if g:
	print('True')
else:
	print('False')                                         
