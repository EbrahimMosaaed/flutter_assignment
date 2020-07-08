class MoviesModel {
  List<Movie> results;
  int totalResults;
  List<Genre> generId;
  MoviesModel.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = List<Movie>();
      json['results'].forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
  }
  MoviesModel.detailJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      generId = List<Genre>();
      json['genres'].forEach((v) {
        generId.add(Genre.fromJson(v));
      });
    }
  }
}

class Movie {
  int id;
  String titel;
  String posterPath;
  String backdroPath;
  String language;
  String overView;
  String realseDate;
  String voteAvrage;
  String popularity;
  String originalName;
  // List<Genre> genreIds;

  Movie.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    titel = jsonData['title'].toString();
    posterPath = jsonData['poster_path'].toString();
    backdroPath = jsonData['backdrop_path'].toString();
    language = jsonData['original_language'].toString();
    overView = jsonData['overview'].toString();
    realseDate = jsonData['release_date'].toString();
    voteAvrage = jsonData['vote_average'].toString();
    popularity = jsonData['popularity'].toString();
    originalName = jsonData['original_name'].toString();
    // genreIds = jsonData['genre_ids'];
  }
}

class Genre {
  int id;
  String name;
// List genres;
  Genre.fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
    // genres=data['genres'];
  }
}
