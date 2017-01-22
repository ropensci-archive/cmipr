context("cmip_fetch")

key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"

test_that("cmip_fetch works", {
  skip_on_cran()

  aa <- cmip_fetch(route = key)

  expect_is(aa, "cmip_file")
  expect_match(aa, ".nc")
  expect_match(aa, "cmip")
  expect_match(aa, "Prcp")
})

test_that("cmip_fetch - fails well", {
  skip_on_cran()

  expect_error(cmip_fetch(), "argument \"route\" is missing")
  expect_error(cmip_fetch("aasdf", overwrite = 5),
               "overwrite must be of class logical")
})
