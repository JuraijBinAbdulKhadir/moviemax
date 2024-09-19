import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviemax/Services/movie-model.dart';

import 'constants.dart';

class ApiService {
  final String baseUrl = 'https://api.themoviedb.org/3';


  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/discover/movie?api_key=$apiKey'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        List<Movie>movies=data.map((movie) => Movie.fromJson(movie)).toList();
        print(movies);
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> getPopular() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        List<Movie>movies=data.map((movie) => Movie.fromJson(movie)).toList();
        print(movies);
        return movies;
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> getTopRated() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        List<Movie>movies=data.map((movie) => Movie.fromJson(movie)).toList();
        print(movies);
        return movies;
      } else {
        throw Exception('Failed to load top-rated movies');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Movie>> getTv() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/discover/tv?api_key=$apiKey'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['results'];
        List<Movie>movies=data.map((movie) => Movie.fromJson(movie)).toList();
        print(movies);
        return movies;
      } else {
        throw Exception('Failed to load TV series');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
