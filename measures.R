###################################################################################
# measures.R 
#
# Implementation of theory information descriptors 
#
# Author: Eduarda Chagas
# Date : Feb 2020
# Contact: eduarda.chagas@dcc.ufmg.br
####################################################################################

equalities.values <- function(series){
aux = duplicated(series)
answer = length(aux[aux==TRUE])
answer = (answer*100)/length(series)
answer = format(round(answer, 3), nsmall = 3)
return(paste(answer,"%"))
} 

################################## Entropy  ########################################

min.entropy <- function(prob){
  pme = (-1)*log(max(prob))
  return(pme)
}

tsallis.entropy <- function(prob,q){  
  entropy = sum(prob^q)
  entropy = (1 - entropy)/(q - 1)
  return(entropy)
}

tsallis.normalized <- function(prob,q){  
  ent.max = (1 - (length(prob)^(1 - q)))/(q - 1)
  return(tsallis.entropy(prob,q)/ent.max)
}

renyi.entropy <- function(prob,q){
  entropy = sum(prob^q)
  entropy = log(entropy)
  entropy = entropy/(1 - q)
  return(entropy)
}

renyi.normalized <- function(prob,q){ 
  return(renyi.entropy(prob,q)/log(length(prob)))
}

shannon.entropy <- function(prob){
  entropy = prob * log(prob)
  entropy[is.nan(entropy)] = 0
  return(-sum(entropy))
}

shannon.entropy.normalized <- function(prob){
  entropy = (shannon.entropy(prob)/log(length(prob)))
  entropy[is.nan(entropy)] = 0
  return(entropy)
}

fisher.entropy <- function(prob){
  n = length(prob)
  entropy = 0
  F0 = 1/2
  
  for(i in 1:(n-1)){
    entropy = entropy + (sqrt(prob[i]) - sqrt(prob[i+1]))^2
  }
  
  entropy = F0 * entropy
  return(entropy)
}

################################## Distances  ########################################

jensen.divergence <- function(prob){
  cc = rep(1/length(prob),length(prob))
  s_p = shannon.entropy(prob)
  s_q = shannon.entropy(cc)
  s_pq = shannon.entropy((prob + cc)/2)
  divergence = sum(s_pq - (s_p/2) - (s_q/2))
  return(divergence)
}

squared.distance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum((prob-cc)^2)
  return(distance)
}

euclidian.distance <- function(prob){
  return(sqrt(squared.distance(prob)))
}

manhattan.distance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum(abs(prob-cc))
  return(distance)
}

chebyshev.distance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = abs(prob - cc)
  return(max(distance))
}

kullback.divergence <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = prob * log(prob/cc)
  distance[is.na(distance)] = 0
  distance[is.infinite(distance)] = 0
  return(sum(distance))
}

hellinger.distance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum((sqrt(prob)-sqrt(cc))^2)*0.5
  return(sqrt(distance))
}

wootters.distance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum(sqrt(prob*cc))
  distance = acos(distance)
  return(distance)
}

bhattacharya.distance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum(sqrt(prob*cc))
  distance = -log(distance)
  return(distance)
}

harmonic.mean <- function(prob){
  cc = rep(1/length(prob),length(prob))
  harmonic = sum((prob*cc)/(prob+cc))
  harmonic[is.nan(harmonic)||is.infinite(harmonic)] = 0
  return(2*harmonic)
}

################################## Complexity  ########################################

constant <- function(prob){
  k = (0.5)/length(prob)
  a1 = (0.5 + k) * log(0.5 + k)
  a2 = (length(prob) - 1) * k * log(k)
  a3 = (1 - 0.5) * log(length(prob))
  b = -1/(a1 + a2 + a3)
  return(b)
}

Ccomplexity<-function(prob){
  cc = jensen.divergence(prob) * constant(prob) * shannon.entropy.normalized(prob)
  return(cc)
}

################################## Cotas e trozos #######################################

cotas <- function(dimension){
  c1x = readingMPR(dimension,1)
  c1y = readingMPR(dimension,2)
  c2x = readingMPR(dimension,3)
  c2y = readingMPR(dimension,4)
  
  p = qplot(xlab=expression(H), ylab=expression(C)) +
    theme(plot.title = element_text(hjust=0.5)) +
    geom_line(aes(x=c2x, y=c2y), size=0.5, color="gray") +
    geom_line(aes(x=c1x, c1y), size=0.5, color="gray")
  return(p)
}

readingMPR<-function(dimension, option=0){
  if(dimension == 6){ 
    continua = "Data/trozos/continuaN6.txt"
    trozo = "Data/trozos/trozosN6.txt"
  }
  if(dimension == 24){ 
    continua = "Data/trozos/continuaN24.txt"
    trozo = "Data/trozos/trozosN24.txt"
  }
  if(dimension == 120){ 
    continua = "Data/trozos/continuaN120.txt"
    trozo = "Data/trozos/trozosN120.txt"
  }
  if(dimension == 720){ 
    continua = "Data/trozos/continuaN720.txt"
    trozo = "Data/trozos/trozosN720.txt"
  }
  if(dimension == 36){ 
    continua = "Data/trozos/continuaN36.txt"
    trozo = "Data/trozos/trozosN36.txt"
  }
  if(dimension == 576){ 
    continua = "Data/trozos/continuaN576.txt"
    trozo = "Data/trozos/trozosN576.txt"
  }
  if(dimension == 14400){ 
    continua = "Data/trozos/continuaN14400.txt"
    trozo = "Data/trozos/trozosN14400.txt"
  }
  if(dimension == 518400){ 
    continua = "Data/trozos/continuaN518400.txt"
    trozo = "Data/trozos/trozosN518400.txt"
  }
  curva1x = read.table(continua, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
  if(option==1) return(curva1x)
  curva1y = read.table(continua, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
  if(option==2) return(curva1y)
  curva2x = read.table(trozo, stringsAsFactors=FALSE, fileEncoding="latin1")[,1]
  if(option==3) return(curva2x)
  curva2y = read.table(trozo, stringsAsFactors=FALSE, fileEncoding="latin1")[,2]
  if(option==4) return(curva2y)
}