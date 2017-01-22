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
  cli <- crul::HttpClient$new(
    url = url,
    headers = list(Authorization = "Basic anonymous:myrmecocystus@gmail.com")
  )

  if (!overwrite) {
    if (file.exists(path)) {
      stop("file exists and ovewrite != TRUE", call. = FALSE)
    }
  }

  res <- tryCatch(
    cli$get(disk = path),
    error = function(e) e
  )

  if (inherits(res, "error")) {
    unlink(path)
    stop(res$message, call. = FALSE)
  }
  return(res)
}

as_tbl <- function(x) tibble::as_tibble(x)

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
