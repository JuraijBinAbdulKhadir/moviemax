

import 'dart:convert';

import 'package:moviemax/Services/constants.dart';
import 'package:moviemax/Services/movie-model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final String moviesUrl='https://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
  final String popularUrl='https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  final String topRatedUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  final String tvUrl='https://api.themoviedb.org/3/discover/tv?api_key=$apiKey';

  Future<List<Movie>> getMovies()async{
    final response= await http.get(Uri.parse(moviesUrl));
    try{
      if(response.statusCode==200){
        List<dynamic> data= json.decode(response.body)['results'];

        List<Movie> movies= data.map((movie)=>Movie.fromJson(movie)).toList();
        return movies;
      }
    }catch(e){
      throw Exception('Error:-------------->$e');

    }
    return [];

  }

  Future<List<Movie>> getPopular()async{
    final response=await http.get(Uri.parse(popularUrl));
    try{
       if(response.statusCode==200){
         List<dynamic> data=json.decode(response.body)['results'];

         List<Movie> movies=data.map((movie)=>Movie.fromJson(movie)).toList();
         return movies;
       }

    }catch(e){
      throw Exception('Error-------------->$e');
    }
    return [];
  }

  Future<List<Movie>> getTopRated()async{
    final response =await http.get(Uri.parse(topRatedUrl));
    try{
       if(response.statusCode==200){
         List<dynamic> data = json.decode(response.body)['results'];
         List<Movie> movies = data.map((movie)=>Movie.fromJson(movie)).toList();
         return movies;
       }
    }catch(e){
      throw Exception('Error-------------------->$e');
    }
    return [];
  }

  Future<List<Movie>> getTv()async{
    final response = await http.get(Uri.parse(tvUrl));

    try{
      if(response.statusCode==200){
        List<dynamic> data=json.decode(response.body)['results'];

        List<Movie> movies = data.map((movie)=>Movie.fromJson(movie)).toList();
        return movies;
      }
    }catch(e){
      throw Exception('Error-------------------->$e');
    }
    return [];
  }
}