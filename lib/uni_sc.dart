import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'list_tile.dart';

class uni extends StatefulWidget {
  const uni({super.key});

  @override
  State<uni> createState() => _uniState();
}

class _uniState extends State<uni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Filtered Scholarship"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 10; i < 15 && i < NewsData.scholarship_data.length; i++)
      NewsListTile(NewsData.scholarship_data[i])
            ],
          ),
        ),
      ),
    );
  }
}
