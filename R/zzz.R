cp <- function(x) Filter(Negate(is.null), x)

cmip_base <- function() "ftp://gdo-dcp.ucllnl.org/pub/dcp/archive/"

make_path <- function(x) {
  tt <- paste0(cmip_base(), x)
  if (!grepl("/$", tt)) paste0(tt, "/") else tt
}

last <- function(x) {
  x[length(x)]
}

cmip_GET_write <- function(url, path, overwrite = TRUE, ...) {
  suppressWarnings(GET(url, write_disk(path, overwrite = overwrite),
      authenticate("anonymous", "myrmecocystus@gmail.com"), ...))
}
