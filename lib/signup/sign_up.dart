import 'package:counter_app/responsive_widget.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  var focusNodeEmail = new FocusNode();
  var focusNodePassword = new FocusNode();
  var focusNodeUserName = new FocusNode();

  String _name = "";
  String _genderImage = "images/doctor_male.webp";
  String _address = "";
  String _email = "";
  String _password = "";
  int radioSelection = 0;
  String country = "India";

  var leftMargin = 16.0;

  var isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          // check orientation using media query
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            leftMargin = MediaQuery.of(context).size.width * .05;
          } else {
            leftMargin = MediaQuery.of(context).size.width * 0.20;
          }
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg_login.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: buildPadding(context),
              ),
            )
          ]);
        },
      ),
    );
  }

  Padding buildPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftMargin, 80.0, leftMargin, 32.0),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildColumnOfForm(context),
        ),
      ),
    );
  }

  Column buildColumnOfForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'New Registration',
            style: TextStyle(
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 16
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 18
                        : 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        CircleAvatar(
          radius: ResponsiveWidget.isSmallScreen(context)
              ? 35
              : ResponsiveWidget.isMediumScreen(context)
                  ? 38
                  : 40,
          backgroundImage: AssetImage(_genderImage),
          backgroundColor: Colors.transparent,
        ),

        SizedBox(
          height: 16,
        ),
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            focusNode: focusNodeUserName,
            controller: _usernameController,
            validator: (name) {
              if (name.trim().isNotEmpty) {
                return null;
              } else {
                return "User name is empty";
              }
            },
            onFieldSubmitted: (_) {
              fieldFocusChange(context, focusNodeUserName, focusNodeEmail);
            },
            onSaved: (name) {
              this._name = name;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: -5),
              // labelText: 'Username',
              hintText: 'Name',
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 15
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 16
                          : 18),
              filled: true,
              fillColor: Colors.white70,
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
                borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
              ),
            ),
            style: TextStyle(
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 15
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 16
                        : 18,
                color: Colors.black)),
        SizedBox(
          height: 16.0,
        ),
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            focusNode: focusNodeEmail,
            controller: _emailController,
            validator: (email) {
              bool isEmailValid =
                  RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                      .hasMatch(email);
              if (isEmailValid) {
                return null;
              } else {
                return "Email is not valid";
              }
            },
            onFieldSubmitted: (_) {
              fieldFocusChange(context, focusNodeEmail, focusNodePassword);
            },
            onSaved: (email) {
              this._email = email;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: -5),
              // labelText: 'Username',
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              prefixIcon: Icon(
                Icons.email_rounded,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
                borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
              ),
            ),
            style: TextStyle(
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 15
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 16
                        : 18,
                color: Colors.black)),
        SizedBox(height: 12.0),
        TextFormField(
            textInputAction: TextInputAction.done,
            focusNode: focusNodePassword,
            controller: _passwordController,
            validator: (password) {
              if (password.trim().isEmpty) {
                return "Password is empty";
              } else {
                return null;
              }
            },
            onSaved: (password) {
              this._password = password;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: -5),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ),
                borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
              ),
            ),
            obscureText: true,
            style: TextStyle(
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 15
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 16
                        : 18,
                color: Colors.black)),
        SizedBox(height: 16.0),
        // radio button selection male or female
        Text(
          "Gender: ",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? 15
                : ResponsiveWidget.isMediumScreen(context)
                    ? 16
                    : 18,
          ),
        ),
        buildGenderRadioBtn(),
        SizedBox(height: 16.0),
        Text(
          "Country: ",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: ResponsiveWidget.isSmallScreen(context)
                ? 15
                : ResponsiveWidget.isMediumScreen(context)
                    ? 16
                    : 18,
          ),
        ),
        DropdownButton<String>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          isExpanded: true,
          value: country,
          items: <String>['India', 'USA', 'England', 'Australia']
              .map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                style: TextStyle(
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 15
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 16
                          : 18,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              this.country = value;
            });
          },
        ),
        SizedBox(
          height: 16,
        ),

        Row(
          children: [
            Text(
              "Subscription to our newsletter : ",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: ResponsiveWidget.isSmallScreen(context)
                    ? 15
                    : ResponsiveWidget.isMediumScreen(context)
                    ? 16
                    : 18,
              ),
            ),
            Switch(
              value: isSwitched,
              onChanged: (value){
                setState(() {
                  isSwitched=value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.deepPurpleAccent[100],
              activeColor: Colors.deepPurple,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          // width: 200,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.deepPurple)),
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveWidget.isSmallScreen(context)
                          ? 16
                          : ResponsiveWidget.isMediumScreen(context)
                              ? 18
                              : 20),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print("Email:- $_email");
                  print("Pass:- $_password");

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }

                /*  String email = _emailController.text;
                                String password = _passwordController.text;
                                bool isEmailValid = RegExp(
                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(email);
                                if (email.isEmpty || !isEmailValid) {
                                  showSnackBarMessage(
                                      "Email is not valid", context);
                                  focusNodeEmail.requestFocus();
                                } else if (password.isEmpty) {
                                  showSnackBarMessage(
                                      "Password is empty", context);
                                   focusNodePassword.requestFocus();
                                } else {

                                }*/
              }),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Row buildGenderRadioBtn() {
    return Row(
      children: [
        Flexible(
          child: ListTile(
            dense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            title: Text(
              'Male',
              style: TextStyle(fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? 15
                  : ResponsiveWidget.isMediumScreen(context)
                  ? 16
                  : 18,),
            ),
            leading: Radio(
                value: 0,
                groupValue: radioSelection,
                onChanged: (value) {
                  setState(() {
                    this.radioSelection = value;
                    this._genderImage = "images/doctor_male.webp";
                  });
                }),
          ),
        ),
        Flexible(
          child: ListTile(
            dense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            title: Text(
              'Female',
              style: TextStyle(fontSize: ResponsiveWidget.isSmallScreen(context)
                  ? 15
                  : ResponsiveWidget.isMediumScreen(context)
                  ? 16
                  : 18,

              ),
            ),
            leading: Radio(
                value: 1,
                groupValue: radioSelection,
                onChanged: (value) {
                  setState(() {
                    this.radioSelection = value;
                    this._genderImage = "images/dr_sample.jpg";
                  });
                }),
          ),
        ),
      ],
    );
  }

  void showSnackBarMessage(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
