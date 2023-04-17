// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/material.dart';
// import 'package:scholarship_app/files/SIgnInScreen.dart';
// import 'colors_utils.dart';

// import 'home_screen.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   // var auth = FirebaseAuth.instance;
//   // var isLogin = false;

//   // checkiflogin() async {
//   //   auth.authStateChanges().listen((User? user) {
//   //     if (user != null && mounted) {
//   //       setState(() {
//   //         isLogin = true;
//   //       });
//   //     }
//   //   });
//   // }

//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               hexStringToColor("CB2B93"),
//               hexStringToColor("9546C4"),
//               hexStringToColor("5E61F4")
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Add your image here
//             // Image.network(
//             //   'https://picsum.photos/400/600',
//             //   fit: BoxFit.cover,
//             // ),
//             // Add your sign-up UI elements here
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       hintText: 'Name',
//                       prefixIcon: Icon(Icons.person),
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
//                     // Add your sign-up logic here
//                     final name = _nameController.text;
//                     final email = _emailController.text;
//                     final password = _passwordController.text;
//                     print('Name: $name');
//                     print('Email: $email');
//                     print('Password: $password');

//                     // Navigate to the home screen after successful sign-up

//                     FirebaseAuth.instance
//                         .createUserWithEmailAndPassword(
//                             email: _emailController.text,
//                             password: _passwordController.text)
//                         .then((value) {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignInScreen(),
//                         ),
//                       );
//                     }).onError((error, stackTrace) {
//                       print("error ${error.toString()}");
//                     });
//                   },
//                   child: const Text('Sign Up'),
//                 ),
//               ],
//             ),
//             Positioned(
//               bottom: 20.0,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text(
//                   'Already have an account? Sign In',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
