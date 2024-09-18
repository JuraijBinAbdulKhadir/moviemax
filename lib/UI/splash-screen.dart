import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

import "land-page.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LandPage(),));
          },
        backgroundColor: Colors.white,
        child: const Icon(Icons.double_arrow,color: Colors.black,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Image/Moviemax.png'),
            SizedBox(
                height: 100,
                width: 200,
                child: Lottie.asset('assets/Animations/loading.json')),
          ],
        ),
      ),
    );
  }
}
