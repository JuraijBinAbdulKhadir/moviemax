import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexify/flexify.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ApiService apiService = ApiService();

  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> tvSeries;
  late Future<List<Movie>> moviesList;

  @override
  void initState() {
    popularMovies = apiService.getPopular();
    topRatedMovies = apiService.getTopRated();
    moviesList = apiService.getMovies();
    tvSeries = apiService.getTv();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff57686f),
        appBar: AppBar(
          // title: Image.asset(
          //   'assets/Image/Moviemax.png',
          //   height: 200.rh,
          // ),
          // centerTitle: true,
          backgroundColor: Color(0xff57686f),
          foregroundColor: Colors.white,
          leading: Image.asset(
            'assets/Image/grey.png',
            height: 400.rh,
            fit: BoxFit.cover,
          ),
          // leading: IconButton(
          //   onPressed: () {
          //     _scaffoldKey.currentState?.openDrawer();
          //   },
          //   icon: const Icon(Icons.menu),
          // ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.download_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          ],
        ),
        // drawer: Drawer(
        //   backgroundColor: Colors.grey,
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       DrawerHeader(
        //         decoration: const BoxDecoration(
        //           color: Colors.black,
        //         ),
        //         child: Center(
        //             child: Column(
        //           children: [
        //             SizedBox(
        //               width: 400.rw,
        //               height: 100.rh,
        //               child: Image.asset(
        //                 'assets/Image/Moviemax-logo.png',
        //                 fit: BoxFit.contain,
        //               ),
        //             ),
        //             const MyText(
        //               text: "Profile",
        //               color: Colors.red,
        //               fontWeight: FontWeight.normal,
        //               fontSize: 24,
        //             ),
        //           ],
        //         )),
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           Icons.settings,
        //           color: Colors.red,
        //         ),
        //         title: const MyText(
        //           text: 'Settings',
        //           color: Colors.black,
        //           fontWeight: FontWeight.normal,
        //           fontSize: 15,
        //         ),
        //         onTap: () {
        //           // Handle settings tap
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           Icons.logout,
        //           color: Colors.red,
        //         ),
        //         title: const MyText(
        //           text: 'Logout',
        //           color: Colors.black,
        //           fontWeight: FontWeight.normal,
        //           fontSize: 15,
        //         ),
        //         onTap: () {
        //           Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const SplashScreen()),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(
                      color: WidgetStatePropertyAll(Color(0xff57686f)),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      label: Text(
                        'tv-show',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    10.horizontalSpace,
                    Chip(
                        color: WidgetStatePropertyAll(Color(0xff57686f)),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(
                          'movie',
                          style: TextStyle(color: Colors.white),
                        )),
                    10.horizontalSpace,
                    Chip(
                        color: WidgetStatePropertyAll(Color(0xff57686f)),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(
                          'categories',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 35.rs),
                  child: Card(
                    elevation: 20,
                   
                    child: Container(
                      height: 500.rh,
                      width: 300.rw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/original/9l1eZiJHmhr5jIlthMdJN5WYoff.jpg'),
                              fit: BoxFit.cover)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,

                                  Colors.grey,

                            ])),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '#',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  ),
                                  MyText(
                                      text: "5 in Movies Today",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle button press here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.white,
                                      // Foreground (text) color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5), // Rounded corners
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.play_arrow_rounded),
                                        Text('Play'),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle button press here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xff57686f),
                                      // Foreground (text) color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5), // Rounded corners
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text('My List'),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                const MyText(
                    text: 'Popular',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                10.verticalSpace,
                FutureBuilder<List<Movie>>(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    // If the data is not yet available, show the shimmer effect
                    if (!snapshot.hasData) {
                      return Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[500]!,
                          child: Container(
                            height: 200.rh, // Adjust height as needed
                            width: double.infinity,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }

                    final movies = snapshot.data;

                    return CarouselSlider.builder(
                      itemCount: movies?.length ?? 0,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.4,
                        autoPlayInterval: const Duration(seconds: 15),
                      ),
                      itemBuilder: (context, index, movieIndex) {
                        final movie = movies![index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: 500.rh,
                            width: 200.rw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/original/${movie.backdrop}'),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Handle button press here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: Colors.white,
                                          // Foreground (text) color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                5), // Rounded corners
                                          ),
                                        ),
                                        child: const Text('Play'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Handle button press here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.transparent,
                                          // Foreground (text) color
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                5), // Rounded corners
                                          ),
                                        ),
                                        child: Icon(Icons.add_box),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                10.verticalSpace,
                const MyText(
                    text: 'Top-Rated',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                Container(
                  height: 200.rh,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FutureBuilder<List<Movie>>(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final movies = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies?.length ?? 0,
                        itemBuilder: (context, index) {
                          final movie = movies![index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 150.rw,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/original/${movie.backdrop}',
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[700]!,
                                  highlightColor: Colors.grey[500]!,
                                  child: Container(
                                    height: 120.rh,
                                    width: double.infinity,
                                    color: Colors.black,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                                height: 120.rh,
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
                    fontSize: 15),
                Container(
                  height: 200.rh,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FutureBuilder<List<Movie>>(
                    future: moviesList,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final movies = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies?.length ?? 0,
                        itemBuilder: (context, index) {
                          final movie = movies![index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 150.rw,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/original/${movie.backdrop}',
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[700]!,
                                  highlightColor: Colors.grey[500]!,
                                  child: Container(
                                    height: 120.rh,
                                    width: double.infinity,
                                    color: Colors.black,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                                height: 120.rh,
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
          ),
        ),
      ),
    );
  }
}
