import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_aplikasi/Login/homepage.dart';
import 'package:news_aplikasi/View/home/dashboard.dart';

import 'package:news_aplikasi/Widget/AppColors.dart';
import 'package:news_aplikasi/Widget/themebutton.dart';
import 'package:news_aplikasi/controller/authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> signInWithGoogle() async {
    await Authentification().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned.fill(
            child: Opacity(
                opacity: 0.3,
                child: Image.network(
                  "https://images.unsplash.com/photo-1600680116000-9b221d511bca?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                  fit: BoxFit.cover,
                )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ken',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold)),
                    Text('News',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange, fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 40),
                Text('Get Your News\nEvery Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 40),
                SizedBox(height: 40),
                ThemeButton(
                  label: 'Trial',
                  highlight: Colors.blue,
                  color: Color.fromARGB(250, 252, 84, 4),
                  onClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                ),
                ThemeButton(
                  label: "SignIn With Google",
                  labelColor: Color.fromARGB(250, 249, 178, 8),
                  color: Colors.transparent,
                  highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                  borderColor: AppColors.MAIN_COLOR,
                  borderWidth: 4,
                  onClick: () {
                    signInWithGoogle();
                  },
                ),
                SizedBox(height: 40),
                Text('Product By Adhi Widhi',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
