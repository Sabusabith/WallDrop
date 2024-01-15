import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/screens/home/home.dart';
import 'package:wall4k/screens/spage/detailPagesli.dart';
import 'package:wall4k/screens/spage/imageClipper.dart';

import 'animatePage.dart';
import 'moviedetails.dart';
import 'package:flutter/material.dart';




class HomeView extends StatefulWidget {
 

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  List<Movie> movies = [];
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    movies = rawData
        .map(
          (data) => Movie(
            title: data["title"],
            index: data["index"],
            image: data["image"],
          ),
        )
        .toList();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final reversedMovieList = movies.reversed.toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(extendBodyBehindAppBar: true,
        appBar: AppBar( leading: InkWell(
                onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                child: FadeInLeft(
                  from: 100,
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(seconds: 1),
                  child:Icon(Icons.arrow_back_ios_new_rounded,color: kiconcolor,)
                ),
              ),backgroundColor: Colors.transparent,),
        backgroundColor: kbgcolor,
        body: Stack(
          children: <Widget>[
            Stack(
              children: reversedMovieList.map((movie) {
                return ImageSlider(
                  pageValue: pageValue,
                  image: movie.image,
                  index: movie.index - 1,
                );
              }).toList(),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 0.8]),
              ),
            ),
            GestureDetector(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPagesLi(img: movies[currentIndex].image,)));
         
            },
              child: AnimatedPages(
                pageValue: pageValue,
                pageController: _pageController,
                pageCount: movies.length,
                onPageChangeCallback: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: (index, _) => MovieDetails(
                  movies[index],
                ),
              ),
            ),
            // const Positioned(
            //   bottom: 32.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: MovieButton(),
            // ),
          ],
        ),
      ),
    );
  }
}


class Movie {
  final String title;
  final String image;
  final int index;

  Movie({
    required this.title,
    required this.index,
    required this.image,
  });
}


List<Map<String, dynamic>> rawData = [
  {
    'title': 'For You Mehbii 💕',
    'image': 'assets/images/im/im1.jpg',
    'index': 1,
  },
  {
    'title': 'أحبك مهبي 💝',
    'image': 'assets/images/im/im3.JPG',
    'index': 2,
  },
  {
    'title': 'اميرتي👰🏻‍♀️',
    'image': 'assets/images/im/im4.jpg',
    'index': 3,
  },
  {
    'title': '🧕🏻🫠',
    'image': 'assets/images/im/im2.jpg',
    'index': 4,
  },
];




class ImageSlider extends StatelessWidget {
  final int index;
  final String image;
  final double pageValue;

  const ImageSlider({
    Key? key,
    required this.index,
    required this.image,
    required this.pageValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageClipper(progress: getProgress()),
      child: Image.asset(
        image,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  double getProgress() {
    if (index == pageValue.floor()) {
      return  1.0 - (pageValue - index);
    } else if (index < pageValue.floor()) {
      return 0.0;
    } else {
      return 1.0;
    }
  }
}