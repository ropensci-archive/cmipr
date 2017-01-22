context("cmip_list_files")

key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"

test_that("cmip_list_files works", {
  skip_on_cran()

  #res <- cmip_list_files()

  # cmip_list_files('bcsd/yearly')
  # cmip_list_files('bcsd/yearly/cccma_cgcm3_1.1')
  # cmip_list_files('cmip5')
  # cmip_list_files('cmip5/bcsd')
  # cmip_list_files('cmip5/bcsd/regrid')
  # cmip_list_files('cmip5/bcsd/regrid/ccsm4')
  # cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26')
  # cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26/mon')
  # cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26/mon/r3i1p1')
})

test_that("cmip_list_files - fails well", {
  skip_on_cran()

  expect_error(cmip_list_files(5), "route must be of class character")
  expect_error(cmip_list_files(mtcars), "route must be of class character")
})
