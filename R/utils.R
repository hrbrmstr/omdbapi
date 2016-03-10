
fix_omdb <- function(x) {

  if ("Released" %in% colnames(x))          x$Released          <- as.Date(x$Released, format="%d %b %Y")
  if ("DVD" %in% colnames(x))               x$DVD               <- as.Date(x$DVD, format="%d %b %Y")

  if ("imdbRating" %in% colnames(x))        x$imdbRating        <- as.numeric(x$imdbRating)
  if ("imdbVotes" %in% colnames(x))         x$imdbVotes         <- as.numeric(gsub(",", "", x$imdbVotes))
  if ("tomatoRating" %in% colnames(x))      x$tomatoRating      <- as.numeric(x$tomatoRating)
  if ("tomatoUserRating" %in% colnames(x))  x$tomatoUserRating  <- as.numeric(x$tomatoUserRating)

  if ("tomatoMeter" %in% colnames(x))       x$tomatoMeter       <- as.integer(x$tomatoMeter)
  if ("tomatoReviews" %in% colnames(x))     x$tomatoReviews     <- as.integer(x$tomatoReviews)
  if ("tomatoFresh" %in% colnames(x))       x$tomatoFresh       <- as.integer(x$tomatoFresh)
  if ("tomatoRotten" %in% colnames(x))      x$tomatoRotten      <- as.integer(x$tomatoRotten)
  if ("tomatoUserMeter" %in% colnames(x))   x$tomatoUserMeter   <- as.numeric(x$tomatoUserMeter)
  if ("tomatoUserReviews" %in% colnames(x)) x$tomatoUserReviews <- as.integer(x$tomatoUserReviews)

  x

}

ID_download <- function(ID){
  bind_rows(lapply(ID, function(x) {
    find_by_id(x, include_tomatoes = TRUE)
  }))
}
