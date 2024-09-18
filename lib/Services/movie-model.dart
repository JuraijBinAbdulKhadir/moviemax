class Movie {
  final String title;
  final String poster;
  final String overview;
  final String backdrop;

  Movie(
      {required this.title, required this.poster, required this.overview, required this.backdrop});


  factory Movie.fromJson(Map<String, dynamic> map){
    return Movie(
        title:map['title'],
        poster: map['poster_path'],
        overview: map['overview'],
        backdrop: map['backdrop_path']
    );
  }

  Map<String,dynamic> toJson(){
   return {
     'title':title,
     'poster':poster,
     'overview':overview,
     'backdrop':backdrop,
   };
}


}