#### Eduarda Chagas
#### 04.04.2020
#### This script contains the functions that calculate entropy as a function of the ordinal pattern distribution.


#' Calculates the Min Entropy of a probability distribution
#' @export
#' @usage MinEntropy(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The min entropy
#' @references Zunino, Luciano, Felipe Olivares, and Osvaldo A. Rosso. "Permutation min-entropy: An improved quantifier for unveiling subtle temporal correlations." EPL (Europhysics Letters) 109.1 (2015): 10005.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' MinEntropy(prob = p)
MinEntropy <- function(prob){
  pme = (-1)*log(max(prob))
  return(pme)
}


#' Calculates the Tsallis entropy of a probability distribution
#' @export
#' @usage TsallisEntropy(prob, q)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @param q The entropy order. It allows only positive numbers.
#' @return The entropy of Tsallis
#' @references De Albuquerque, M. Portes, Israel A. Esquef, and AR Gesualdi Mello. "Image thresholding using Tsallis entropy." Pattern Recognition Letters 25.9 (2004): 1059-1065.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' TsallisEntropy(prob = p, q = 0.01)
TsallisEntropy <- function(prob, q){
  entropy = sum(prob^q)
  entropy = (1 - entropy)/(q - 1)
  ent.max = (1 - (length(prob)^(1 - q)))/(q - 1)
  return(entropy/ent.max)
}


#' Calculates the Renyi entropy of a probability distribution
#' @export
#' @usage RenyiEntropy(prob, q)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @param q The entropy order. It allows only positive numbers.
#' @return The entropy of Renyi
#' @references Lenzi, E. K., R. S. Mendes, and L. R. Da Silva. "Statistical mechanics based on Renyi entropy." Physica A: Statistical Mechanics and its Applications 280.3-4 (2000): 337-345.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' RenyiEntropy(prob = p, q = 0.01)
RenyiEntropy <- function(prob, q){
  entropy = sum(prob^q)
  entropy = log(entropy)
  entropy = entropy/(1 - q)
  return(entropy/log(length(prob)))
}


#' Calculates the Shannon entropy of a probability distribution
#' @keywords internal
.ShannonEntropy <- function(prob){
  entropy = prob * log(prob)
  entropy[is.nan(entropy)] = 0
  return(-sum(entropy))
}


#' Calculates the normalized Shannon entropy of a probability distribution
#' @export
#' @usage ShannonEntropyNormalized(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The entropy of Shannon Normalized
#' @references Bandt, Christoph, and Bernd Pompe. "Permutation entropy: a natural complexity measure for time series." Physical review letters 88.17 (2002): 174102.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' ShannonEntropyNormalized(prob = p)
ShannonEntropyNormalized <- function(prob){
  entropy = (.ShannonEntropy(prob)/log(length(prob)))
  entropy[is.nan(entropy)] = 0
  return(entropy)
}


#' Calculates the Fisher entropy of a probability distribution
#' @export
#' @usage FisherEntropy(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The entropy of Fisher
#' @references Olivares, Felipe, Angelo Plastino, and Osvaldo A. Rosso. "Contrasting chaos with noise via local versus global information quantifiers." Physics Letters A 376.19 (2012): 1577-1583.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' FisherEntropy(prob = p)
FisherEntropy <- function(prob){
  n = length(prob)
  entropy = 0
  F0 = 1/2

  for(i in 1:(n-1)){
    entropy = entropy + (sqrt(prob[i]) - sqrt(prob[i+1]))^2
  }

  entropy = F0 * entropy
  return(entropy)
}
