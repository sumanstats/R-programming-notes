sumofmutiplesof3or5<-function(x,y){
  total=0
  for (i in x:y-1){
    if (i%%3==0 | i%%5==0){
      total=total + i
    }
  }
  return (total)
}


