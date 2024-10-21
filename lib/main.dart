import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_appliances/router/locations.dart';
import 'package:my_appliances/screens/auth_screen.dart';
import 'package:my_appliances/screens/splash_screen.dart';
import 'screens/home_screen.dart';

final _routerDelegate = BeamerDelegate(
  //비머가드
  //pathPatterns: 방어하고 싶은 경로값, check: 조건 충족 여부
  guards: [BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {return true;},
      showPage: BeamPage(child: AuthScreen())
  )],

  locationBuilder: BeamerLocationBuilder(
      beamLocations: [HomeLocation()]
  )
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //퓨처 함수로 로딩구현
    return FutureBuilder<Object>(
      future: Future.delayed(Duration(seconds: 3), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 900),  //페이드인아웃 효과
          child: _splashLodingWidget(snapshot),   //스냅샷실행 위젯지정
        );
      }
    );
    // return MaterialApp(
    //   title: 'My Appliances',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: MyHomePage(),
    // );
  }
}

StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
  if(snapshot.hasError) {print('에러가 발생하였습니다.'); return Text('Error');}
  else if(snapshot.hasData) {return MyAppliances();}
  else{return SplashScreen();}
}

class MyAppliances extends StatelessWidget {
  const MyAppliances({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 가전'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[Text('Hello'), Text('Hello'), Text('Hello')],
        ),
      ),
    );
  }
}
