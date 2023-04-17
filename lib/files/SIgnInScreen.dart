// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:scholarship_app/main.dart';
// import 'colors_utils.dart';
// //import 'package:flutter_application_2/screens/SignUpScreen.dart';

// import 'SignUpScreen.dart';
// import 'home_screen.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   var auth = FirebaseAuth.instance;
//   var isLogin = false;

//   checkiflogin() async {
//     auth.authStateChanges().listen((User? user) {
//       if (user != null && mounted) {
//         setState(() {
//           isLogin = true;
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     checkiflogin();
//     super.initState();
//   }

//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: true,
//       // ),
//       body: Container(
//         // decoration: BoxDecoration(
//         //   gradient: LinearGradient(
//         //     colors: [
//         //       hexStringToColor("CB2B93"),
//         //       hexStringToColor("9546C4"),
//         //       hexStringToColor("5E61F4")
//         //     ],
//         //     begin: Alignment.topCenter,
//         //     end: Alignment.bottomCenter,
//         //   ),
//         // ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Add your image here
//             // Image.network(
//             //   'https://picsum.photos/400/600',
//             //   fit: BoxFit.cover,
//             // ),
//             // Add your sign-in UI elements here
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       prefixIcon: Icon(Icons.email),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     final email = _emailController.text;
//                     final password = _passwordController.text;
//                     print('Email: $email');
//                     print('Password: $password');
//                     FirebaseAuth.instance
//                         .signInWithEmailAndPassword(
//                             email: _emailController.text,
//                             password: _passwordController.text)
//                         .then((value) {
//                       if (isLogin) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MyScheme()),
//                         ).onError((error, stackTrace) {
//                           print(error);
//                         });
//                       } else {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignInScreen()),
//                         ).onError((error, stackTrace) {
//                           print(error);
//                         });
//                       }
//                       //       Navigator.push(context,
//                       //             MaterialPageRoute(builder: (context) => MyScheme()),
//                       // ).onError((error, stackTrace) {
//                       //   print(error);
//                       // });
//                     });
//                   },
//                   child: const Text('Sign In'),
//                 ),
//                 const SizedBox(height: 20.0),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to SignUpScreen
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreen()),
//                     );
//                   },
//                   child: const Text(
//                     'Don\'t have an account? Sign Up',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
