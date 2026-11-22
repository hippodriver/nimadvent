import std/strutils
import std/sequtils
import std/sets

proc containsThreeVowels(text: string): bool =
  const Vowels = {'a', 'e', 'i', 'o', 'u'}
  let count = text.countIt(it in Vowels)
  result = count >= 3

proc containsDoubleLetter(text: string): bool =
  var lastChar = text[0]
  for c in text[1 .. ^1]:
    if c == lastChar:
      return true
    else:
      lastChar = c
  return false

proc containsPoisonedPairs(text: string): bool =
  const poisonedPairs = [ "ab", "cd", "pq", "xy" ].toHashSet()
  result = poisonedPairs.anyIt(it in text)

proc numberOfNiceStrings(lines: seq[string]): int =
  let niceLines= 
    lines.filterIt(containsThreeVowels(it) and containsDoubleLetter(it) and not containsPoisonedPairs(it))
  result = niceLines.len

proc containsDoublePair(text: string): bool =
  var pairs: HashSet[string]
  var prevPair = text[0 .. 1]
  pairs.incl(prevPair)
  for c in text[2 .. ^1]:
    let pair = prevPair[1] & c
    if pairs.contains(pair) and prevPair != pair:
      return true
    else:
      prevPair = pair
      pairs.incl(pair)
  return false

proc containsTriple(text: string): bool =
  var charOne = text[0]
  var charTwo = text[1]
  for c in text[2 .. ^1]:
    if c == charOne:
      return true
    else:
      charOne = charTwo
      charTwo = c
  return false

proc numberOfNiceStringNg(lines: seq[string]): int =
  let niceLines= 
    lines.filterIt(containsDoublePair(it) and containsTriple(it))
  result = niceLines.len


let data = readFile("input.dat")
let lines = data.splitLines
let numberNice = numberOfNiceStrings(lines)
let numberNiceNg = numberOfNiceStringNg(lines)
echo "Numnber of nice strings: ", numberNice
echo "Numnber of nice strings ng: ", numberNiceNg