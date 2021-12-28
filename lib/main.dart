import 'package:chatapp/views/home/home_contact/home_contact.dart';
import 'package:chatapp/views/informations_input/informations_input.dart';
import 'package:chatapp/views/inputPhone/input_phone.dart';
import 'package:chatapp/views/verificationPage/VerificationPage.dart';
import 'package:chatapp/views/welcome/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      // home: WelcomePage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => WelcomePage(
              title: "Flutter Demo",
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/input_phone': (context) => InputPhonePage(),
        VerificationPage.routeName: (context) =>
            VerificationPage(ModalRoute.of(context).settings.arguments),
        '/informations_input': (context) => Informationsinput(),
        '/home_contact': (context) => HomeContact(),
      },
    );
  }
}
