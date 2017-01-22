context("cmip_read")

key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"

test_that("cmip_read works", {
  skip_on_cran()

  res <- cmip_fetch(key)

  # single
  aa <- cmip_read(res)
  expect_is(aa, "RasterLayer")

  # a few
  # bb <- cmip_read(res[1:2])
  # expect_is(bb, "RasterStack")

  # all
  # cc <- cmip_read(res)
  # expect_is(cc, "RasterStack")
})

test_that("cmip_read - fails well", {
  skip_on_cran()

  expect_error(cmip_read(), "argument \"x\" is missing")
  expect_error(cmip_read("Adfadfs"), "is not TRUE")
})
