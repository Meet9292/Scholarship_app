import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_app/f_main.dart';
import 'package:scholarship_app/homescreen.dart';
import 'drawer_header.dart';
import 'data.dart';
import 'list_tile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'sc_project/login.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xff29274f),
//       ),
//       home: HomePage(),
//     );
//   }
// }


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
              title: 'Firebase EMail Password Auth',
              theme: ThemeData(
                primaryColor: const Color(0xff29274f),
              ),
              debugShowCheckedModeBanner: false,
              home: FutureBuilder(builder:
                  (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == false) {
                  return Login();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      color: Colors.white,
                      child: const Center(child: CircularProgressIndicator()));
                }
                return HomePage();
              }));
        });
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.profile;
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.profile) {
      container = HomeScreen();
    } else if (currentPage == DrawerSections.blog) {
      container = MyHomePage();
    } else if (currentPage == DrawerSections.scholarship) {
      container = MyScheme();
    } else if (currentPage == DrawerSections.login) {
      container = Login();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Scholarship Portal"),
            IconButton(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                await storage.delete(key: "uid"),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false)
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.profile ? true : false),
          Divider(),
          menuItem(2, "Blog", Icons.people_alt_outlined,
              currentPage == DrawerSections.blog ? true : false),
          Divider(),
          menuItem(3, "Scholarships", Icons.school,
              currentPage == DrawerSections.scholarship ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.profile;
            } else if (id == 2) {
              currentPage = DrawerSections.blog;
            } else if (id == 3) {
              currentPage = DrawerSections.scholarship;
            } else if (id == 3) {
              currentPage = DrawerSections.login;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { profile, blog, scholarship, login }

class MyScheme extends StatefulWidget {
  const MyScheme({super.key});

  @override
  State<MyScheme> createState() => _MySchemeState();
}

class _MySchemeState extends State<MyScheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Scholarships")),
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: NewsData.scholarship_data
                    .map((e) => NewsListTile(e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
