import re

s = "222.254.252.110"

g = re.match(r'((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|(\d))\.((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|(\d))\.((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|(\d))\.((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]\d)|(\d))', s)

if g:
	print('True')
else:
	print('False')                                         
