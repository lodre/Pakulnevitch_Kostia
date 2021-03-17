import re

s = "-.25"

g = re.match(r'-{0,1}(\d+\.\d*|\d*\.\d+)', s)

if g:
	print('True')
else:
	print('False')                                         
