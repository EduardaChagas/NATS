#### Eduarda Chagas
#### 04.04.2020
#### This script contains the functions that generate plots for the time series and results of the non-parametric analysis.

#' Plot curves of the time-causal entropy-complexity plane at a given dimension
#' @keywords internal
#' @import ggplot2
.Cotas <- function(dimension){
  c1x = .ReadingMPR(dimension,1)
  c1y = .ReadingMPR(dimension,2)
  c2x = .ReadingMPR(dimension,3)
  c2y = .ReadingMPR(dimension,4)

  p = qplot(xlab=expression(H), ylab=expression(C)) +
    theme(plot.title = element_text(hjust=0.5)) +
    geom_line(aes(x=c2x, y=c2y), size=0.5, color="gray") +
    geom_line(aes(x=c1x, c1y), size=0.5, color="gray")
  return(p)
}

#' Obtain entropy-causal plane curve data over time in a given dimension
#' @keywords internal
#' @import utils
.ReadingMPR <- function(dimension, option=0){
  data(sysdata.rda)
  if(dimension == 3){
    if(option==1) return(curva.1.x6)
    if(option==2) return(curva.1.y6)
    if(option==3) return(curva.2.x6)
    if(option==4) return(curva.2.y6)
  }
  if(dimension == 4){
    if(option==1) return(curva.1.x24)
    if(option==2) return(curva.1.y24)
    if(option==3) return(curva.2.x24)
    if(option==4) return(curva.2.y24)
  }
  if(dimension == 5){
    if(option==1) return(curva.1.x120)
    if(option==2) return(curva.1.y120)
    if(option==3) return(curva.2.x120)
    if(option==4) return(curva.2.y120)
  }
  if(dimension == 6){
    if(option==1) return(curva.1.x720)
    if(option==2) return(curva.1.y720)
    if(option==3) return(curva.2.x720)
    if(option==4) return(curva.2.y720)
  }
  if(dimension == 36){
    if(option==1) return(curva.1.x36)
    if(option==2) return(curva.1.y36)
    if(option==3) return(curva.2.x36)
    if(option==4) return(curva.2.y36)
  }
  if(dimension == 576){
    if(option==1) return(curva.1.x576)
    if(option==2) return(curva.1.y576)
    if(option==3) return(curva.2.x576)
    if(option==4) return(curva.2.y576)
  }
  if(dimension == 14400){
    if(option==1) return(curva.1.x14400)
    if(option==2) return(curva.1.y14400)
    if(option==3) return(curva.2.x14400)
    if(option==4) return(curva.2.y14400)
  }
  if(dimension == 518400){
    if(option==1) return(curva.1.x518400)
    if(option==2) return(curva.1.y518400)
    if(option==3) return(curva.2.x518400)
    if(option==4) return(curva.2.y518400)
  }
}


#' Plots the Fisher-Shannon Plane for a given probability
#' @export
#' @usage FSPlane(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return A Plot with FS Plane
#' @references Rosso, Osvaldo A., Felipe Olivares, and Angelo Plastino. "Noise versus chaos in a causal Fisher-Shannon plane." arXiv preprint arXiv:1510.06950 (2015).
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x1 <- runif(10000)
#' x2 <- runif(10000)
#' x3 <- runif(10000)
#' d <- 3
#' del <- 1
#' probability <- matrix(nrow = 3, ncol = factorial(d))
#' probability[1,] <- BandtPompe(series = x1, dimension = d, delay = del)
#' probability[2,] <- BandtPompe(series = x2, dimension = d, delay = del)
#' probability[3,] <- BandtPompe(series = x3, dimension = d, delay = del)
#' p <- FSPlane(prob = probability)
#' print(p)
#'
#' @import ggplot2
#' @import ggthemes
FSPlane <- function(prob){

  dimension = dim(prob)[2]
  Prob = factor(c(1:dim(prob)[1]))
  fisher = apply(prob, 1, FisherEntropy)
  shannon = apply(prob, 1, ShannonEntropyNormalized)
  metrics = data.frame("F" = fisher, "H" = shannon)

  p = qplot(xlab = "Shannon Entropy", ylab = "Fisher Information measure", main = "Fisher-Shannon Plane") +
      geom_point(data = metrics, aes(x = shannon, y = fisher, group = Prob, color = Prob), size = 3) +
      theme_few(base_size = 14, base_family = "serif")  + theme(plot.title = element_text(hjust=0.5)) +
      scale_colour_few("Dark")

  return(p)
}


#' Plots the Entropy-Complexity Plan for a given probability
#' @export
#' @usage HCPlane(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return A Plot with HC Plane
#' @references Martin, M. T., A. Plastino, and O. A. Rosso. "Generalized statistical complexity measures: Geometrical and analytical properties." Physica A: Statistical Mechanics and its Applications 369.2 (2006): 439-462.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x1 <- runif(10000)
#' x2 <- runif(10000)
#' x3 <- runif(10000)
#' d <- 3
#' del <- 1
#' probability <- matrix(nrow = 3, ncol = factorial(d))
#' probability[1,] <- BandtPompe(series = x1, dimension = d, delay = del)
#' probability[2,] <- BandtPompe(series = x2, dimension = d, delay = del)
#' probability[3,] <- BandtPompe(series = x3, dimension = d, delay = del)
#' p <- HCPlane(prob = probability)
#' print(p)
#'
#' @import ggplot2
#' @import ggthemes
HCPlane <- function(prob){

  dimension = dim(prob)[2]
  Prob = factor(c(1:dim(prob)[1]))
  shannon = apply(prob, 1, ShannonEntropyNormalized)
  complexity = apply(prob, 1, StatisticalComplexity)
  metrics = data.frame("C" = complexity, "H" = shannon)

  p = .Cotas(dimension)
  p = p +
    geom_point(data = metrics, aes(x = shannon, y = complexity, group = Prob, color = Prob), size = 3) +
    labs(title = "HC Plane", x = "Shannon Entropy", y = "Statistical Complexity") +
    theme_few(base_size = 14, base_family = "serif")  + theme(plot.title = element_text(hjust=0.5)) +
    scale_colour_few("Dark")

  return(p)
}


#' Plots the entropy-complexity plane for a given probability, without curves and with zoom on the generated points
#' @export
#' @usage HCPlaneZoom(prob)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return A Plot with HC Plane with zoom on the points
#' @references Martin, M. T., A. Plastino, and O. A. Rosso. "Generalized statistical complexity measures: Geometrical and analytical properties." Physica A: Statistical Mechanics and its Applications 369.2 (2006): 439-462.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x1 <- runif(10000)
#' x2 <- runif(10000)
#' x3 <- runif(10000)
#' d <- 3
#' del <- 1
#' probability <- matrix(nrow = 3, ncol = factorial(d))
#' probability[1,] <- BandtPompe(series = x1, dimension = d, delay = del)
#' probability[2,] <- BandtPompe(series = x2, dimension = d, delay = del)
#' probability[3,] <- BandtPompe(series = x3, dimension = d, delay = del)
#' p <- HCPlaneZoom(prob = probability)
#' print(p)
#'
#' @import ggplot2
#' @import ggthemes
HCPlaneZoom <- function(prob){

  dimension = dim(prob)[2]
  Prob = factor(c(1:dim(prob)[1]))
  shannon = apply(prob, 1, ShannonEntropyNormalized)
  complexity = apply(prob, 1, StatisticalComplexity)
  metrics = data.frame("C" = complexity, "H" = shannon)

  XMIN = min(shannon)
  XMAX = max(shannon)
  YMIN = min(complexity)
  YMAX = max(complexity)

  p = ggplot(data = metrics) +
      geom_point(aes(x = shannon, y = complexity, group = Prob, color = Prob), size = 3) +
      xlim(limits=c(XMIN, XMAX)) + ylim(limits=c(YMIN, YMAX)) +
      labs(title = "HC Plane", x = "Shannon Entropy", y = "Statistical Complexity") +
      theme_few(base_size = 14, base_family = "serif")  + theme(plot.title = element_text(hjust=0.5)) +
      scale_colour_few("Dark")

  return(p)
}

#' Plot time series
#' @export
#' @usage TimeSeriesPlane(series)
#' @param series A numeric vector (e.g. a time series)
#' @return A Time series plot
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' p <- TimeSeriesPlane(series = x)
#' print(p)
#'
#' @import ggplot2
#' @import ggthemes
TimeSeriesPlane <- function(series){

  p = qplot(x = c(1:length(series)), y = series, geom = "line", xlab = "Values", ylab = "Series") +
      theme(plot.title = element_text(hjust=0.5)) +
      theme_few(base_size = 14, base_family = "serif") +
      scale_colour_few("Dark")
  return(p)
}

#' Time-series plot with starting points of the given pattern
#' @export
#' @usage PatternsOnGraph(series, dimension, delay, number.pattern)
#' @param series A numeric vector (e.g. a time series)
#' @param dimension Dimension size of ordinal patterns
#' @param delay Size of the embedding delay of ordinal patterns
#' @param number.pattern Pattern that should have its starting point analyzed on the time-series graph.  The indices of the patterns followed are done by ordering the positions of the groups in chronological order (Permutation of Classification)
#' @return A plot with time-series and starting points of the given pattern
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(10000)
#' d <- 3
#' del <- 1
#' n = 1
#' p <- PatternsOnGraph(series = x, dimension = d, delay = del, number.pattern = n)
#' print(p)
#'
#' @import ggplot2
#' @import ggthemes
PatternsOnGraph <- function(series, dimension, delay, number.pattern){
  p = NULL

  if(as.integer(number.pattern) <= factorial(dimension)){
    lengthW = 0
    symbols = .DefineSymbols(dimension)
    point.time = point.value = c(1:length(series))
    p.patterns = .FormationPattern(series, dimension, delay, 0)
    elements = .FormationPattern(series, dimension, delay, 1)
    index = c(0:(dimension-1))
    n.symbols = dim(p.patterns)[1]

    for(i in 1:n.symbols){
      if(all(p.patterns[i,] == symbols[as.integer(number.pattern),])){
        lengthW = lengthW + 1
        point.value[lengthW] = elements[i,1]
        point.time[lengthW] = i
      }
    }

    if(lengthW >= 1){
      p = qplot(x = c(1:length(series)),y = series, geom="line", xlab="Values", ylab="Series") +
        theme(plot.title = element_text(hjust=0.5)) +
        geom_point(aes(x = point.time[1:lengthW], y = point.value[1:lengthW]), color = "blue") +
        theme_few(base_size = 14, base_family = "serif") +
        scale_colour_few("Dark")
    }
    else{
      p = qplot(x = c(1:length(series)),y = series, geom="line", xlab="Values", ylab="Series") +
        theme(plot.title = element_text(hjust=0.5)) +
        theme_few(base_size = 14, base_family = "serif") +
        scale_colour_few("Dark")
    }

  }
  return(p)
}

#' Plot the histogram of the ordinal patterns of the given time series
#' @export
#' @usage Histogram(series, dimension, delay)
#' @param series A numeric vector (e.g. a time series)
#' @param dimension Dimension size of ordinal patterns
#' @param delay Size of the embedding delay of ordinal patterns
#' @return A plot with histogram of ordinal patterns
#' @references Bandt, Christoph, and Bernd Pompe. "Permutation entropy: a natural complexity measure for time series." Physical review letters 88.17 (2002): 174102.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- Histogram(series = x, dimension = d, delay = del)
#' print(p)
#'
#' @import ggplot2
#' @import ggthemes
Histogram <- function(series, dimension, delay){
  fat = factorial(dimension)
  p.patterns = .FormationPattern(series, dimension, delay,0)
  n.symbols = dim(p.patterns)[1]
  symbol = .DefineSymbols(dimension)
  index.rep = array(0, n.symbols)
  for(i in 1:n.symbols){
    for(j in 1:fat){
      if(all(p.patterns[i,]==symbol[j, ])){
        index.rep[i]=j
        break
      }
    }
  }
  index.rep = index.rep[1:n.symbols]
  index.rep = data.frame("i" = index.rep)
  p = ggplot(index.rep, aes(x = i)) +
      geom_histogram(aes(y = ..density..),
                     binwidth = 1, fill = "grey", color = "black")+
      labs(x="Patterns", y="Probability") +
      theme_few(base_size = 14, base_family = "serif")
  return(p)
}
