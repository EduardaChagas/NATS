#' Calculates the number of edges of a transition graph
#' @export
#' @usage NumberEdges(probs_graph)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return Number of edges
#' @references BORGES, João B. et al. Learning and distinguishing time series dynamics via ordinal patterns transition graphs. Applied Mathematics and Computation, v. 362, p. 124554, 2019.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- TransitionGraphs(series = x, dimension = d, delay = del)
#' NumberEdges(probs_graph = p)
NumberEdges <- function(probs_graph){
  return(sum(probs_graph == 0))
}

#' Calculates the self transition probability of a transition graph
#' @export
#' @usage SelfTransitionProb(probs_graph)
#' @param prob A numeric vector containing a probability distribution of ordinal patterns
#' @return Self transition probability
#' @references BORGES, João B. et al. Learning and distinguishing time series dynamics via ordinal patterns transition graphs. Applied Mathematics and Computation, v. 362, p. 124554, 2019.
#' @author Eduarda Chagas
#' @examples
#' set.seed(123, kind = "Mersenne-Twister")
#' x <- runif(110000)
#' d <- 3
#' del <- 1
#' p <- TransitionGraphs(series = x, dimension = d, delay = del)
#' SelfTransitionProb(probs_graph = p)
SelfTransitionProb <- function(probs_graph){
  return(sum(diag(probs_graph)))
}
