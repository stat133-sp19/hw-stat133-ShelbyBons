context("Check checker functions")


test_that("check_prob works correctly", {
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_true(check_prob(0.3))
  expect_error(check_prob(2))
  expect_error(check_prob(c(1,2)))
  expect_error(check_prob("hi"))
})

test_that("check_trials works correctly", {

  expect_true(check_trials(6))
  expect_error(check_trials(2.5))
  expect_error(check_trials(-3))
  expect_error(check_trials(c(1,2)))
})

test_that("check_success works correctly", {

  expect_true(check_success(3, 6))
  expect_true(check_success(c(2,4,1), 6))
  expect_error(check_success(c(3, 8,1), 6))
  expect_error(check_success(-1, 5))
})
