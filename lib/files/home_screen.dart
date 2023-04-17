// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'SignInScreen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut().then((value) {
//                 print("signed out");
//                  Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SignInScreen()),
//               );

//               });
              
             
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Center(
//         child: const Text('Welcome to the Home Screen'),
//       ),
//     );
//   }
// }
