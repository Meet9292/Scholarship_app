import 'package:flutter/material.dart';
import 'f_data_model.dart';
import 'f_datails.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> fruitname = ['National Merit Scholarship', 'Jack Kent Cooke Foundation Scholarship', 'Coca-Cola Scholars Program', 'Kishore Vaigyanik Protsahan Yojana (KVPY)', 'Sitaram Jindal Scholarship Scheme'];

  static List url = [
    'https://tse1.mm.bing.net/th?id=OIP.vhua-gM8OLU-JE_OsL0djgHaFr&pid=Api&P=0',
    'https://tse3.mm.bing.net/th?id=OIP.2Vt74Fz5HXt7lnBldmcg8wHaDr&pid=Api&P=0',
    'https://tse1.mm.bing.net/th?id=OIP.ROxnVBTuUTu6upe_mHt01gHaD9&pid=Api&P=0',
    'https://tse1.mm.bing.net/th?id=OIP.3nCWH-tmT-UngEQWaH2nBQHaFj&pid=Api&P=0',
    'https://tse1.mm.bing.net/th?id=OIP.tiMQLzTL4lbjvppHb7527gHaEK&pid=Api&P=0'
  ];

  final List<DataModel> data = List.generate(
      fruitname.length,
      (index) => DataModel('${fruitname[index]}', '${url[index]}',
          '${fruitname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Blogs...')),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              SizedBox(
                height: 10,
              );
              return SizedBox(
                height: 300,
                child: Card(
                  child: ListTile(
                    title: Text(
                    data[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25)
                    ),
                  subtitle: SizedBox(
                   width: 90,
                   height: 190,
                  child: Image.network(data[index].ImageUrl,
                          fit: BoxFit.cover,
                          ),
                        ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detail(
                                BlogDataModel: data[index],
                              )));
                    },
                  ),
                ),
              );
            }));
  }
}
