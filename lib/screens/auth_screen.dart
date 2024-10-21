import 'package:flutter/material.dart';
import 'package:my_appliances/start/intro_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(children: [
        IntroPage(),
        Container(color: Colors.accents[2],),
        Container(color: Colors.accents[5],),
      ],
      ),
    );
  }
}
