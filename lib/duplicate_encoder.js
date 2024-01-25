///Link of exercise https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/solutions/javascript

function moreThanOne(str, char){
  let strAsList = str.split("")
  let count = 0
  let result = false
  
  for (const mychar of strAsList){
    console.log(mychar, char)
    if(mychar === char){
      count++
    }
    if(count>1){
      return true
    }
  }
  
  return result
}

console.log(moreThanOne("Maria", "a"))