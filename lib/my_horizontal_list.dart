// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HorizontalList extends StatelessWidget {
  const HorizontalList(
      {Key? key,
      required this.courseImage,
      required this.courseHeadLine,
      required this.courseTitle,
      required this.endColor,
      required this.startColor,
      required this.ellipseColor})
      : super(key: key);
  final int startColor, endColor;
  final String courseHeadLine, courseTitle, courseImage, ellipseColor;
  // const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 26,
      ),
      child: Container(
        width: 246,
        height: 349,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(1, 0.0),
            colors: <Color>[
              Color(startColor),
              Color(endColor),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 11,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 39,
                  decoration: BoxDecoration(
                    color: const Color(0xFFAFA8EE),
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Text(
                    "Recommended",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )),
            ),
            Positioned(
              top: 80,
              left: 14,
              child: Text(
                courseTitle,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 85),
                child: Image.asset(
                  ellipseColor,
                  alignment: Alignment(1.0, 1.0),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              child: Image.asset(
                alignment: Alignment(1.0, 1.0),
                courseImage,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}