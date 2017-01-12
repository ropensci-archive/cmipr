# cache data
cache_data <- function(key, cache = TRUE, overwrite = FALSE) {
  cmip_cache$mkdir()
  file <- file.path(cmip_cache$cache_path_get(), basename(key))

  if (!file.exists(file)) {
    suppressMessages(cmip_GET_write(sub("/$", "", make_path(key)),
                                    file, overwrite))
  }

  return(file)
}
