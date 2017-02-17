context("cmip_read")

#key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"
key <- "bcsd/2deg/1950-2099/sresb1/sresb1.miub_echo_g.1.monthly.Tavg.RAW.1950-2099.nc" # nolint

test_that("cmip_read works", {
  skip_on_cran()

  cmip_cache$delete_all()

  res <- cmip_fetch(key)

  # cmip_file class
  aa <- cmip_read(res)
  expect_is(aa, "RasterLayer")

  # character string, a path
  bb <- cmip_read(res[[1]])
  expect_is(bb, "RasterLayer")

  expect_identical(cmip_read(res), cmip_read(res[[1]]))
})

test_that("cmip_read - fails well", {
  skip_on_cran()

  expect_error(cmip_read(), "argument \"x\" is missing")
  expect_error(cmip_read("Adfadfs"), "is not TRUE")
})
