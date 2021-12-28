import 'dart:io';

import 'package:chatapp/views/verificationPage/VerificationPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

ImagePicker picker = ImagePicker();

class Informationsinput extends StatefulWidget {
  Informationsinput({Key key, this.arguments}) : super(key: key);
  final ScreenArguments arguments;

  final codeInputController = TextEditingController();

  @override
  State<Informationsinput> createState() => _Informationsinput();
}

class _Informationsinput extends State<Informationsinput> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  var _image;
  var imagePicker;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image == null
                    ? NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/2560px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png')
                    : FileImage(_image),
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: -15,
                        right: -15,
                        child: MaterialButton(
                          onPressed: () async {
                            XFile image = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 50,
                            );
                            setState(() {
                              _image = File(image.path);
                            });
                          },
                          color: Colors.white,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.camera_enhance_outlined,
                            size: 20,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "last name ( required )",
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: firstnameController..text = "David",
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "First name ( required )",
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: lastnameController..text = "Djatsa",
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
                    "Save",
                    style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, "/home_contact",
                        arguments: VerificationScreenArguments(
                            '${firstnameController.text}',
                            '${lastnameController.text}'));
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
  final String firstname;
  final String lastname;

  VerificationScreenArguments(this.firstname, this.lastname);
}
