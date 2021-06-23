import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_aplikasi/Login/homepage.dart';
import 'package:news_aplikasi/View/Bookmark/bookmark_screen.dart';
import 'package:news_aplikasi/View/UploadView/upload_screen.dart';
import 'package:news_aplikasi/View/home/profile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentindex = 0;

  List menu = [
    Container(
      child: HomePage(),
    ),
    Container(
      child: UploadScreen(),
    ),
    Container(
      child: BookmarkScreen(),
    ),
    Container(
      child: Profile(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: menu[currentindex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentindex,
          onItemSelected: (index) {
            setState(() => currentindex = index);
          },
          items: [
            BottomNavyBarItem(
                icon: Icon(
                  Icons.my_library_books_outlined,
                ),
                title: Text('News'),
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.add_circle_outline_outlined),
                title: Text("Add"),
                activeColor: Colors.black,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.bookmark_border),
                title: Text('Bookmark'),
                activeColor: Colors.orange,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                activeColor: Colors.red,
                inactiveColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
