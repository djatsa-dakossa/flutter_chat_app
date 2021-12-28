import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      child: Image(
                        image: AssetImage('assets/home_img.png'),
                      ),
                    ),
                    height: 300,
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                child: Text(
                  "Connect easily with your family and friends over countries",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Text(
                  "Terms & Privacy Policy",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              padding: EdgeInsets.all(20),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                  child: Text(
                    "Start Messaging",
                    style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/input_phone');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  ),
                ),
              ),
              padding: EdgeInsets.all(20),
            )
          ],
        ),
      ),
    );
  }
}
