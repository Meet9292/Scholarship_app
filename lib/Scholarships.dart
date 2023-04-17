import 'package:flutter/material.dart';
import 'package:scholarship_app/main.dart';

class MyScholarship extends StatefulWidget {
  const MyScholarship({super.key});

  @override
  State<MyScholarship> createState() => _MyScholarshipState();
}

class _MyScholarshipState extends State<MyScholarship> {
  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // body: MyScheme(),
    );
  }
}
