pkgname <- "NATS"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "NATS-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('NATS')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("BandtPompe")
### * BandtPompe

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: BandtPompe
### Title: Calculates the Bandt-Pompe distribution of the given time series
### Aliases: BandtPompe

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
BandtPompe(series = x, dimension = d, delay = del)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("BandtPompe", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("BhattacharyaDistance")
### * BhattacharyaDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: BhattacharyaDistance
### Title: Calculates the bhattacharya distance of the given probability
###   distribution and the uniform distribution
### Aliases: BhattacharyaDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
BhattacharyaDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("BhattacharyaDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ChebyshevDistance")
### * ChebyshevDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ChebyshevDistance
### Title: Calculates the chebyshev distance of the given probability
###   distribution and the uniform distribution
### Aliases: ChebyshevDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
ChebyshevDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ChebyshevDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("EqualitiesValues")
### * EqualitiesValues

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: EqualitiesValues
### Title: Calculates the percentage of repeated elements in a time series
### Aliases: EqualitiesValues

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
EqualitiesValues(series = x)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("EqualitiesValues", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("EuclidianDistance")
### * EuclidianDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: EuclidianDistance
### Title: Calculates the euclidian distance of the given probability
###   distribution and the uniform distribution
### Aliases: EuclidianDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
EuclidianDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("EuclidianDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("FSPlane")
### * FSPlane

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: FSPlane
### Title: Plots the Fisher-Shannon Plane for a given probability
### Aliases: FSPlane

### ** Examples

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
p <- FSPlane(prob = probability)
print(p)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("FSPlane", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("FisherEntropy")
### * FisherEntropy

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: FisherEntropy
### Title: Calculates the Fisher entropy of a probability distribution
### Aliases: FisherEntropy

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
FisherEntropy(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("FisherEntropy", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("HCPlane")
### * HCPlane

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: HCPlane
### Title: Plots the Entropy-Complexity Plan for a given probability
### Aliases: HCPlane

### ** Examples

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
p <- HCPlane(prob = probability)
print(p)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("HCPlane", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("HCPlaneZoom")
### * HCPlaneZoom

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: HCPlaneZoom
### Title: Plots the entropy-complexity plane for a given probability,
###   without curves and with zoom on the generated points
### Aliases: HCPlaneZoom

### ** Examples

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




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("HCPlaneZoom", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("HarmonicMean")
### * HarmonicMean

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: HarmonicMean
### Title: Calculates the harmonic mean of the given probability
###   distribution and the uniform distribution
### Aliases: HarmonicMean

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
HarmonicMean(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("HarmonicMean", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("HellingerDistance")
### * HellingerDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: HellingerDistance
### Title: Calculates the hellinger distance of the given probability
###   distribution and the uniform distribution
### Aliases: HellingerDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
HellingerDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("HellingerDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("Histogram")
### * Histogram

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Histogram
### Title: Plot the histogram of the ordinal patterns of the given time
###   series
### Aliases: Histogram

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- Histogram(series = x, dimension = d, delay = del)
print(p)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Histogram", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("JensenDivergence")
### * JensenDivergence

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: JensenDivergence
### Title: Calculates the Jensen Divergence of the given probability
###   distribution and the uniform distribution
### Aliases: JensenDivergence

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
JensenDivergence(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("JensenDivergence", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("KullbackDivergence")
### * KullbackDivergence

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: KullbackDivergence
### Title: Calculates the kullback divergence of the given probability
###   distribution and the uniform distribution
### Aliases: KullbackDivergence

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
KullbackDivergence(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("KullbackDivergence", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ManhattanDistance")
### * ManhattanDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ManhattanDistance
### Title: Calculates the manhattan distance of the given probability
###   distribution and the uniform distribution
### Aliases: ManhattanDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
ManhattanDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ManhattanDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MinEntropy")
### * MinEntropy

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MinEntropy
### Title: Calculates the Min Entropy of a probability distribution
### Aliases: MinEntropy

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
MinEntropy(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MinEntropy", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("NumberEdges")
### * NumberEdges

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: NumberEdges
### Title: Calculates the number of edges of a transition graph
### Aliases: NumberEdges

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- TransitionGraphs(series = x, dimension = d, delay = del)
NumberEdges(probs_graph = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("NumberEdges", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("PatternsOnGraph")
### * PatternsOnGraph

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: PatternsOnGraph
### Title: Time-series plot with starting points of the given pattern
### Aliases: PatternsOnGraph

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(10000)
d <- 3
del <- 1
n = 1
p <- PatternsOnGraph(series = x, dimension = d, delay = del, number.pattern = n)
print(p)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("PatternsOnGraph", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("RenyiEntropy")
### * RenyiEntropy

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: RenyiEntropy
### Title: Calculates the Renyi entropy of a probability distribution
### Aliases: RenyiEntropy

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
RenyiEntropy(prob = p, q = 0.01)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("RenyiEntropy", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("SelfTransitionProb")
### * SelfTransitionProb

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: SelfTransitionProb
### Title: Calculates the self transition probability of a transition graph
### Aliases: SelfTransitionProb

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- TransitionGraphs(series = x, dimension = d, delay = del)
SelfTransitionProb(probs_graph = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("SelfTransitionProb", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ShannonEntropyNormalized")
### * ShannonEntropyNormalized

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ShannonEntropyNormalized
### Title: Calculates the normalized Shannon entropy of a probability
###   distribution
### Aliases: ShannonEntropyNormalized

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
ShannonEntropyNormalized(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ShannonEntropyNormalized", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("SquaredDistance")
### * SquaredDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: SquaredDistance
### Title: Calculates the squared distance of the given probability
###   distribution and the uniform distribution
### Aliases: SquaredDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
SquaredDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("SquaredDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("StatisticalComplexity")
### * StatisticalComplexity

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: StatisticalComplexity
### Title: Calculates the statistical complexity of the given probability
###   distribution
### Aliases: StatisticalComplexity

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
StatisticalComplexity(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("StatisticalComplexity", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("TimeSeriesPlane")
### * TimeSeriesPlane

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: TimeSeriesPlane
### Title: Plot time series
### Aliases: TimeSeriesPlane

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
p <- TimeSeriesPlane(series = x)
print(p)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("TimeSeriesPlane", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("TransitionGraphs")
### * TransitionGraphs

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: TransitionGraphs
### Title: Calculates the transition graph of ordinal pattern for the given
###   time series
### Aliases: TransitionGraphs

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
TransitionGraphs(series = x, dimension = d, delay = del)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("TransitionGraphs", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("TsallisEntropy")
### * TsallisEntropy

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: TsallisEntropy
### Title: Calculates the Tsallis entropy of a probability distribution
### Aliases: TsallisEntropy

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
TsallisEntropy(prob = p, q = 0.01)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("TsallisEntropy", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("WPE")
### * WPE

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: WPE
### Title: Calculates the Weighted Bandt-Pompe distribution of the given
###   time series
### Aliases: WPE

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
WPE(series = x, dimension = d, delay = del)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("WPE", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("WeightTransitionGraph")
### * WeightTransitionGraph

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: WeightTransitionGraph
### Title: Calculates the weighted transition graph of ordinal pattern for
###   the given time series
### Aliases: WeightTransitionGraph

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
WeightTransitionGraph(series = x, dimension = d, delay = del)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("WeightTransitionGraph", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("WoottersDistance")
### * WoottersDistance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: WoottersDistance
### Title: Calculates the wootters distance of the given probability
###   distribution and the uniform distribution
### Aliases: WoottersDistance

### ** Examples

set.seed(123, kind = "Mersenne-Twister")
x <- runif(110000)
d <- 3
del <- 1
p <- BandtPompe(series = x, dimension = d, delay = del)
WoottersDistance(prob = p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("WoottersDistance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
