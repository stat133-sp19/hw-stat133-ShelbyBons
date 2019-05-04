context("check summary measures")


test_that("aux_mean works correctly", {


  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(0, 0.5), 0)
  expect_equal(aux_mean(20, 1), 20)
})



test_that("aux_variance works correctly", {


  expect_equal(aux_variance(10,0.3), 2.1)
  expect_equal(aux_variance(0, 0.5), 0)
  expect_equal(aux_variance(20, 1), 0)
})



test_that("aux_mode works correctly", {


  expect_equal(aux_mode(10,0.3), 3)
  expect_equal(aux_mode(0, 0.5), 0)
  expect_equal(aux_mode(20, 1), 21)
})



test_that("aux_skewness works correctly", {


  expect_equal(aux_skewness(10, 0.3), 0.2760262, tolerance = 1e-7)
  expect_equal(aux_skewness(1, 0.5), 0)
  expect_equal(aux_skewness(20, 1), -Inf)
})



test_that("aux_kurtosis works correctly", {


  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tolerance = 1e-7)
  expect_equal(aux_kurtosis(1, 0.5), -2)
  expect_equal(aux_kurtosis(20, 1), Inf)
})

