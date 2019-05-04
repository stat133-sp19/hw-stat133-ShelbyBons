# private auxiliary function to calculate the mean of the distribution
aux_mean <- function(trials, prob) {
  return (trials*prob)
}

# private auxiliary function to calculate the variance of the distribution
aux_variance <- function(trials, prob) {
  return(trials * prob * (1-prob))
}

# private auxiliary function to calculate the mode of the distribution
aux_mode <- function(trials, prob) {
  return (floor(trials*prob + prob))
}

# private auxiliary function to calculate the skewness of the distribution
aux_skewness <- function(trials, prob) {
  return ( (1 - 2*prob) / sqrt(trials*prob*(1-prob)))
}

# private auxiliary function to calculate the kurtosis of the distribution
aux_kurtosis <- function(trials, prob) {
  return ( (1-6*prob*(1-prob)) / (trials*prob*(1-prob)))
}
