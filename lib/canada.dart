import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'list_tile.dart';

class canada_sc extends StatefulWidget {
  const canada_sc({super.key});

  @override
  State<canada_sc> createState() => _india_scState();
}

class _india_scState extends State<canada_sc> {
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
              for (int i = 5; i < 10 && i < NewsData.scholarship_data.length; i++)
      NewsListTile(NewsData.scholarship_data[i])
            ],
          ),
        ),
      ),
    );
  }
}
