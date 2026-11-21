let data = readFile("input.dat")
var floor = 0
var base_step = 0

for i, c in data:
  case c
  of '(':
    floor += 1
  of ')':
    floor -= 1
  else:
    discard
  if base_step == 0 and floor == -1:
    base_step = i + 1

echo "Floor reached: ", floor
echo "First step to basement: ", base_step
