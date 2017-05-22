
<!-- README.md is generated from README.Rmd. Please edit that file -->
omdbapi is an R package wrapper for the [Open Movie Database API](https://www.omdbapi.com/)

NOTE: THE OMDB API NOW REQUIRES AN API KEY <https://www.patreon.com/posts/api-is-going-10743518>

The following functions are implemented:

-   `find_by_id`: Retrieve OMDB info by IMDB ID search
-   `find_by_title`: Retrieve OMDB info by title search
-   `get_actors`: Get actors from an omdb object as a vector
-   `get_countries`: Get countries from an omdb object as a vector
-   `get_directors`: Get directors from an omdb object as a vector
-   `get_genres`: Get genres from an omdb object as a vector
-   `get_writers`: Get writers from an omdb object as a vector
-   `print.omdb`: Print an omdb result
-   `search_by_title`: Lightweight OMDB title search

### News

-   Version `0.3.0` released (API key support & https URL switch)
-   ibartomeus adds pagination option.
-   Version `0.1.0.9000` released
-   Version `0.2.0.9000` released - better types in the data frames and `get_` methods to split the fields with multiple entries

### Installation

``` r
devtools::install_github("hrbrmstr/omdbapi")
```

### Usage

``` r
library(omdbapi)
library(tidyverse)

# current verison
packageVersion("omdbapi")
#> [1] '0.3.0'

search_by_title("Captain America")
#>                                          Title  Year    imdbID   Type
#> 1           Captain America: The First Avenger  2011 tt0458339  movie
#> 2          Captain America: The Winter Soldier  2014 tt1843866  movie
#> 3                   Captain America: Civil War  2016 tt3498820  movie
#> 4                              Captain America  1990 tt0103923  movie
#> 5  Iron Man and Captain America: Heroes United  2014 tt3911200  movie
#> 6                              Captain America  1979 tt0078937  movie
#> 7           Captain America II: Death Too Soon  1979 tt0078938  movie
#> 8                              Captain America  1944 tt0036697  movie
#> 9                              Captain America 1966– tt0206474 series
#> 10              Captain America: Super Soldier  2011 tt1740721   game
#>                                                                                                                                             Poster
#> 1                                  https://images-na.ssl-images-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_SX300.jpg
#> 2                                  https://images-na.ssl-images-amazon.com/images/M/MV5BMzA2NDkwODAwM15BMl5BanBnXkFtZTgwODk5MTgzMTE@._V1_SX300.jpg
#> 3                                  https://images-na.ssl-images-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_SX300.jpg
#> 4  https://images-na.ssl-images-amazon.com/images/M/MV5BZDkxMjg3MzAtMmFjYS00YzUyLWFhYTQtZmFlMzFhZDhjNDI5XkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_SX300.jpg
#> 5  https://images-na.ssl-images-amazon.com/images/M/MV5BMDIzMTIyYWEtYTAzZi00YzZjLTg5MGUtM2JiN2RjMDBjZmI3XkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg
#> 6  https://images-na.ssl-images-amazon.com/images/M/MV5BZmFkZWE5ODYtNjVjNC00MWYwLWJlNTgtODRlMTcyMmQwM2IxXkEyXkFqcGdeQXVyMTYxNjkxOQ@@._V1_SX300.jpg
#> 7                                  https://images-na.ssl-images-amazon.com/images/M/MV5BMTI1NTcyMzYzN15BMl5BanBnXkFtZTcwNzExMDQyMQ@@._V1_SX300.jpg
#> 8  https://images-na.ssl-images-amazon.com/images/M/MV5BZjY4MjQ2MGMtYzNlMC00MGYwLWJlZjUtNjMxZWNhNDA5Y2UwXkEyXkFqcGdeQXVyNTc4Njg5MjA@._V1_SX300.jpg
#> 9                                  https://images-na.ssl-images-amazon.com/images/M/MV5BMTM3NzE0NzU0N15BMl5BanBnXkFtZTcwNTAzMzYyMQ@@._V1_SX300.jpg
#> 10                                                http://ia.media-imdb.com/images/M/MV5BMTUwMzQ0NjE5N15BMl5BanBnXkFtZTgwODI3MzQxMTE@._V1_SX300.jpg

search_by_title("Star Wars", page = 2)
#>                                                         Title  Year    imdbID
#> 1                                            Star Wars Rebels 2014– tt2930604
#> 2                               The Star Wars Holiday Special  1978 tt0193524
#> 3                                    Robot Chicken: Star Wars  2007 tt1020990
#> 4                      Star Wars: Knights of the Old Republic  2003 tt0356070
#> 5                              Star Wars: The Force Unleashed  2008 tt1024923
#> 6                                   Star Wars: Battlefront II  2005 tt0483168
#> 7                         Robot Chicken: Star Wars Episode II  2008 tt1334272
#> 8  Star Wars: Knights of the Old Republic II - The Sith Lords  2004 tt0433458
#> 9                        Robot Chicken: Star Wars Episode III  2010 tt1691338
#> 10     Empire of Dreams: The Story of the 'Star Wars' Trilogy  2004 tt0416716
#>      Type
#> 1  series
#> 2   movie
#> 3   movie
#> 4    game
#> 5    game
#> 6    game
#> 7   movie
#> 8    game
#> 9   movie
#> 10  movie
#>                                                                                                                                                               Poster
#> 1                                                    https://images-na.ssl-images-amazon.com/images/M/MV5BNTY4NDY5ODQwMV5BMl5BanBnXkFtZTgwOTE1NjU0OTE@._V1_SX300.jpg
#> 2                                                    https://images-na.ssl-images-amazon.com/images/M/MV5BNTU2ODA2MjkwNV5BMl5BanBnXkFtZTcwOTkyMzQ0MQ@@._V1_SX300.jpg
#> 3    https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5Mjc5OTQxM15BMl5BanBnXkFtZTcwOTM1MDk3MQ@@._V1._CR114,24,284,413_SY132_CR1,0,89,132_AL_.jpg_V1_SX300.jpg
#> 4                                                                   http://ia.media-imdb.com/images/M/MV5BMjA1OTg2NDk4NF5BMl5BanBnXkFtZTcwODgzMjYyMQ@@._V1_SX300.jpg
#> 5                                                                   http://ia.media-imdb.com/images/M/MV5BMTI2MTUwMjczM15BMl5BanBnXkFtZTcwNDA0NjA4MQ@@._V1_SX300.jpg
#> 6                                                    https://images-na.ssl-images-amazon.com/images/M/MV5BMTk1NDA4MDM1MV5BMl5BanBnXkFtZTcwODAwNTUzMQ@@._V1_SX300.jpg
#> 7  https://images-na.ssl-images-amazon.com/images/M/MV5BMjIyNTg2OTcyOV5BMl5BanBnXkFtZTcwNDQxODQzNA@@._V1._CR342,682,819,1182_SY132_CR1,0,89,132_AL_.jpg_V1_SX300.jpg
#> 8                                                                   http://ia.media-imdb.com/images/M/MV5BMjE1NzU4ODU4Ml5BMl5BanBnXkFtZTcwMjI2Mzk0MQ@@._V1_SX300.jpg
#> 9                   https://images-na.ssl-images-amazon.com/images/M/MV5BMjAyNTYzODM3OF5BMl5BanBnXkFtZTcwMTY4ODM4NA@@._V1._CR21,12,310,461_SX89_AL_.jpg_V1_SX300.jpg
#> 10                   https://images-na.ssl-images-amazon.com/images/M/MV5BYzFhNzZmMjgtYzQwNC00M2UzLTkyZWUtMmMxNjQ2MDdiYTcxXkEyXkFqcGdeQXVyNDQzMDg4Nzk@._V1_SX300.jpg

search_by_title("Captain America", year_of_release=2013)
#>                              Title Year    imdbID  Type Poster
#> 1 A Look Back at 'Captain America' 2013 tt3307378 movie    N/A

games <- search_by_title("Captain America", type="game")
glimpse(games)
#> Observations: 2
#> Variables: 5
#> $ Title  <chr> "Captain America: Super Soldier", "Captain America and the A...
#> $ Year   <chr> "2011", "1991"
#> $ imdbID <chr> "tt1740721", "tt0421939"
#> $ Type   <chr> "game", "game"
#> $ Poster <chr> "http://ia.media-imdb.com/images/M/MV5BMTUwMzQ0NjE5N15BMl5Ba...

find_by_title(games$Title[1])
#> # A tibble: 0 × 0

find_by_title("Game of Thrones", type="series", season=1, episode=1)
#> # A tibble: 1 × 24
#>              Title  Year Rated   Released Season Episode Runtime
#>              <chr> <chr> <chr>     <date>  <chr>   <chr>   <chr>
#> 1 Winter Is Coming  2011 TV-MA 2011-04-17      1       1  62 min
#> # ... with 17 more variables: Genre <chr>, Director <chr>, Writer <chr>,
#> #   Actors <chr>, Plot <chr>, Language <chr>, Country <chr>, Awards <chr>,
#> #   Poster <chr>, Ratings <list>, Metascore <chr>, imdbRating <dbl>,
#> #   imdbVotes <dbl>, imdbID <chr>, seriesID <chr>, Type <chr>, Response <chr>

get_genres(find_by_title("Star Trek: Deep Space Nine", season=5, episode=7))
#> [1] "Action"    "Adventure" "Drama"

get_writers(find_by_title("Star Trek: Deep Space Nine", season=4, episode=6))
#> [1] "Gene Roddenberry (based upon \"Star Trek\" created by)"
#> [2] "Rick Berman (created by)"                              
#> [3] "Michael Piller (created by)"                           
#> [4] "David Mack"                                            
#> [5] "John J. Ordover"

get_directors(find_by_id("tt1371111"))
#> [1] "Tom Tykwer"      "Lana Wachowski"  "Lilly Wachowski"

get_countries(find_by_title("The Blind Swordsman: Zatoichi"))
#> [1] "Japan"
```

``` r
ichi <- search_by_title("Zatoichi")
pb <- progress_estimated(length(ichi$imdbID))
zato <- purrr::map_df(ichi$imdbID, find_by_id)

zato
#> # A tibble: 14 × 25
#>                                     Title  Year     Rated   Released Runtime
#>                                     <chr> <chr>     <chr>     <date>   <chr>
#> 1           The Blind Swordsman: Zatoichi  2003         R 2003-09-06 116 min
#> 2           The Blind Swordsman: Zatoichi  2003         R 2003-09-06 116 min
#> 3           The Blind Swordsman: Zatoichi  2003         R 2003-09-06 116 min
#> 4                    The Tale of Zatoichi  1962 NOT RATED 1962-04-18  95 min
#> 5                    The Tale of Zatoichi  1962 NOT RATED 1962-04-18  95 min
#> 6                  Zatoichi Meets Yojimbo  1970 NOT RATED 1970-01-15 115 min
#> 7                Zoku Zatôichi monogatari  1962 NOT RATED 1979-10-16  72 min
#> 8                Zoku Zatôichi monogatari  1962 NOT RATED 1979-10-16  72 min
#> 9                    New Tale of Zatoichi  1963 NOT RATED 1963-03-15  91 min
#> 10                               Zatôichi  1989       N/A 1989-02-04 116 min
#> 11                   Zatoichi on the Road  1963 NOT RATED 1968-06-27  85 min
#> 12                  Zatoichi the Fugitive  1963 NOT RATED 1963-08-10  86 min
#> 13                 Fight, Zatoichi, Fight  1964 NOT RATED 1964-10-17  87 min
#> 14 Zatoichi Meets the One-Armed Swordsman  1971 NOT RATED 1971-01-13  94 min
#> # ... with 20 more variables: Genre <chr>, Director <chr>, Writer <chr>,
#> #   Actors <chr>, Plot <chr>, Language <chr>, Country <chr>, Awards <chr>,
#> #   Poster <chr>, Ratings <list>, Metascore <chr>, imdbRating <dbl>,
#> #   imdbVotes <dbl>, imdbID <chr>, Type <chr>, DVD <date>, BoxOffice <chr>,
#> #   Production <chr>, Website <chr>, Response <chr>
```

``` r
ggplot(zato, aes(x="IMDB Rating", imdbRating)) + 
  geom_boxplot() +
  scale_y_continuous(limits=c(0,10)) +
  coord_flip() +
  labs(x=NULL, y=NULL, title="Distribution of IMDB Ratings for Zatoichi movies") +
  hrbrthemes::theme_ipsum_rc(grid="X")
```

<img src="README-unnamed-chunk-2-1.png" width="960" />

### Test Results

``` r
library(omdbapi)
library(testthat)

date()
#> [1] "Mon May 22 06:52:06 2017"

test_dir("tests/")
#> testthat results ================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
#> 
#> DONE ===========================================================================
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
