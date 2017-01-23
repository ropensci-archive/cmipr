#' List files/folders
#'
#' @export
#' @param route Route to a FTP folder on the CMIP site
#' @return A \code{tibble}
#' @examples \dontrun{
#' cmip_list_files()
#' cmip_list_files('bcsd')
#' cmip_list_files('bcsd/yearly')
#' cmip_list_files('bcsd/yearly/cccma_cgcm3_1.1')
#' cmip_list_files('cmip5')
#' cmip_list_files('cmip5/bcsd')
#' cmip_list_files('cmip5/bcsd/regrid')
#' cmip_list_files('cmip5/bcsd/regrid/ccsm4')
#' cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26')
#' cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26/mon')
#' cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26/mon/r3i1p1')
#' cmip_list_files('cmip5/bcsd/regrid/ccsm4/rcp26/mon/r3i1p1/tas')
#' cmip_list_files('wwcra/monthly/riog/')
#' cmip_list_files('wwcra/monthly/riog/sresb1.mpi_echam5.3/tmax')
#' }
cmip_list_files <- function(route = NULL) {
  assert(route, "character")
  res <- cmip_GET_list(make_path(route))
  parse_file(res)
}

cmip_GET_list <- function(route) {
  x <- curl::curl(route)
  on.exit(close(x))
  readLines(x)
}

parse_file <- function(x) {
  tt <- utils::read.delim(text = paste0(x, collapse = "\n"), sep = "",
             header = FALSE, skip = 1, stringsAsFactors = FALSE)
  as_tbl(data.frame(
    date = as.Date(unname(apply(tt[,6:8], 1, paste0, collapse = "-")),
                   "%b-%d-%Y"),
    file = tt[,NCOL(tt)],
    stringsAsFactors = FALSE
  ))
}
