#### Eduarda Chagas
#### 04.04.2020
#### This script contains the functions that calculate divergences and distances as a function of the ordinal pattern distribution.


#' Calculates the Jensen Divergence of the given probability distribution and the uniform distribution
#' @export
#' @usage JensenDivergence(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Jensen divergence between the probability distribution of time series and uniform distribution
#' @references Fuglede, Bent, and Flemming Topsoe. "Jensen-Shannon divergence and Hilbert space embedding." International Symposium onInformation Theory, 2004. ISIT 2004. Proceedings.. IEEE, 2004.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' JensenDivergence(prob = p)
JensenDivergence <- function(prob){
  cc = rep(1/length(prob),length(prob))
  s.p = .ShannonEntropy(prob)
  s.q = .ShannonEntropy(cc)
  s.pq = .ShannonEntropy((prob + cc)/2)
  divergence = sum(s.pq - (s.p/2) - (s.q/2))
  return(divergence)
}


#' Calculates the squared distance of the given probability distribution and the uniform distribution
#' @export
#' @usage SquaredDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The squared distance between the probability distribution of time series and uniform distribution
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' SquaredDistance(prob = p)
SquaredDistance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum((prob-cc)^2)
  return(distance)
}


#' Calculates the euclidian distance of the given probability distribution and the uniform distribution
#' @export
#' @usage EuclidianDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The euclidian distance between the probability distribution of time series and uniform distribution
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' EuclidianDistance(prob = p)
EuclidianDistance <- function(prob){
  return(sqrt(SquaredDistance(prob)))
}


#' Calculates the manhattan distance of the given probability distribution and the uniform distribution
#' @export
#' @usage ManhattanDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Manhattan distance between the probability distribution of time series and uniform distribution
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' ManhattanDistance(prob = p)
ManhattanDistance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum(abs(prob-cc))
  return(distance)
}


#' Calculates the chebyshev distance of the given probability distribution and the uniform distribution
#' @export
#' @usage ChebyshevDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Chebyshev distance between the probability distribution of time series and uniform distribution
#' @references Klove, Torleiv, et al. "Permutation arrays under the Chebyshev distance." IEEE Transactions on Information Theory 56.6 (2010): 2611-2617.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' ChebyshevDistance(prob = p)
ChebyshevDistance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = abs(prob - cc)
  return(max(distance))
}


#' Calculates the kullback divergence of the given probability distribution and the uniform distribution
#' @export
#' @usage KullbackDivergence(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Kullback divergence between the probability distribution of time series and uniform distribution
#' @references Van Erven, Tim, and Peter Harremos. "Rényi divergence and Kullback-Leibler divergence." IEEE Transactions on Information Theory 60.7 (2014): 3797-3820.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' KullbackDivergence(prob = p)
KullbackDivergence <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = prob * log(prob/cc)
  distance[is.na(distance)] = 0
  distance[is.infinite(distance)] = 0
  return(sum(distance))
}


#' Calculates the hellinger distance of the given probability distribution and the uniform distribution
#' @export
#' @usage HellingerDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Hellinger distance between the probability distribution of time series and uniform distribution
#' @references Beran, Rudolf. "Minimum Hellinger distance estimates for parametric models." The annals of Statistics 5.3 (1977): 445-463.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' HellingerDistance(prob = p)
HellingerDistance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum((sqrt(prob)-sqrt(cc))^2)*0.5
  return(sqrt(distance))
}


#' Calculates the wootters distance of the given probability distribution and the uniform distribution
#' @export
#' @usage WoottersDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Wootters distance between the probability distribution of time series and uniform distribution
#' @references Majtey, A., et al. "Wootters’ distance revisited: a new distinguishability criterium." The European Physical Journal D-Atomic, Molecular, Optical and Plasma Physics 32.3 (2005): 413-419.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' WoottersDistance(prob = p)
WoottersDistance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum(sqrt(prob*cc))
  distance = acos(distance)
  return(distance)
}


#' Calculates the bhattacharya distance of the given probability distribution and the uniform distribution
#' @export
#' @usage BhattacharyaDistance(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The Bhattacharya distance between the probability distribution of time series and uniform distribution
#' @references Kailath, Thomas. "The divergence and Bhattacharyya distance measures in signal selection." IEEE transactions on communication technology 15.1 (1967): 52-60.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' BhattacharyaDistance(prob = p)
BhattacharyaDistance <- function(prob){
  cc = rep(1/length(prob),length(prob))
  distance = sum(sqrt(prob*cc))
  distance = -log(distance)
  return(distance)
}


#' Calculates the harmonic mean of the given probability distribution and the uniform distribution
#' @export
#' @usage HarmonicMean(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return The harmonic mean between the probability distribution of time series and uniform distribution
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' HarmonicMean(prob = p)
HarmonicMean <- function(prob){
  cc = rep(1/length(prob),length(prob))
  harmonic = sum((prob*cc)/(prob+cc))
  harmonic[is.nan(harmonic)||is.infinite(harmonic)] = 0
  return(2*harmonic)
}

