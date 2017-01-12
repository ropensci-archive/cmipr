cmip_cache <- NULL

.onLoad <- function(libname, pkgname){
  x <- hoard::hord()
  x$cache_path_set("cmip")
  cmip_cache <<- x
}
