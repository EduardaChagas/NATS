############################################# Packages ##################################################################
if(!require(gtools)){
  install.packages("gtools")
  require(gtools)
} 

############################################## Axuliar Functions #########################################################

define.symbols <- function(dimension){
  d = c(1:dimension)
  symbol = matrix(unlist(permutations(n=dimension,r=dimension,v=d)),nrow = factorial(dimension),ncol = dimension,byrow = FALSE)
  symbol = symbol - 1
  symbol
}

FP <- function(n, dimension, delay){
  dyn.load("FormationPatterns.so")
  p <- .Call("FormationPatterns", n, dimension, delay)
  p = t(p) + 1
  return(p)
}

formationPattern <- function(serie, dimension, delay, option){
  i = 1
  n = length(serie)
  p_patterns = elements = index2 = matrix(nrow=n,ncol=dimension)
  index = c(0:(dimension-1))
  
  index2 = FP(n, dimension, delay)
  
  while((i + ((dimension-1)*delay)) <= n){ 
      elements[i,] = serie[index2[i,]]
      p_patterns[i,] = index[order(elements[i,])]
      i = i + 1
  }
  
  if(option == 0){
    p_patterns = na.omit(p_patterns)
    return(p_patterns[1:dim(p_patterns)[1],])
  }else if(option == 1){
    elements = na.omit(elements)
    return(elements[1:dim(elements)[1],])    
  }else{
    index2 = na.omit(index2)
    return(index2[1:dim(index2)[1],])    
  }
}

############################################### Bandt-Pompe Weigth ########################################################

weights <- function(series, dimension, delay){
  groups = formationPattern(series,dimension,delay,1)
  weight = w = rep(0, dim(groups)[1])
  for(i in 1:dim(groups)[1]){
    weight[i] = (sum((groups[i,] - mean(groups[i,]))^2))/dimension
  }
  weight
}

WPE <- function(series, dimension, delay){
  series = unlist(series)
  w = weights(series,dimension,delay)
  simbols = formationPattern(series,dimension,delay,0)
  patterns = define.symbols(dimension)
  sw = rep(0,factorial(dimension))
  
  for(i in 1:factorial(dimension)){
    for(j in 1:dim(simbols)[1]){
      if(all(simbols[j,] != patterns[i,]))
        sw[i] = sw[i] + w[j]
    }
  }
  pw = sw/sum(sw)
  pw
}

############################################### Bandt-Pompe function #####################################################

bandt.pompe <- function(series, dimension, delay){
  dyn.load("BandtPompe.so")
  elements = formationPattern(series, dimension, delay, 1)
  element.size = dim(elements)[1]
  probability <- .Call("BandtPompe", elements, dimension, element.size)
  return(probability)
}

############################################### Transition Graphs ########################################################

pattern.wedding <- function(patterns){
  if(max(patterns) == 2)
    patterns = patterns + 1
  m = dim(patterns)[1]
  D = dim(patterns)[2]
  symbols = define.symbols(D)
  wedding = rep(0, m)
  for(i in 1:m){
    e = 0
    j = 1
    stop = F
    while(j <= factorial(D) && stop == F){
      if(sum(symbols[j,] == patterns[i,]) == D){
        wedding[i] = j
        stop = T
      }
      j = j + 1
    }
  }
  return(wedding)
}

transition.graphs <- function(series, dimension, delay){
  patterns = formationPattern(series, dimension, delay, 0)
  wedding = pattern.wedding(patterns)
  size = length(wedding)
  
  dyn.load("TransitionGraph.so")
  probability <- .Call("TransitionGraph", wedding, dimension, size)
  
  return(probability)
}

############################################### Weight Transition Graphs ###################################################

weight.transition.graph <- function(series, dimension, delay){
  
  graph = matrix(0, nrow = factorial(dimension), ncol = factorial(dimension))
  patterns = formationPattern(series, dimension, delay, 0)
  elements = formationPattern(series, dimension, delay, 1)
  wedding = pattern.wedding(patterns)
  m = length(wedding)
  weight.total = 0
  
  for(i in 1:(m-1)){
    weight.i1 = (max(elements[i,]) - min(elements[i,]))
    weight.i2 = (max(elements[i+1,]) - min(elements[i+1,]))
    graph[wedding[i], wedding[i+1]] = graph[wedding[i], wedding[i+1]] + abs(weight.i1 - weight.i2)
    weight.total = weight.total + abs(weight.i1 - weight.i2)
  }
  
  graph = graph/weight.total
  graph = as.vector(graph)
  return(graph)
}

################################################ Get Distribution #########################################################

getDistribution <- function(id, TimeSeries, dimension, delay){
  
  N = length(TimeSeries)
  
  #Bandt-Pompe Weigth
  if(id == 1)
    distribution = sapply(TimeSeries, bandt.pompe, dimension, delay, simplify = F)
  
  #Bandt-Pompe
  else if(id == 2)
    distribution = sapply(TimeSeries, WPE, dimension, delay, simplify = F)
  
  #Ordinal patterns transition graphs
  else if(id == 3)
    distribution = sapply(TimeSeries, transition.graphs, dimension, delay, simplify = F)
  
  #Weighted Ordinal Patterns Transition Graph
  else
    distribution = sapply(TimeSeries, weight.transition.graph, dimension, delay, simplify = F)
  
  return(distribution)
}