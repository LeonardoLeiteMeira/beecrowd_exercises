function simpleCircle(matriz){
  let n = matriz.length - 1
  let result = []
  
  for (const line in matriz){
    console.log("line", line)
    if (line == 0){
        result = [...matriz[line]]
        console.log("Line zero, result: ", result)
    }else{
      if(line<n){
        result.push(matriz[line][n])
        console.log("Line menor que n, result: ", result)
      }else{
        console.log("Vai entrar no for para pegar o ultimo", line, n)
        for(var i = n; i>=0; i--){
            console.log("Item dentro do for",matriz[line][i])
          result.push(matriz[line][i])
        } 
      }
    }
  }
  
  for (var i = n-1; i>0; i--){
    result.push(matriz[i][0])
  }
  return result
}


snail = function(array) {
  let result = []
  while(true){
    let partialResult = simpleCircle(array)
    result = [...result, ...partialResult]
    
    array.shift()
    array.pop()
    if(array.length!==0){
      for (const item of array){
        item.shift()
        item.pop()
      }
    }else{
      break
    }
    
    if(array.length === 1){
      result = [...result, array[0][0]]
      break
    }
  }
  return result
}

console.log(snail([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))