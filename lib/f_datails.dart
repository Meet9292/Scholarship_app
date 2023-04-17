import 'package:flutter/material.dart';
// import 'package:passing_data/FruitDataModel.dart';
import 'f_data_model.dart';

class Detail extends StatelessWidget {
  final DataModel BlogDataModel;

  const Detail({Key? key, required this.BlogDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff29274f),
        title: Text(BlogDataModel.name),
      ),
      body: Column(
        children: [
          Image.network(BlogDataModel.ImageUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            BlogDataModel.desc,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
