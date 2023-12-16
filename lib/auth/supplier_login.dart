// ignore_for_file: prefer_const_constructors


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/auth_widgets.dart';
import 'package:multi_store_app/widgets/snackbar.dart';

class SupplierLogin extends StatefulWidget {
  const SupplierLogin({Key? key}) : super(key: key);

  @override
  State<SupplierLogin> createState() => _SupplierLoginState();
}

class _SupplierLoginState extends State<SupplierLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  late String email;
  late String password;

  bool processing = false;
  bool passwordVisible = false;

  void logIn() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        _formKey.currentState!.reset();

        Navigator.pushReplacementNamed(context, '/supplier_home');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            processing = false;
          });
          MyMessageHandler()
              .showSnackBar(_scaffoldKey, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          setState(() {
            processing = false;
          });
          MyMessageHandler().showSnackBar(
              _scaffoldKey, 'Wrong password provided for that user.');
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler().showSnackBar(_scaffoldKey, 'please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeaderLabel(headerLabel: 'Log In'),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          // controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            } else if (value.isValidEmail() == false) {
                              return 'invalid email';
                            } else if (value.isValidEmail() == true) {
                              MyMessageHandler().showSnackBar(
                                  _scaffoldKey, 'your email is valid');
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFormDecoration(
                              labelText: 'Email Address',
                              hintText: 'enter your email'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          // controller: _passwordController,
                          obscureText: passwordVisible,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          decoration: textFormDecoration(
                              labelText: 'Password',
                              isPasswordView: true,
                              hintText: 'enter your password'),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          )),
                      HaveAccount(
                        haveAccount: 'Dont\'t Have Account? ',
                        actionLabel: 'Sign Up',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/supplier_signup');
                        },
                      ),
                      processing == true
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.purple,
                            ))
                          : AuthMainButton(
                              mainButtonLabel: 'Log In',
                              onPressed: () {
                                logIn();
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textFormDecoration(
      {required String labelText,
      required String hintText,
      bool isPasswordView = false}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: isPasswordView
          ? IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              icon: Icon(
                passwordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.purple,
              ))
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.purple, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
