import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall4k/common/colors.dart';
import 'package:wall4k/screens/home/home.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/images/wifi.png",
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "No Connection",
              style: GoogleFonts.dmMono(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Spacer(),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 0, 0, 0))),
                  onPressed: () {
                    checkConnection() async {
                      bool network = await internetCheck();

                      if (network) {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        
                      } else {
                        checkConnection();
                      }
                    }
                    checkConnection();
                  },
                  child: Text(
                    "Retry",
                    style: GoogleFonts.dmMono(
                        fontSize: 16,
                        color: Colors.grey.shade100,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

internetCheck() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
