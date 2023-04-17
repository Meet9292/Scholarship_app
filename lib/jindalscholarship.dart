import 'package:flutter/material.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen_j extends StatefulWidget {
  DetailsScreen_j({Key? key}) : super(key: key);
  // NewsData data;
  @override
  
  State<DetailsScreen_j> createState() => _DetailsScreen_jState();
}


class _DetailsScreen_jState extends State<DetailsScreen_j> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Post Matric Scholarship for SC/ST/OBC Students",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Hero(
              tag: "Post Matric Scholarship for SC/ST/OBC Students",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                    "https://tse4.mm.bing.net/th?id=OIP.cv8oioEtHrM2PYd6G0rDNwHaDe&pid=Api&P=0"),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
                "This scholarship is awarded to students from SC/ST/OBC communities who are pursuing post-matriculation courses at the college or university level."),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                String u = "https://scholarships.gov.in/";
                await launchUrl(Uri.parse(u));
              },
              child: Text("Website : https://scholarships.gov.in/"),
            ),
          ],
        ),
      ),
    );
  }
}
