const GraphemeSplitter = require('grapheme-splitter')
const fs = require('fs')
const splitter = new GraphemeSplitter()

const raw = fs.readFileSync('./02-replaced.txt').toString()

const fiveLetters = raw
  .split('\n')
  .filter((item) => splitter.splitGraphemes(item).length === 5)

console.log(JSON.stringify(fiveLetters))
