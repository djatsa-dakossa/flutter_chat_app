import 'package:chatapp/views/verificationPage/VerificationPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:select_form_field/select_form_field.dart';

class InputPhonePage extends StatefulWidget {
  const InputPhonePage({Key key}) : super(key: key);

  @override
  State<InputPhonePage> createState() => _InputPhonePage();
}

class _InputPhonePage extends State<InputPhonePage> {
  String _initPhonenumber = '00237';
  final phonenumberController = TextEditingController();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<Map<String, dynamic>> _countries = [
    {
      'value': 'cameroon',
      'label': 'Cameroon',
      'phoneCode': '00237',
      'icon': Container(
        child: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/1280px-Flag_of_Cameroon.svg.png'),
          backgroundColor: Colors.transparent,
        ),
        margin: EdgeInsets.all(5),
      ),
    },
    {
      'value': 'gabon',
      'label': 'Gabon',
      'phoneCode': '00241',
      'icon': Container(
        child: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Flag_of_Gabon.svg/1000px-Flag_of_Gabon.svg.png'),
          backgroundColor: Colors.transparent,
        ),
        margin: EdgeInsets.all(5),
      ),
    },
    {
      'value': 'congo',
      'label': 'Congo',
      'phoneCode': '00243',
      // 'icon': Container(
      //   height: 20,
      //   width: 20,
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: Colors.green,
      //   ),
      //   child: Image.network('https://picsum.photos/250?image=9'),
      //   alignment: Alignment.center,
      //   margin: EdgeInsets.all(5),
      // ),
      'icon': Container(
        child: CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/2560px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png'),
          backgroundColor: Colors.transparent,
        ),
        margin: EdgeInsets.all(5),
      ),
    },
  ];

  void _onChangeCountry(String country) {
    _countries.forEach((element) {
      if (element['value'] == country) {
        print("element====> $element");
        setState(() {
          _initPhonenumber = element['phoneCode'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Container(),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      child: SelectFormField(
                        type: SelectFormFieldType.dropdown, // or can be dialog
                        initialValue: 'circle',
                        labelText: 'Country',
                        items: _countries,
                        onChanged: (val) => _onChangeCountry(val),
                        onSaved: (val) => _onChangeCountry(val),
                        // decoration: InputDecoration(
                        //   border: InputBorder.none,
                        // ),
                        decoration: InputDecoration(
                          hintText: "Cameroon",
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.place,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Phone number",
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: phonenumberController
                          ..text = _initPhonenumber,
                      ),
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                    ),
                  ],
                )
                // child: SelectFormField(
                //   type: SelectFormFieldType.dropdown, // or can be dialog
                //   initialValue: 'circle',
                //   icon: Icon(
                //     Icons.phone,
                //     color: Colors.blue,
                //   ),
                //   labelText: 'Shape',
                //   items: _countries,
                //   onChanged: (val) => print(val),
                //   onSaved: (val) => print(val),
                //   // decoration: InputDecoration(
                //   //     border: InputBorder.none,),
                // ),

                ),
            // decoration: BoxDecoration(color: Colors.red),
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
                    Navigator.pushNamed(context, VerificationPage.routeName,
                        arguments:
                            ScreenArguments('${phonenumberController.text}'));
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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  // decoration: BoxDecoration(color: Colors.red),
                  child: Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationScreenArguments {
  final String phone;

  VerificationScreenArguments(this.phone);
}
