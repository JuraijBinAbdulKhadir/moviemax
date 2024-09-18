import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:moviemax/UI/splash-screen.dart';
import 'package:moviemax/UI/widgets/text-widget.dart';
import '../controller/movie-controller.dart';


class LandPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LandPage({super.key});



  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider=Provider.of<MovieProvider>(context,listen: false);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const MyText(
          text: 'Movie-Max',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
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
              child: Center(
                child: MyText(
                  text: "Profile",
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.red,
              ),
              title: const MyText(
                text: 'Settings',
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              onTap: () {
                // Handle settings tap
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const MyText(
                text: 'Logout',
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              onTap: () {
                // Handle logout tap
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          if (movieProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                  text: 'Popular',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                FutureBuilder(
                  future: movieProvider.fetchMovies(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return CarouselSlider.builder(
                      itemCount: movieProvider.popularMovies.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.4,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                      itemBuilder: (context, index, realIndex) {
                        final movie = movieProvider.popularMovies[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  fontSize: 15,
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FutureBuilder(
                    future: movieProvider.fetchMovies(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieProvider.topRatedMovies.length,
                        itemBuilder: (context, index) {
                          final movie = movieProvider.topRatedMovies[index];
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
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                const MyText(
                  text: 'Movies',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FutureBuilder(
                    future: movieProvider.fetchMovies(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieProvider.moviesList.length,
                        itemBuilder: (context, index) {
                          final movie = movieProvider.moviesList[index];
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
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                const MyText(
                  text: 'Tv Series',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FutureBuilder(
                    future: movieProvider.fetchMovies(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movieProvider.tvSeries.length,
                        itemBuilder: (context, index) {
                          final movie = movieProvider.tvSeries[index];
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
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
