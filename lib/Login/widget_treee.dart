import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_aplikasi/View/home/dashboard.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
import 'loginpage.dart';

class WidgetTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      return LoginPage();
    }
    return Dashboard();
  }
}
