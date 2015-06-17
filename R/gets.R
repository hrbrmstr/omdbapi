#' Get actors from an omdb object as a vector
#'
#' Splits the field at commas and returns a vector of individual entries
#'
#' @param omdb an object returned by \code{find_by_title} or \code{find_by_id}
#' @export
#' @return A character vector of actors
#' @examples
#' get_actors(find_by_id("tt0031381"))
get_actors <- function(omdb) {

  if (!inherits(omdb, "omdb")) {
    message("get_actors() expects an omdb object")
    return(NULL)
  }

  if ("Actors" %in% names(omdb)) {
    str_split(omdb$Actors, ",[ ]*")[[1]]
  }

}

#' Get directors from an omdb object as a vector
#'
#' Splits the field at commas and returns a vector of individual entries
#'
#' @param omdb an object returned by \code{find_by_title} or \code{find_by_id}
#' @export
#' @return A character vector of directors
#' @examples
#' get_directors(find_by_id("tt0031381"))
get_directors <- function(omdb) {

  if (!inherits(omdb, "omdb")) {
    message("get_directors() expects an omdb object")
    return(NULL)
  }

  if ("Director" %in% names(omdb)) {
    str_split(omdb$Director, ",[ ]*")[[1]]
  }

}

#' Get writers from an omdb object as a vector
#'
#' Splits the field at commas and returns a vector of individual entries
#'
#' @param omdb an object returned by \code{find_by_title} or \code{find_by_id}
#' @export
#' @return A character vector of writers
#' @examples
#' get_writers(find_by_id("tt0031381"))
get_writers <- function(omdb) {

  if (!inherits(omdb, "omdb")) {
    message("get_writers() expects an omdb object")
    return(NULL)
  }

  if ("Writer" %in% names(omdb)) {
    str_split(omdb$Writer, ",[ ]*")[[1]]
  }

}

#' Get countries from an omdb object as a vector
#'
#' Splits the field at commas and returns a vector of individual entries
#'
#' @param omdb an object returned by \code{find_by_title} or \code{find_by_id}
#' @export
#' @return A character vector of countries
#' @examples
#' get_countries(find_by_id("tt0031381"))
get_countries <- function(omdb) {

  if (!inherits(omdb, "omdb")) {
    message("get_countries() expects an omdb object")
    return(NULL)
  }

  if ("Country" %in% names(omdb)) {
    str_split(omdb$Country, ",[ ]*")[[1]]
  }

}

#' Get genres from an omdb object as a vector
#'
#' Splits the field at commas and returns a vector of individual entries
#'
#' @param omdb an object returned by \code{find_by_title} or \code{find_by_id}
#' @export
#' @return A character vector of genres
#' @examples
#' get_genres(find_by_id("tt0031381"))
get_genres <- function(omdb) {

  if (!inherits(omdb, "omdb")) {
    message("get_genres() expects an omdb object")
    return(NULL)
  }

  if ("Genre" %in% names(omdb)) {
    str_split(omdb$Genre, ",[ ]*")[[1]]
  }

}
