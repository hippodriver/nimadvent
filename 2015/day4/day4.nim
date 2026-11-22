import std/md5

let secret = "bgvyzdsv"

proc hasLeadingZeroes(s: string, prefix: string): bool =
  s[0 ..< prefix.len] == prefix

proc calcSuffixWithZeroes(prefix: string): int =
  var counter = 1
  var candidate = getMD5(secret & $counter)
  while(not hasLeadingZeroes(candidate, prefix)):
    counter += 1
    candidate = getMD5(secret &  $counter)
  result = counter

let firstWithFive = calcSuffixWithZeroes("00000")
let firstWithSix = calcSuffixWithZeroes("000000")
echo "Smallest number with 5 leading zeros: ", firstWithFive
echo "Smallest number with 6 leading zeros: ", firstWithSix