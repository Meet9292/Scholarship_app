import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/country_page.dart';
import 'package:scholarship_app/course_page.dart';
import 'package:scholarship_app/data_model.dart';
import 'package:scholarship_app/jindalscholarship.dart';
import 'package:scholarship_app/main.dart';
import 'package:scholarship_app/university.dart';
import 'my_horizontal_list.dart';
import 'my_vertical_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const SizedBox(
              height: 22,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            GestureDetector(

              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen_j() ));},
              child: SizedBox(
                height: 349,
                child: ListView.builder(
                  itemCount: NewsData1.data.length,
                  itemBuilder: (context, index) {
                    return const HorizontalList(
                      startColor: 0xFF9288E4,
                      endColor: 0xFF534EA7,
                      courseImage: 'assets/Saly-10.png',
                      courseHeadLine: "HeadLine",
                      courseTitle: "Post Matric Scholarship \nfor SC/ST/OBC Students",
                      ellipseColor: 'assets/Ellipse_1.png',
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ),

            const SizedBox(
              height: 22,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryPages() ));},
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const MyVerticalList(
                      scholarshipImage: 'assets/download (2).png',
                      scholarshipTitle: 'Country',
                      scholarshipDuration: ' ');
                },
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
              ),
            ),

            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const CoursePage() ));},
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const MyVerticalList(
                      scholarshipImage: 'assets/download (3).png',
                      scholarshipTitle: 'Course',
                      scholarshipDuration: '  ');
                },
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
              ),
            ),

            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const UPage() ));},
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const MyVerticalList(
                      scholarshipImage: 'assets/download.png',
                      scholarshipTitle: 'University',
                      scholarshipDuration: '  ');
                },
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}