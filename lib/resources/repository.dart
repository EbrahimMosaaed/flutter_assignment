import '../constant/movie_type.dart';

import '../Model/upcoming_model.dart';

import 'apiProvider.dart';

class Repository {
  // int id;
  final apiProvider = ApiProvider();
  Future<MoviesModel> fetchUpcomingMovies() =>
      apiProvider.fetchMoviesType(MovieType.UPCOMING);

  Future<MoviesModel> fetchMovieDetails(int id) =>
      apiProvider.fetchMovieDetails(id);
}
