<!-- README.md is generated from README.Rmd. Please edit that file -->
omdbapi is an R package wrapper for the [Open Movie Database API](http://www.omdbapi.com/)

The following functions are implemented:

-   `find_by_id`: Retrieve OMDB info by IMDB ID search
-   `find_by_title`: Retrieve OMDB info by title search
-   `get_actors`: Get actors from an omdb object as a vector
-   `get_countries`: Get countries from an omdb object as a vector
-   `get_directors`: Get directors from an omdb object as a vector
-   `get_genres`: Get genres from an omdb object as a vector
-   `get_writers`: Get writers from an omdb object as a vector
-   `print.omdb`: Print an omdb result
-   `search_by_title`: Lightweight omdb title search

### News

-   Version `0.1.0.9000` released
-   Version `0.2.0.9000` released - better types in the data frames and `get_` methods to split the fields with multiple entries

### Installation

``` r
devtools::install_github("hrbrmstr/omdbapi")
```

### Usage

``` r
library(omdbapi)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> 
#> The following object is masked from 'package:stats':
#> 
#>     filter
#> 
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(pbapply)

# current verison
packageVersion("omdbapi")
#> [1] '0.2.0.9000'

search_by_title("Captain America")
#> Source: local data frame [10 x 4]
#> 
#>                                                   Title  Year    imdbID   Type
#> 1                    Captain America: The First Avenger  2011 tt0458339  movie
#> 2                   Captain America: The Winter Soldier  2014 tt1843866  movie
#> 3                                       Captain America  1990 tt0103923  movie
#> 4                                       Captain America  1979 tt0078937  movie
#> 5           Iron Man and Captain America: Heroes United  2014 tt3911200  movie
#> 6                    Captain America II: Death Too Soon  1979 tt0078938  movie
#> 7                                       Captain America  1944 tt0036697  movie
#> 8                                       Captain America 1966– tt0206474 series
#> 9                        Captain America: Super Soldier  2011 tt1740721   game
#> 10 Comic Book Origins: Captain America - Winter Soldier  2014 tt3618126  movie

search_by_title("Captain America", year_of_release=2013)
#> Source: local data frame [1 x 4]
#> 
#>                              Title Year    imdbID  Type
#> 1 A Look Back at 'Captain America' 2013 tt3307378 movie

games <- search_by_title("Captain America", type="game")
glimpse(games)
#> Observations: 2
#> Variables:
#> $ Title  (chr) "Captain America: Super Soldier", "Captain America and the A...
#> $ Year   (chr) "2011", "1991"
#> $ imdbID (chr) "tt1740721", "tt0421939"
#> $ Type   (chr) "game", "game"

find_by_title(games$Title[1])
#>      Title: Captain America: Super Soldier
#>       Year: 2011
#>      Rated: N/A
#>   Released: 2011-07-19
#>    Runtime: N/A
#>      Genre: Action
#>   Director: Michael McCormick, Robert Taylor
#>     Writer: Christos N. Gage
#>     Actors: Hayley Atwell, Chris Evans, Sebastian Stan, Neal McDonough
#>       Plot: You play the Sentinel of Liberty as you raid the Red Skull's scientist
#>             minion, Armin Zola's, lair.
#>   Language: English
#>    Country: USA
#>     Awards: N/A
#>     Poster: http://ia.media-imdb.com/images/M/
#>             MV5BMTUwMzQ0NjE5N15BMl5BanBnXkFtZTgwODI3MzQxMTE@._V1_SX300.jpg
#>  Metascore: N/A
#> imdbRating: 7.2
#>  imdbVotes: 271
#>     imdbID: tt1740721
#>       Type: game

find_by_title("Game of Thrones", type="series", season=1, episode=1)
#>      Title: Winter Is Coming
#>       Year: 2011
#>      Rated: TV-MA
#>   Released: 2011-04-17
#>    Runtime: 62 min
#>      Genre: Adventure, Drama, Fantasy
#>   Director: Timothy Van Patten
#>     Writer: David Benioff (created by), D.B. Weiss (created by), George R.R.
#>             Martin ("A Song of Ice and Fire" by), David Benioff, D.B.
#>             Weiss
#>     Actors: Sean Bean, Mark Addy, Nikolaj Coster-Waldau, Michelle Fairley
#>       Plot: Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans
#>             to ask his oldest friend, Eddard Stark, to take Jon's
#>             place. Across the sea, Viserys Targaryen plans to wed his
#>             sister to a nomadic warlord in exchange for an army.
#>   Language: English
#>    Country: USA
#>     Awards: N/A
#>     Poster: http://ia.media-imdb.com/images/M/
#>             MV5BMTk5MDU3OTkzMF5BMl5BanBnXkFtZTcwOTc0ODg5NA@@._V1_SX300.jpg
#>  Metascore: N/A
#> imdbRating: 8.5
#>  imdbVotes: 12584
#>     imdbID: tt1480055
#>       Type: episode

get_genres(find_by_title("Star Trek: Deep Space Nine", season=5, episode=7))
#> [1] "Action"    "Adventure" "Drama"

get_writers(find_by_title("Star Trek: Deep Space Nine", season=4, episode=6))
#> [1] "Gene Roddenberry (based upon \"Star Trek\" created by)"
#> [2] "Rick Berman (created by)"                              
#> [3] "Michael Piller (created by)"                           
#> [4] "David Mack"                                            
#> [5] "John J. Ordover"

get_directors(find_by_id("tt1371111"))
#> [1] "Tom Tykwer"     "Andy Wachowski" "Lana Wachowski"

get_countries(find_by_title("The Blind Swordsman: Zatoichi"))
#> [1] "Japan"

ichi <- search_by_title("Zatoichi")
bind_rows(lapply(ichi$imdbID, function(x) {
  find_by_id(x, include_tomatoes = TRUE)
})) -> zato

par(mfrow=c(3,1)) 
boxplot(zato$tomatoUserMeter, horizontal=TRUE, main="Tomato User Meter", ylim=c(0, 100))
boxplot(zato$imdbRating, horizontal=TRUE, main="IMDB Rating", ylim=c(0, 10))
boxplot(zato$tomatoUserRating, horizontal=TRUE, main="Tomato User Rating", ylim=c(0, 5))
```

![](README-usage-1.png)

``` r
par(mfrow=c(1,1))
```

### Test Results

``` r
library(omdbapi)
library(testthat)

date()
#> [1] "Tue Jun 16 22:56:47 2015"

test_dir("tests/")
#> basic functionality :
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
