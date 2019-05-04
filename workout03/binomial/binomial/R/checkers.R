# private auxiliary function to test if an input prob is a valid probability
check_prob <- function(prob) {
  if (length(prob) != 1) {
    stop("\nargument 'prob' must be of length 1")
  }
  if ((prob < 0 | prob > 1 | !is.numeric(prob))) {
    stop("\nargument 'prob' must be between 0 and 1")
  } else {
    TRUE
  }
}


# private auxiliary function to test if an input trials is a valid value for number of trials
check_trials <- function(trials) {
  if (length(trials) != 1) {
    stop("\nargument 'prob' must be of length 1")
  }
  if ((trials < 0 | (trials%%1 != 0))) {
    stop("\nargument 'trials' must be a non-negative integer")
  } else {
    TRUE
  }
}

# private auxiliary function to test if an input success is a valid value for number of successes
check_success <- function(success, trials) {
  if (any(success < 0 | (success%%1 != 0))) {
    stop("\nargument 'success' must be a vector of non-negative integer")
  }
  if (any(success>trials)) {
    stop("\nargument 'success' cannot be greater than trials")

  }else {
    TRUE
  }
}
