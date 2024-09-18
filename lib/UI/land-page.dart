import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviemax/Services/api-service.dart';



import 'package:moviemax/UI/splash-screen.dart';
import 'package:moviemax/UI/widgets/text-widget.dart';
import 'package:shimmer/shimmer.dart';

import '../Services/movie-model.dart';


class LandPage extends StatefulWidget {
  const LandPage({super.key});

  @override
  State<LandPage> createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
  final ApiService apiService = ApiService();

  late Future<List<Movie>> popularMovies ;
  late Future<List<Movie>> topRatedMovies ;
  late Future<List<Movie>> tvSeries ;
  late Future<List<Movie>> moviesList ;

  @override
  void initState() {
    // TODO: implement initState
    popularMovies=apiService.getPopular();
    topRatedMovies=apiService.getTopRated();
    moviesList=apiService.getMovies();
    tvSeries=apiService.getTv();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const MyText(
            text: 'Movie-Max',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        leading: IconButton(onPressed: () {_scaffoldKey.currentState?.openDrawer();}, icon: const Icon(Icons.menu)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Center(child: MyText(text: "Profile", color: Colors.red, fontWeight: FontWeight.normal, fontSize: 24))),
            ListTile(
              leading: const Icon(Icons.settings,color: Colors.red,),
              title: const MyText(text: 'Settings', color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
              onTap: () {
                // Handle settings tap
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout,color: Colors.red,),
              title: const MyText(text: 'Logout', color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
              onTap: () {
                // Handle logout tap
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const SplashScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyText(
                text: 'Popular',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15),
            FutureBuilder(
              future:popularMovies ,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                     final movies=snapshot.data;
                return CarouselSlider.builder(
                  itemCount:movies?.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.4,
                      autoPlayInterval: const Duration(seconds: 3)),
                  itemBuilder: (context, index, movieIndex) {
                    final movie = movies![index];
                    return Container(
                      width: double.infinity,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdrop}',
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[500]!,
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            color: Colors.black,
                          ),
                        ), // Placeholder widget
                        errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ),
            const MyText(
                text: 'Top-Rated',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                   final movies=snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies!.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdrop}',
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[700]!,
                              highlightColor: Colors.grey[500]!,
                              child: Container(
                                height: 120,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                            ), // Placeholder widget
                            errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          )
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const MyText(text: 'Movies', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: FutureBuilder(
                future: moviesList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final movies=snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies!.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdrop}',
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[700]!,
                              highlightColor: Colors.grey[500]!,
                              child: Container(
                                height: 120,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                            ), // Placeholder widget
                            errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const MyText(text: 'Tv Series', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: FutureBuilder(
                future: tvSeries,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final movies=snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies!.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/original/${movie.backdrop}',
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[700]!,
                              highlightColor: Colors.grey[500]!,
                              child: Container(
                                height: 120,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                            ), // Placeholder widget
                            errorWidget: (context, url, error) => const Icon(Icons.error), // Error widget
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
