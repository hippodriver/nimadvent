import std/sets

type
  Pos = object
    x: int
    y: int
  PosRef = ref Pos

let data = readFile("input.dat")

proc santaWalk(): int =
  var visits = initHashSet[Pos]()
  var currentPos: Pos = Pos(x: 0, y: 0)
  visits.incl(currentPos)

  for c in data:
    case c 
    of '^':
      currentPos.y = currentPos.y + 1
    of 'v':
      currentPos.y = currentPos.y - 1
    of '>':
      currentPos.x = currentPos.x + 1
    of '<':
      currentPos.x = currentPos.x - 1
    else:
      discard
    visits.incl(currentPos)

  result = visits.len

proc santaAndRoboWalk(): int =
  var visits = initHashSet[Pos]()
  var currentPosSanta: PosRef = PosRef(x: 0, y: 0)
  var currentPosRobo: PosRef = PosRef(x: 0, y: 0)
  var currentPos: PosRef

  for index, c in data:
    if index mod 2 == 0:
      currentPos = currentPosSanta
    else:
      currentPos = currentPosRobo
    case c 
    of '^':
      currentPos.y = currentPos.y + 1
    of 'v':
      currentPos.y = currentPos.y - 1
    of '>':
      currentPos.x = currentPos.x + 1
    of '<':
      currentPos.x = currentPos.x - 1
    else:
      discard
    visits.incl(currentPos[])

  result = visits.len

let santaVisits: int = santaWalk()
let santaAndRopoVisits: int = santaAndRoboWalk()
echo "Santa alone visited this number of houses: ", santaVisits
echo "Santa and Robo visited this number of houses: ", santaAndRopoVisits
