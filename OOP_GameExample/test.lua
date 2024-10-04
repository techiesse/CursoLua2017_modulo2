Sword = require 'Sword'
require 'util'



s = Sword(10, 20)
print(s)

print('use:', s:use())
print(s)

print(isInstance(s, Sword))