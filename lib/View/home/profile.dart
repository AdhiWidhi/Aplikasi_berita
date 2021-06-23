import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

bool _light = true;
ThemeData _dark =
    ThemeData(accentColor: Colors.red, brightness: Brightness.dark, primaryColor: Colors.amber);
ThemeData _lighttheme =
    ThemeData(accentColor: Colors.pink, brightness: Brightness.light, primaryColor: Colors.blue);

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lighttheme : _dark,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pro',
                style: TextStyle(color: Colors.orange),
              ),
              Text(
                'file',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          elevation: 2,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.person_sharp,
                  color: Colors.blue,
                ),
                title: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {}),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "General Settings",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  )),
              ListTile(
                leading: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.orange,
                ),
                title: Text(
                  "Bookmark",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {}),
              ),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.brightness_5_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Dark Mode",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: Switch(
                      value: _light,
                      onChanged: (state) {
                        setState(() {
                          _light = state;
                        });
                      })),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: Switch(
                      value: _light,
                      onChanged: (state) {
                        setState(() {
                          _light = state;
                        });
                      })),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.perm_phone_msg_outlined,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Contact Us",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.public_outlined,
                    color: Colors.green,
                  ),
                  title: Text(
                    "Languages",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.star_border_outlined,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Rate This App",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.attach_file_outlined,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    "License",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.lock_outlined,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Privacy Police",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.lightGreen,
                  ),
                  title: Text(
                    "About Us",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
