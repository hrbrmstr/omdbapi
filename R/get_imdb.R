#' Retrieve IMDB ratings for all Episodes of a TV series
#'
#' @param name TV series for which to obtain ratings for. Has to be of IMDB type "TV series".
#' @seealso \href{omdbAPI documentation}{http://www.omdbapi.com/}
#' @return \code{data.frame} 
#' @note Can be quite slow, depending on your internet connection.
#' @export

get_tv_data <- function(name) {
  # Stop if argument is missing
  if (missing(name))
    stop("Need to specify name of TV series")
  
  # Get some info about the name
  query <- GET("http://www.omdbapi.com/", 
               query = list(t = name,
                            r = "json"))
  query_parsed <- content(query, as = "parsed")
  
  if (query_parsed$Type != "series")
    stop("This is not a TV series")
  
  # Make containers
  object <- data.frame(Season = NA,
                       Episode = NA, 
                       imdbRating = NA,
                       episode.no = NA)
  result <- matrix(nrow = 1)
  ep.no <- 0
  
  # Starting values
  i <- 1
  j <- 1
  # Pull data
  while (!is.null(result)) {
    if (i > 1 & j == 1) {
      break
    }
    # Starting values
    j <- 1
    
    while (!is.null(result)) {
      # Get data from OMDB
      query <- GET("http://www.omdbapi.com/", 
                   query = list(t = name, 
                                Season = i,
                                Episode = j),
                   r = "json")
      
      # Parse content
      query_parsed <- content(query, as = "parsed")
      
      # Store content
      result <- query_parsed$imdbRating
      
      if (!is.null(result) && result == "N/A") {
        result <- NA
      }
      
      # Next season if no more episodes
      if (is.null(result)) {
        result <- 0
        break
      }
      
      # Make episode no higher
      ep.no <- ep.no + 1
      
      # Fill container
      object[ep.no, ] <- c(i, j, result, ep.no)
      
      # Next iteration
      j <- j + 1
    }
    cat(paste("Last episode of Season", i, "was episode", j - 1, "\n"))
    i <- i + 1
  }
  
  # Necessary transformations
  object <- sapply(object, FUN = as.numeric)
  object <- as.data.frame(object)
  
  # Delete Season if only NA's
  for (season in unique(object$Season)) {
    if (all(is.na(object[object$Season == season, "imdbRating"]))) {
      object <- object[object$Season != season, ]
      cat("Season", season, "was deleted, because all Ratings were NA")
    }
  }
  
  # Make factors
  object$Season <- as.factor(object$Season)
  object$Episode <- as.factor(object$Episode)
  
  return(object)
  rm(list = c("object", "query", "query_parsed", "result", "season", "ep.no", "i", "j"))
}