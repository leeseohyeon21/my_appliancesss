import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            ExtendedImage.asset('assets/images/temp.jpg'),
            Text('가전제품 기록 앱',
              style: TextStyle(
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
                    onPressed: (){},
                    child: Text('로그인하고 시작하기',
                    style: TextStyle(
                      color: Colors.white),
                    ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
