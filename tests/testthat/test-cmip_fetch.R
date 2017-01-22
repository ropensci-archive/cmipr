context("cmip_fetch")

# key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"
key <- "bcsd/2deg/1950-2099/sresb1/sresb1.miub_echo_g.1.monthly.Tavg.RAW.1950-2099.nc"

test_that("cmip_fetch works", {
  skip_on_cran()

  cmip_cache$delete_all()

  aa <- cmip_fetch(route = key)

  expect_is(aa, "cmip_file")
  expect_match(aa, ".nc")
  expect_match(aa, "cmip")
  expect_match(aa, "monthly")
})

test_that("cmip_fetch - fails well", {
  skip_on_cran()

  expect_error(cmip_fetch(), "argument \"route\" is missing")
  expect_error(cmip_fetch("aasdf", overwrite = 5),
               "overwrite must be of class logical")
})
