import 'package:peliculas_app_jany/models/movie.dart';
import 'package:peliculas_app_jany/models/now_playing_response.dart';
import 'package:peliculas_app_jany/models/popular_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/credits_response.dart';

class MovieProviders extends ChangeNotifier {
  //crear variables para usar con el http
  String _apiKey = '17668ea3a337f735e26cd1ec6ef57ac8';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-Es';

//crear este list para mostrar las imagenes
  List<Movie> ondisplayMovies = [];
  List<Movie> popularMovie = [];
  // Crear un Map
  Map<int, List<Cast>> movieCast = {};

  MovieProviders() {
    print('movieproviders inicializando');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final nowPlayinResponse = NowPlayinResponse.fromJson(response.body);
    print(nowPlayinResponse.results[1].title);

    ondisplayMovies = nowPlayinResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    // print(popularResponse.results[1].title);

    popularMovie = [...popularMovie, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    var url = Uri.https(_baseUrl, '/3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final creditsResponse = CreditsResponse.fromJson(response.body);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
