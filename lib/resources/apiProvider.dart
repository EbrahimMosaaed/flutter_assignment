import 'dart:convert';
import '../Model/upcoming_model.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final _apiKey = '351b13cf17d83ad0c0eb3782e4feef03';

  Future<MoviesModel> fetchMoviesType(String type) async {
    final String _baseUrl =
        "https://api.themoviedb.org/3/movie/$type?api_key=$_apiKey";

    final response = await client.get(_baseUrl);
    if (response.statusCode == 200) {
      return MoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Faild to load");
    }
  }

  Future<MoviesModel> fetchMovieDetails(int id) async {
    final String url =
        "https://api.themoviedb.org/3/movie/$id?api_key=$_apiKey";
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return MoviesModel.detailJson(json.decode(response.body));
    } else {
      throw Exception("Faild to load");
    }
  }
}
