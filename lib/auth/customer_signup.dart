import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/auth_widgets.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({Key? key}) : super(key: key);

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const AuthHeaderLabel(headerLabel: 'Sign Up'),
                  Row(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.purpleAccent,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print("pick image from camera");
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.photo,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print("pick image from gallary");
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: textFormDecoration(
                          labelText: 'Full Name',
                          hintText: 'enter your full name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: textFormDecoration(
                          labelText: 'Email Address',
                          hintText: 'enter your email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      obscureText: passwordVisible,
                      decoration: textFormDecoration(
                          labelText: 'Password',
                          isPasswordView: true,
                          hintText: 'enter your password'),
                    ),
                  ),
                  HaveAccount(
                    haveAccount: 'already have account? ',
                    actionLabel: 'Log In',
                    onPressed: () {},
                  ),
                  AuthMainButton(
                    mainButtonLabel: 'Sign Up',
                    onPressed: () {},
                  )
                ],
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