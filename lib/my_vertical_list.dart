import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/country_page.dart';
import 'package:scholarship_app/course_page.dart';

class MyVerticalList extends StatelessWidget {
  const MyVerticalList(
      {super.key,
      required this.scholarshipImage,
      required this.scholarshipTitle,
      required this.scholarshipDuration});

  final String scholarshipImage, scholarshipTitle, scholarshipDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 134,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              // child: TextButton(onPressed: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => CountryPages()),
              //     );
              // }, child: Text("                                                                                                                                                                                        ")),
              height: 92,
              width: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width * 0.03,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff3E3A6D),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 13,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, bottom: 19),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Container(
                        height: 80,
                        width: 115,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffFFB4B4),
                          image: DecorationImage(
                              image: AssetImage(scholarshipImage)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 55),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          scholarshipTitle,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          scholarshipDuration,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff9C9A9A),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
