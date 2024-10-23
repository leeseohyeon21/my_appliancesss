import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;

  IntroPage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('나의 가전',
              style: TextStyle(
                  fontSize: 30,
                  //fontFamily: 'DoHyeon',
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            ExtendedImage.asset('assets/images/temp.jpg'),
            Text('가전제품 기록 앱',
              //style: Theme.of(context).textTheme.headlineSmall,
              style: TextStyle(
                //color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            ),
            Text('가정내 가전제품을 기록해 두고 효과적으로 관리해봐요.',
              style: TextStyle(fontSize: 13),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                    onPressed: (){
                      controller.animateToPage(1, duration: Duration(milliseconds: 700), curve: Curves.easeOut);
                    },
                    child: Text('로그인하고 시작하기',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    //style: TextButton.styleFrom(
                    //  //backgroundColor: Colors.green),
                    //  backgroundColor: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
