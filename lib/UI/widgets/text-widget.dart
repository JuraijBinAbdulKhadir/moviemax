import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;


  const MyText({super.key, required this.text, required this.color, required this.fontWeight, required this.fontSize,});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(fontSize: fontSize,fontWeight: fontWeight,color: color),);
  }
}
