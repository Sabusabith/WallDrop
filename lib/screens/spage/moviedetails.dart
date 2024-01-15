import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/screens/spage/homeview.dart';



class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails(this.movie, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 330, 8.0, 0.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(
                0.08,
              ),
              blurRadius: 4.0),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              child: Image.asset(
                movie.image,
                height: 290,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            movie.title,
            style:  GoogleFonts.aBeeZee(color:Colors.black,fontSize:20,fontWeight:FontWeight.bold)
          ),
          SizedBox(
            height: 16.0,
          ),
        
        ],
      ),
    );
  }
}