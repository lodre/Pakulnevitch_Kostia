import re

s = "50"

g = re.match(r'^[2-7][0|2|4|6|8]$', s)

if g:
	print('True')
else:
	print('False')                                         
