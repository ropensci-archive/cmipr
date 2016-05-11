# cache data
cache_data <- function(key, cache = TRUE, overwrite = FALSE) {
  cache_dir <- user_cache_dir("cmip")

  if (!file.exists(cache_dir)) {
    dir.create(cache_dir, recursive = TRUE)
  }

  file <- file.path(cache_dir, basename(key))

  if (!file.exists(file)) {
    suppressMessages(cmip_GET_write(sub("/$", "", make_path(key)), file, overwrite))
  }

  return(file)
}
