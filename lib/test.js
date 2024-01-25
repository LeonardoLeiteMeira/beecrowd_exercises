/// Link of Exercise https://www.codewars.com/kata/546f922b54af40e1e90001da/train/javascript
function alphabetPosition(text) {
  let stringResult = ""
  let newText = text.toLowerCase();
  for (const char of newText){
    if (/^[a-zA-Z]$/.test(char)){
        if(stringResult!=""){
            stringResult += " "
        }
        stringResult += char.charCodeAt(0).toString() - "a".charCodeAt(0)+1
    }
  }
  return stringResult;
}

let text = "The sunset sets at twelve o' clock."

console.log(alphabetPosition(text))
