#### Eduarda Chagas
#### 04.04.2020
#### This script contains the function that calculates statistical complexity as a function of the ordinal pattern distribution.

#' Calculates the constant of statistical complexity of the given probability distribution
#' @keywords internal
.Constant <- function(prob){
  k = (0.5)/length(prob)
  a1 = (0.5 + k) * log(0.5 + k)
  a2 = (length(prob) - 1) * k * log(k)
  a3 = (1 - 0.5) * log(length(prob))
  b = -1/(a1 + a2 + a3)
  return(b)
}


#' Calculates the statistical complexity of the given probability distribution
#' @export
#' @usage StatisticalComplexity(prob)
#' @param prob A numerical vector containing a probability distribution of ordinal patterns
#' @return The statistical complexity
#' @references Martin, M. T., A. Plastino, and O. A. Rosso. "Generalized statistical complexity measures: Geometrical and analytical properties." Physica A: Statistical Mechanics and its Applications 369.2 (2006): 439-462.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- BandtPompe(series = x, dimension = d, delay = del)
#' StatisticalComplexity(prob = p)
StatisticalComplexity <- function(prob){
  cc = JensenDivergence(prob) * .Constant(prob) * ShannonEntropyNormalized(prob)
  return(cc)
}
