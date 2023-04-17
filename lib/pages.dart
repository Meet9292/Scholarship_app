import 'package:flutter/material.dart';

class parts {
  String title;
  String duration;
  Image image;

  parts({
    required this.title,
    required this.duration,
    required this.image,
  });
}

List<parts> list = [
  parts(
      title: "Country",
      duration: "abc",
      image: Image.asset('assets/india.png')),
  parts(
      title: "Country",
      duration: "xyz",
      image: Image.asset('assets/canadian.png')),
  parts(
      title: "Country",
      duration: "pqr",
      image: Image.asset('assets/Saly-36.png')),
];
