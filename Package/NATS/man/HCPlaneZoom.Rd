% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Planes.R
\name{HCPlaneZoom}
\alias{HCPlaneZoom}
\title{Plots the entropy-complexity plane for a given probability, without curves and with zoom on the generated points}
\usage{
HCPlaneZoom(prob)
}
\arguments{
\item{prob}{A numeric vector containing a probability distribution of ordinal patterns}
}
\value{
A Plot with HC Plane with zoom on the points
}
\description{
Plots the entropy-complexity plane for a given probability, without curves and with zoom on the generated points
}
\examples{
set.seed(123, kind = "Mersenne-Twister")
x1 <- runif(10000)
x2 <- runif(10000)
x3 <- runif(10000)
d <- 3
del <- 1
probability <- matrix(nrow = 3, ncol = factorial(d))
probability[1,] <- BandtPompe(series = x1, dimension = d, delay = del)
probability[2,] <- BandtPompe(series = x2, dimension = d, delay = del)
probability[3,] <- BandtPompe(series = x3, dimension = d, delay = del)
p <- HCPlaneZoom(prob = probability)
print(p)

}
\references{
Martin, M. T., A. Plastino, and O. A. Rosso. "Generalized statistical complexity measures: Geometrical and analytical properties." Physica A: Statistical Mechanics and its Applications 369.2 (2006): 439-462.
}
\author{
Eduarda Chagas
}
