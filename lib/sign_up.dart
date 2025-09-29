import 'package:flutter/material.dart';
import 'package:my_phone/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hiddenPassword = true;
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passContoller = TextEditingController();
  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController confirmContoller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Sign up page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.teal),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameContoller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter full name";
                          } else if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                            return "First letter must be Uppercase";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Full name",
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: emailContoller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter email";
                          } else if (!value.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: "Email"),
                      ),

                      TextFormField(
                        controller: passContoller,
                        obscureText: hiddenPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          } else if (value.length < 6) {
                            return 'At least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hiddenPassword = !hiddenPassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      TextFormField(
                        controller: confirmContoller,
                        obscureText: hiddenPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm your password";
                          } else if (value != passContoller.text) {
                            return "Passwords don't match";
                          }
                          return null;
                        },

                        decoration: InputDecoration(
                          labelText: "confirm password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              hiddenPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hiddenPassword = !hiddenPassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Account sign up successfully!",
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text("Sign up"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                createFadeRoute(const HomePage()),
                              );
                            },
                            child: const Text("Close"),
                          ),
                        ],
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

  Route createFadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500), // speed
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
