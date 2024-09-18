// movie_provider.dart
import 'package:flutter/material.dart';
import '../Services/api-service.dart';
import '../Services/movie-model.dart';


class MovieProvider with ChangeNotifier {
  final ApiService apiService = ApiService();

  List<Movie> _popularMovies = [];
  List<Movie> _topRatedMovies = [];
  List<Movie> _tvSeries = [];
  List<Movie> _moviesList = [];

  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get topRatedMovies => _topRatedMovies;
  List<Movie> get tvSeries => _tvSeries;
  List<Movie> get moviesList => _moviesList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      _popularMovies = await apiService.getPopular();
      _topRatedMovies = await apiService.getTopRated();
      _tvSeries = await apiService.getTv();
      _moviesList = await apiService.getMovies();
    } catch (e) {
      print(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
