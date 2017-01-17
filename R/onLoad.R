cmip_cache <- NULL

.onLoad <- function(libname, pkgname){
  x <- hoardr::hoard()
  x$cache_path_set("cmip")
  cmip_cache <<- x
}
