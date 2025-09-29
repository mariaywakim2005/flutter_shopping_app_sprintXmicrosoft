import 'package:flutter/material.dart';
import 'package:my_phone/sign_in.dart';
import 'package:my_phone/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Shopping App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/girl.jpeg", width: 170),
                Image.network(
                  "https://img.freepik.com/free-vector/seasonal-sale-discounts-presents-purchase-visiting-boutiques-luxury-shopping-price-reduction-promotional-coupons-special-holiday-offers-vector-isolated-concept-metaphor-illustration_335657-2766.jpg?semt=ais_hybrid&w=740&q=80",
                  width: 170,
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: const Text("Sign up"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
              child: const Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}

































































// import 'package:flutter/material.dart';
// import 'package:my_phone/hero_page.dart';
// import 'package:my_phone/second_screen.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key, required this.title});

//   final String title;

//   @override
//   State<LoginPage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<LoginPage> {
//   bool hiddenPassword = true;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: Container(
//         width: 300,
//         color: const Color.fromARGB(255, 255, 255, 255),
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 5),
//                 Image.asset("assets/flutter.jpg"),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: emailController,
//                     validator: (value) {
//                       if (value != null && value.isEmpty) {
//                         return "Email too short";
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(labelText: "Email"),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: passController,
//                     obscureText: hiddenPassword,
//                     validator: (value) {
//                       if (value != null && value.length < 6) {
//                         return "Password too short";
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       suffixIcon: IconButton(
//                         onPressed: togglePassword,
//                         icon: Icon(
//                           hiddenPassword
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     debugPrint(emailController.text);
//                     debugPrint(passController.text);

//                     final form = _formKey.currentState;
//                     if (form != null && form.validate()) {
//                       // go to next screen
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const SecondScreen(),
//                         ),
//                       );
//                     } else {
//                       // show snackbar
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Form not valid")),
//                       );
//                     }
//                   },
//                   child: const Text("login"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void togglePassword() {
//     setState(() {
//       hiddenPassword = !hiddenPassword;
//     });
//   }

//   Future<void> myDialogue() async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Hello'),
//           content: const Text("Welcome to the app"),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Thanks'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


//   //////////////////////////////////////////////////////////////////////////////////////////
//   // bool isInitDesign = true;
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(),
//   //     body: Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           InkWell(
//   //             onTap: () {
//   //               setState(() {
//   //                 isInitDesign = !isInitDesign;
//   //               });
//   //             },
//   //             child: AnimatedContainer(
//   //               width: isInitDesign ? 300 : 150,
//   //               height: 100,
//   //               decoration: BoxDecoration(
//   //                 color: isInitDesign ? Colors.red : Colors.green,
//   //                 borderRadius: BorderRadius.circular(isInitDesign ? 20 : 0),
//   //               ),
//   //               duration: Duration(seconds: 1),
//   //               child: Center(
//   //                 child: isInitDesign
//   //                     ? Text(
//   //                         "Click here",
//   //                         style: TextStyle(color: Colors.white, fontSize: 30),
//   //                       )
//   //                     : CircularProgressIndicator(color: Colors.white),
//   //               ),
//   //             ),
//   //           ),
//   //           SizedBox(height: 10),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//   // ///////////////////////////////////////////////////////////////////////////
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(),
//   //     body: Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           GestureDetector(
//   //             onTap: () {
//   //               Navigator.push(
//   //                 context,
//   //                 MaterialPageRoute(builder: (context) => HeroTwo()),
//   //               );
//   //             },
//   //             child: Hero(
//   //               tag: "heroTest",
//   //               child: Icon(Icons.car_rental, size: 70),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

