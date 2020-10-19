import 'package:counter_app/home.dart';
import 'package:counter_app/signup/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPageState(),
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
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.deepPurple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class LoginPageState extends StatefulWidget {
  @override
  _LoginPageStateState createState() => _LoginPageStateState();
}

class _LoginPageStateState extends State<LoginPageState> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var focusNodeEmail = new FocusNode();
  var focusNodePassword = new FocusNode();
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  double deviceWidth = 0.0;
  double deviceHeight = 0.0;



  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Builder(
        builder: (context) => OrientationBuilder(
          builder: (context,orientation){
           return showPotraitLoginPage(orientation);
          },

        ),
      ),
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


  // show potrait login page layout
  Widget showPotraitLoginPage(orientation){
    return
      orientation == Orientation.portrait?
      Stack(
      children: [
        Container(
          color: Colors.deepPurple,
        ),
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 32.0),
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Image.asset(
                            'images/flutter_logo.png',
                            width: 150,
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: focusNodeEmail,
                          controller: _emailController,
                          validator: (email) {
                            bool isEmailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(email);
                            if (isEmailValid) {
                              return null;
                            } else {
                              return "Email is not valid";
                            }
                          },
                          onFieldSubmitted: (_) {
                            fieldFocusChange(
                                context, focusNodeEmail, focusNodePassword);
                          },
                          onSaved: (email) {
                            this._email = email;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: -5),
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
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1.0),
                            ),
                          ),
                        ),
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
                            contentPadding:
                            EdgeInsets.symmetric(vertical: -5),
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
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1.0),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 16.0),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                // decoration: TextDecoration.underline,
                                  color: Colors.deepPurple),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: double.infinity,
                          // width: 200,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side:
                                  BorderSide(color: Colors.deepPurple)),
                              color: Colors.deepPurple,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  print("Email:- $_email");
                                  print("Pass:- $_password");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage()));
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
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage()));
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ):
      // Landscape Mode page
      Stack(
        children: [
          Container(
            color: Colors.deepPurple,
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(96.0, 64.0, 96.0, 32.0),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Image.asset(
                              'images/flutter_logo.png',
                              width: 150,
                              height: 100,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: focusNodeEmail,
                            controller: _emailController,
                            validator: (email) {
                              bool isEmailValid = RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(email);
                              if (isEmailValid) {
                                return null;
                              } else {
                                return "Email is not valid";
                              }
                            },
                            onFieldSubmitted: (_) {
                              fieldFocusChange(
                                  context, focusNodeEmail, focusNodePassword);
                            },
                            onSaved: (email) {
                              this._email = email;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: -5),
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
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 1.0),
                              ),
                            ),
                          ),
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
                              contentPadding:
                              EdgeInsets.symmetric(vertical: -5),
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
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 1.0),
                              ),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 16.0),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                    color: Colors.deepPurple),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            // width: 200,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                    BorderSide(color: Colors.deepPurple)),
                                color: Colors.deepPurple,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    print("Email:- $_email");
                                    print("Pass:- $_password");

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage()));
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
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: FlatButton(
                              onPressed: () {
                                // TODO navigate to another page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpPage()));
                              },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

    ;
  }
}
