import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  // const VerificationPage({Key key}) : super(key: key);

  final ScreenArguments arguments;

  final codeInputController = TextEditingController();

  VerificationPage(this.arguments);

  static const routeName = '/verification_page';

  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context).settings.arguments as ScreenArguments;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "enter code",
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
                    "We have sent you an SMS with the code to ${arguments.phone}",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
                child: PinCodeFields(
                  length: 4,
                  fieldBorderStyle: FieldBorderStyle.Square,
                  responsive: false,
                  fieldHeight: 40.0,
                  fieldWidth: 40.0,
                  borderWidth: 0,
                  activeBorderColor: Colors.pink,
                  activeBackgroundColor: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(50.0),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: false,
                  fieldBackgroundColor: Colors.black12,
                  borderColor: Colors.black38,
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    print(output);
                  },
                ),
                margin: EdgeInsets.all(20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Resend code",
                    style: GoogleFonts.nunito(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: Center(
                  child: ElevatedButton(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/informations_input');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(20),
              ),
            ],
          ),
        ));
  }
}

class ScreenArguments {
  final String phone;

  ScreenArguments(this.phone);
}
