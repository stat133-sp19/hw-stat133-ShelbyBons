
#' @title bin_choose()
#' @description calculates the number of combinations in which k successes can occur in n trials.
#' @param n number of trials
#' @param k number of successes
#' @return n choose k
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
bin_choose <- function(n, k) {
  if (any(k > n)) {
    stop("\nargument 'k' cannot be greater than 'n'")

  }else {
    return (factorial(n)/(factorial(k)*factorial(n-k)))
  }
}

#' @title bin_probability()
#' @description calculates the binomial probability
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability of success
#' @return n choose k
#' @export
#' @examples
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return (bin_choose(trials, success)* prob^success * (1-prob)^(trials - success))
}

#' @title bin_distribution()
#' @description calculate the binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return a dataframe with the probability distribution
#' @export
#' @examples
bin_distribution <- function(trials, prob) {
  successes <- 0:trials
  probabilities <- bin_probability(successes, trials, prob)
  distrib <- data.frame(success=successes, probability = probabilities)
  class(distrib) <- c("bindis", "data.frame")
  return (distrib)
}

#' @export
plot.bindis <- function(x) {
  return (barplot(x$probability, xlab = "successes", ylab = "probability", names.arg = x$success))
}

#' @title bin_cumulative()
#' @description calculate the binomial cumulative distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return a dataframe with the cumulative probability distribution
#' @export
#' @examples
bin_cumulative <- function(trials, prob) {
  distrib <- bin_distribution(trials, prob)
  distrib[,"cumulative"] <- cumsum(distrib$probability)
  class(distrib) <- c("bincum", "data.frame")
  return (distrib)
}

#' @export
plot.bincum <- function(x) {
  return (plot(x = x$success, y = x$cumulative, type = "o", xlab = "successes", ylab = "probability"))
}

#' @title bin_variable()
#' @description reutrns an object of class "binvar"
#' @param trials number of trials
#' @param prob probability of success
#' @return a list of the following named elements: trials and prob.
#' @export
#' @examples
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  variable <- list(trials = trials, prob = prob)
  class(variable) <- "binvar"
  return (variable)
}

#' @export
print.binvar <- function(x) {
  cat('"Binomial variable"\n\nParameters\n- number of trials:',x$trials, '\n- prob of success :', x$prob)
}

#' @export
summary.binvar <- function(x) {
  trials = x$trials
  prob = x$prob
  summ <- list(trials = trials, prob = prob, mean = aux_mean(trials, prob), variance = aux_variance(trials, prob), mode = aux_mode(trials, prob), skewness = aux_skewness(trials, prob), kurtosis = aux_kurtosis(trials, prob))
  class(summ) <- "summary.binvar"
  return (summ)
}

#' @export
print.summary.binvar <- function(x) {
  cat('"Binomial variable"\n\nParameters\n- number of trials:',x$trials, '\n- prob of success :', x$prob,'\n\nMeasures:\n- mean   :',x$mean, '\n- variance:', x$variance, '\n- mode:', x$mode,'\n- skewness:', x$skewness, '\n- kurtosis:', x$kurtosis)
}


#' @title bin_mean()
#' @description calculates the mean of a binomial distribution.
#' @param trials number of trials
#' @param prob probability of success
#' @return the mean of the binomial distribution
#' @export
#' @examples
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_mean(trials, prob))
}

#' @title bin_variance()
#' @description calculates the variance of a binomial distribution.
#' @param trials number of trials
#' @param prob probability of success
#' @return the variance of the binomial distribution
#' @export
#' @examples
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_variance(trials, prob))
}

#' @title bin_mode()
#' @description calculates the mode of a binomial distribution.
#' @param trials number of trials
#' @param prob probability of success
#' @return the mode of the binomial distribution
#' @export
#' @examples
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_mode(trials, prob))
}

#' @title bin_skewness()
#' @description calculates the skewness of a binomial distribution.
#' @param trials number of trials
#' @param prob probability of success
#' @return the skewness of the binomial distribution
#' @export
#' @examples
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_skewness(trials, prob))
}


#' @title bin_kurtosis()
#' @description calculates the kurtosis of a binomial distribution.
#' @param trials number of trials
#' @param prob probability of success
#' @return the kurtosis of the binomial distribution
#' @export
#' @examples
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_kurtosis(trials, prob))
}

