if(!require(fftw)){
  install.packages("fftw")
  require(fftw)
} 
source("measures.R")
source("distributions.R")

######################################### Funções geradoras ##################################################
set.seed(seed = 1234567890, kind = "Mersenne-Twister")

series_generator <- function(size, n, k = 0){
  series = matrix(nrow = n, ncol = size)
  for(i in 1:n){
    x = rnorm(size)
    x = x - mean(x)
    pp = planFFT(size)
    y = FFT(x, plan=pp)
    filtro = (1:size)^-(k/2)
    filtro = filtro / sum(filtro)
    y1 = y * filtro    
    x1 = IFFT(y1, plan = pp)  
    series[i,] = c(Re(x1)) 
  }
  return(series)
}

HC_function <- function(series, dimension, delay){
  n = dim(series)[2]
  hc = matrix(nrow = n, ncol = 2)
  for(i in 1:n){
    bp = bandt.pompe(series[i,], dimension, delay)
    hc[i, 1] = shannon.entropy.normalized(bp)
    hc[i, 2] = Ccomplexity(bp)
  }
  hc
}


################################### Gerando os ruídos ###########################################

b = 1
number.size = c(400, rep(100, 9))
dimension = c(3, 4, 5, 6)
delay = c(1,2,3,4)
size = seq(from = 10000, to = 100000, by = 10000)
size = rep(50000, 1)
HC.features = matrix(ncol = 3, nrow = 1300*length(dimension)*length(delay))

for(j in dimension){
  cat("\n Dimension: ", j, "\n")
  for(w in delay){
    cat("\n Delay: ", w, "\n")
    HC = matrix(ncol = 2, nrow = 1300)
    a = 1
    
    for(i in 1:length(size)){
      cat("size: ", i, "\n")
      noise = series_generator(number.size[i], size[i])
      HC[a:(a + number.size[i] - 1), ] = HC_function(noise, dimension, delay)
      a = a + number.size[i]
    }
    
    HC.features[b:(b + 1300 - 1), 1:2] = HC
    HC.features[b:(b + 1300 - 1), 3] = rep(j, 1300)
    b = b + 1300
  }
}

  
write.csv(HC.features, paste("Data/", "HC_series_fk0.csv", sep = ""), row.names = FALSE)