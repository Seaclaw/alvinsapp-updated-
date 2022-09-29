import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_login/flutter_login.dart';

import 'package:flutter/cupertino.dart';
import 'package:rex_trading/loginscreen.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key})
      : super(key: key); //create a stateful widget called _onBoarding
  @override
  State<CreateAccount> createState() => _CreateState();
}

class _CreateState extends State<CreateAccount> {
  String _userEmail = '';
  String _firstName = '';
  String _surname = '';
  String _password = '';
  String _DOB = '';

  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  final controller = PageController();
  bool isLastPage = false; //set the variable isLastPage to false
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextEditingController dateCtl = TextEditingController();

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Registered successfully ');
      debugPrint(_userEmail);
      debugPrint(_firstName);
      debugPrint(_password);
      debugPrint(_surname);
      debugPrint(_DOB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Back'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ),
        body: Form(
            key: _formKey,
            child: Container(
              color: Colors.blue,
              child: ListView(shrinkWrap: true, children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome to Rex',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto Slab',
                        fontWeight: FontWeight.bold,
                        fontSize: 34),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      child: Text(
                        'Enter your details below to register for an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto Slab',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          autovalidateMode: AutovalidateMode.always,
                          autofocus: false,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintStyle: TextStyle(color: Colors.white),
                            helperText: ' ',
                            hintText: 'First Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          onSaved: (value) {},
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            // Return null if the entered username is valid
                            return null;
                          },
                          onChanged: (value) => _firstName = value,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintStyle: TextStyle(color: Colors.white),
                              helperText: ' ',
                              hintText: 'Surname',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required'; //if the field is empty, then return error message
                            }
                            // Return null if the entered username is valid
                            return null;
                          },
                          onChanged: (value) => _surname = value,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: Center(
                          child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: dateCtl,
                        autovalidateMode: AutovalidateMode.always,
                        autofocus: true,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintStyle: TextStyle(color: Colors.white),
                            helperText: ' ',
                            prefixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Date of Birth'),
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1940),
                            lastDate: DateTime.now(),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              dateCtl.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter date of birth'; //if the field is empty, then return error message
                          }
                          return null;
                        },
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          autofocus: true,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintStyle: TextStyle(color: Colors.white),
                              helperText: ' ',
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              )),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              //if the field is empty, then return error message
                              return 'This field is required';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Invalid email';
                            }
                            // Return null if the entered email is valid
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          autofocus: true,
                          obscureText: true,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintStyle: TextStyle(color: Colors.white),
                              helperText: ' ',
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.white,
                              )),
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              return 'Invalid password';
                            }
                            // Return null if the entered password is valid
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '• Minimum 1 uppercase',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                        Text(
                          '• Minimum 1 lowercase',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                        Text(
                          '• Minimum 1 number',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                        Text(
                          '• Minimum 1 special character',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SizedBox(
                    width: 30,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(color: Colors.white)))),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      onPressed: () =>
                          _trySubmitForm(), //once the button is pressed, activate the function _trySubmitForm
                    ),
                  ),
                ),
              ]),
            )));
  }
}
