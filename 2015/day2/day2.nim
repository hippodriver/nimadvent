import std/strutils
import std/algorithm
import std/sequtils

type
  Box = object
    length: int
    width: int
    height: int

proc parseLine(s: string): Box =
  let parts = s.split('x')
  result = Box(length: parseInt(parts[0]), width: parseInt(parts[1]), height: parseInt(parts[2]))

proc slack(box: Box) : int =
  let sortedLength = sorted([box.length, box.width, box.height])
  result = sortedLength[0] * sortedLength[1]

proc calculatePaperSize(box: Box): int =
  let surface = 2 * (box.length * box.width + box.length * box.height + box.width * box.height)
  result = surface + slack(box)

proc bow(box: Box) : int =
  result = box.length * box.width * box.height

proc calculateRibbon(box: Box): int =
  let sortedLength = sorted([box.length, box.width, box.height])
  let pureRibbon = 2 * (sortedLength[0] + sortedLength[1])
  result = pureRibbon + bow(box)

let data = readFile("input.dat")
let lines = data.splitLines
var boxes: seq[Box] = @[]
for line in lines:
  let box = parseLine(line)
  boxes.add(box)

let paper = boxes.mapIt(calculatePaperSize(it)).foldl(a + b, 0)
let ribbon = boxes.mapIt(calculateRibbon(it)).foldl(a + b, 0)
echo "Overall paper size: ", paper
echo "Overall ribbon size: ", ribbon