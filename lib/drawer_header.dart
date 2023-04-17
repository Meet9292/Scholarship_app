import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final email = FirebaseAuth.instance.currentUser?.email;
    final creationTime = FirebaseAuth.instance.currentUser?.metadata.creationTime;

    User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  const Color(0xff29274f),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/profile_icon.png'),
              ),
            ),
          ),
          Text(
            'User ID: $uid',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Email: $email',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}


