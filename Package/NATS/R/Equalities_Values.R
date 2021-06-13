#### Eduarda Chagas
#### 04.04.2020
#### This script contains the function that calculates the percentage of repeated elements of a given sequence

#' Calculates the percentage of repeated elements in a time series
#' @export
#' @usage EqualitiesValues(series)
#' @param series A numeric vector (e.g. a time series)
#' @return Percentage of repeated elements of a time series
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' EqualitiesValues(series = x)
EqualitiesValues <- function(series){
  aux = duplicated(series)
  answer = length(aux[aux==TRUE])
  answer = (answer*100)/length(series)
  answer = format(round(answer, 3), nsmall = 3)
  return(paste(answer,"%"))
}
