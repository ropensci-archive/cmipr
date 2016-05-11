#' Reaa data into R
#'
#' @export
#' @param x A \code{ccafs_files} object, the output from a call to \code{\link{cmip_fetch}}
#' @return \code{RasterLayer} or \code{RasterBrick} class object
#' @examples \dontrun{
#' key <- "bcsd/yearly/cnrm_cm3.1/cnrm_cm3.1.sresa1b.monthly.Prcp.2035.nc"
#' res <- cmip_fetch(key)
#'
#' # a single file
#' cmip_read(res)
#'
#' # character path input
#' ## you can also pass in a path to a file(s)
#' cmip_read(key)
#'
#' # plot data
#' plot(cmip_read(res))
#' }
cmip_read <- function(x) {
  UseMethod("cmip_read")
}

#' @export
cmip_read.default <- function(x) {
  stop("no 'cmip_read' method for class ", class(x), call. = FALSE)
}

#' @export
cmip_read.cmip_file <- function(x) {
  cmip_read(unclass(x))
}

#' @export
cmip_read.character <- function(x) {
  if (length(x) == 1) {
    raster(x)
  } else if (length(x) > 1) {
    brick(as.list(x))
  } else {
    stop("input had length zero", call. = FALSE)
  }
}
