function getTotalOfChars(words){
  return words.reduce((acc, current)=>acc+=current.length,0)
}

function isNewLine(words, width){
  let numberOfWords = words.length
  let minimumSpaceCount = numberOfWords - 1
  let totalWordsChars = getTotalOfChars(words)
  if(totalWordsChars + minimumSpaceCount > width){
    return false
  }
  return true
}


function justify(text, width) {
  let allWords = text.split(" ")
  
  let lineCount = 0
  let result = [[]]
  
  for (const word of allWords){
    let possibleNewLine = [...result[lineCount], word]
    
    if(isNewLine(possibleNewLine,width)){
      result[lineCount].push(word)
    }else{
      let numberOfSpace = width - getTotalOfChars(result[lineCount])
      let wordPosition = 0
      let sizeOfLine = result[lineCount].length - 1
      for (var i = 0; i<numberOfSpace; i++){
        result[lineCount][wordPosition]+=" "
        wordPosition = (wordPosition+1)%sizeOfLine
      }
      result[lineCount] = result[lineCount].join("")
      console.log("New Line",result[lineCount])
      lineCount++
      result.push([word])
    }
  }
  result[lineCount] = result[lineCount].join("")
  return result.join("\n")
}

console.log(justify('12 45 1234 12', 6))