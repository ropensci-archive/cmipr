context("cmip_list_files")

key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"

test_that("cmip_list_files works", {
  skip_on_cran()

  res <- cmip_list_files()

  expect_is(res, "tbl_df")
  expect_is(res, "data.frame")
  expect_named(res, c('date', 'file'))

  aa <- cmip_list_files('bcsd/yearly')
  bb <- cmip_list_files('cmip5/bcsd/regrid/ccsm4')

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_named(aa, c('date', 'file'))

  expect_is(bb, "tbl_df")
  expect_is(bb, "data.frame")
  expect_named(bb, c('date', 'file'))

  expect_gt(NROW(aa), NROW(bb))
})

test_that("cmip_list_files - fails well", {
  skip_on_cran()

  expect_error(cmip_list_files(5), "route must be of class character")
  expect_error(cmip_list_files(mtcars), "route must be of class character")
})
