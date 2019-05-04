context("test binomial functions")


test_that("bin_choose works correctly", {


  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 1:3), c(5,10,10))
  expect_error(bin_choose(n = 2, k = 5))
})



test_that("bin_probability works correctly", {


  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(succes = 55, trials = 100, prob = 0.45), c(0.01075277))
  expect_error(bin_probability(success = 2, trials = 5, prob = -1))
})

test_that("bin_distribution works correctly", {


  expect_equal(class(bin_distribution(trials = 5, prob = 0.5)), c("bindis", "data.frame"))
  expect_equal(dim(bin_distribution(trials = 5, prob = 0.5)), c(6,2))
  expect_equal(colnames(bin_distribution(trials = 5, prob = 0.5)), c("success", "probability"))
  expect_error(bin_distribution(trials = 1.5, prob = 0.5))
})

test_that("bin_cumulative works correctly", {


  expect_equal(class(bin_cumulative(trials = 5, prob = 0.5)), c("bincum", "data.frame"))
  expect_equal(dim(bin_cumulative(trials = 5, prob = 0.5)), c(6,3))
  expect_equal(colnames(bin_cumulative(trials = 5, prob = 0.5)), c("success", "probability", "cumulative"))
  expect_error(bin_cumulative(trials = 1.5, prob = 0.5))
})
