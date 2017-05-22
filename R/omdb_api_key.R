#' Get or set OMDB_API_KEY value
#'
#' The API wrapper functions in this package all rely on a OMDB API
#' key residing in the environment variable `OMDB_API_KEY`. The
#' easiest way to accomplish this is to set it in the `.Renviron` file in your
#' home directory.
#'
#' @md
#' @param force force setting a new OMDB API key for the current environment?
#' @return atomic character vector containing the OMDB API key
#' @note The "poster" API requires a separate key
#' @export
omdb_api_key <- function(force = FALSE) {

  env <- Sys.getenv('OMDB_API_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var OMDB_API_KEY to your OMDB API key",
      call. = FALSE)
  }

  message("Couldn't find env var OMDB_API_KEY See ?omdb_api_key for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("OMDB API key entry failed", call. = FALSE)
  }

  message("Updating OMDB_API_KEY env var to PAT")
  Sys.setenv(OMDB_API_KEY = pat)

  pat

}
