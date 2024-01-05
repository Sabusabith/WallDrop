import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: kbgcolor,
    child: Center(child: Text('Comming Soon..',style: GoogleFonts.audiowide(color: kiconcolor,fontSize: 25,letterSpacing: 2),)),);
  }
}