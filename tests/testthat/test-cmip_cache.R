context("cmip_cache")

key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"

test_that("cmip_cache works", {
  skip_on_cran()

  expect_is(cmip_cache, "HoardClient")
  expect_is(cmip_cache$cache_path_get, "function")
  expect_is(cmip_cache$cache_path_set, "function")
  expect_is(cmip_cache$cache_path_get(), 'character')
  expect_is(cmip_cache$list(), 'character')
})
