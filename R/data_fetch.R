#' Fetch data
#'
#' @export
#' @param route Route to a folder, a character string
#' @param overwrite (logical) Whether to overwrite files if they already
#' exist on your machine. Default: \code{FALSE}
#' @details Note that data is not read into R as data can be very large.
#' See \code{\link{cmip_read}}
#' @return A character vector of full file paths. A print method makes a tidy
#' return object
#' @examples \dontrun{
#' key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2034.nc"
#' (res <- cmip_fetch(key))
#' cmip_read(res)
#' }
cmip_fetch <- function(route, overwrite = FALSE) {
  res <- cache_data(route, cache = TRUE, overwrite = overwrite)
  structure(res, class = "cmip_file")
}

#' @export
print.cmip_file <- function(x, ...) {
  cat("<CMIP file>", sep = "\n")
  cat(paste0("   File: ", x[1]), sep = "\n")
  cat(sprintf("   File size: %s MB", file.info(x)$size / 1000000L), sep = "\n")
}
