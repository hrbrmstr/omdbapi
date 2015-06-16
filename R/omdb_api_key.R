# #' Get or set OMDBAPI_KEY value
# #'
# #' The API wrapper functions in this package all rely on a omdb API
# #' key residing in the environment variable \code{OMDBAPI_KEY}. The
# #' easiest way to accomplish this is to set it in the `\code{.Renviron}` file in your
# #' home directory.
# #'
# #' @param force force setting a new omdb API key for the current environment?
# #' @return atomic character vector containing the omdb API key
# #' @note an omdb API key is only necessary for "poster" access
# #' @export
# omdb_api_key <- function(force = FALSE) {
#
#   env <- Sys.getenv('OMDBAPI_KEY')
#   if (!identical(env, "") && !force) return(env)
#
#   if (!interactive()) {
#     stop("Please set env var OMDBAPI_KEY to your omdb API key",
#       call. = FALSE)
#   }
#
#   message("Couldn't find env var OMDBAPI_KEY See ?omdb_api_key for more details.")
#   message("Please enter your API key and press enter:")
#   pat <- readline(": ")
#
#   if (identical(pat, "")) {
#     stop("PassiveTotal API key entry failed", call. = FALSE)
#   }
#
#   message("Updating OMDBAPI_KEY env var to PAT")
#   Sys.setenv(OMDBAPI_KEY = pat)
#
#   pat
#
# }
