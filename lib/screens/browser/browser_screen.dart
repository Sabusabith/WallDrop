import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wall4k/common/colors.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wall4k/controller/browser_controller.dart';

class BrowserScreen extends StatelessWidget {
 BrowserScreen({Key? key}) : super(key: key);

  late InAppWebViewController _webViewController;
  BrowserController browserController = Get.put(BrowserController());

  String initialUrl = "https://www.google.com/";

  TextEditingController searchController = TextEditingController();

  void loadUrl(String url) {
    _webViewController.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(  
      backgroundColor: kbgcolor,
      appBar: AppBar(toolbarHeight: 65,
      leading: FadeInLeft(from: 100,delay: Duration.zero,
        child: GestureDetector(onTap: () {
          searchController.clear();
          Get.back();
        },child: Icon(Icons.arrow_back_ios,color: kiconcolor,size: 25,)),
      ),
backgroundColor: kbgcolor,
title: Container(height: 40,
  child: FadeInRight(from: 100,delay: Duration(seconds: 0),
    child: TextField(
                    controller: searchController,
                  cursorColor: kiconcolor,
                    style: TextStyle(color: Colors.grey.shade300),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: kiconcolor.withOpacity(.6),
                      ),
                      hintText: "Search ...",
                      hintStyle: GoogleFonts.dmMono(
                          color: kiconcolor.withOpacity(.6), letterSpacing: 2),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: kiconcolor.withOpacity(.7)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: kiconcolor.withOpacity(.7)),
                      ),
                    ),
                    onSubmitted: (query) {
                      if (query.isNotEmpty) {
                          browserController.isLoading.value = true;
                        final searchUrl = "https://www.google.com/search?q=$query";
                        loadUrl(searchUrl);
                      }
                    },
                  ),
  ),
),
        actions: [
       
          FadeInRight(from: 100,delay: Duration.zero,
            child: IconButton(
              icon: Icon(CupertinoIcons.search,color: kiconcolor,size: 35,),
              onPressed: () {
                   // Load URL when the search icon is tapped
                final query = searchController.text;
                if (query.isNotEmpty) {
                       browserController.isLoading.value = true;
                  final searchUrl = "https://www.google.com/search?q=$query";
                  loadUrl(searchUrl);
                }}
            ),
          ),
          SizedBox(width: 5,),
        ],
      ),
      body: SafeArea(bottom: false,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child:browserController.isLoading.value?Center(
            child: SizedBox(
          width: 100,
          height: 30,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: [kiconcolor],
            strokeWidth: .1,
          ),
        )): InAppWebView(
            initialSettings: InAppWebViewSettings(
              supportZoom: false,
              verticalScrollBarEnabled: false,
              horizontalScrollBarEnabled: false,
            ),
            initialUrlRequest: URLRequest(url: WebUri(initialUrl)),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) {
                   browserController.isLoading.value = false;
            },
            onProgressChanged: (controller, progress) {},
          ),
        ),
      ),
    );
  }
}
