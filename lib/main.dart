import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_appliances/router/locations.dart';
import 'package:my_appliances/screens/start/auth_page.dart';
import 'package:my_appliances/screens/start_screen.dart';
import 'package:my_appliances/screens/splash_screen.dart';
import 'package:my_appliances/states/user_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

final _routerDelegate = BeamerDelegate(
  //비머가드
  //pathPatterns: 방어하고 싶은 경로값, check: 조건 충족 여부
  guards: [BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        final userState = context.read<UserProvider>().userState;
        print("User state: $userState");
        return userState;
        },
      showPage: BeamPage(child: StartScreen()))],

      locationBuilder: BeamerLocationBuilder(
          beamLocations: [HomeLocation()]
      )
);

void main() {
  Provider.debugCheckInvalidValueType = null;
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

  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if(snapshot.hasError) {print('에러가 발생하였습니다.'); return Text('Error');}
    else if(snapshot.hasData) {return MyAppliances();}
    else{return SplashScreen();}
  }
}

class MyAppliances extends StatelessWidget {
  const MyAppliances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context){
        return UserProvider();
      },
      child: MaterialApp.router(
        theme: ThemeData(
          hintColor: Colors.grey[350],
          fontFamily: 'DoHyeon',
          primarySwatch: Colors.green, //앱의 기본 색상
          primaryColor: Colors.green,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: Size(48, 48)
            ),
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontFamily: 'DoHyeon'),
              labelLarge: TextStyle(
                color: Colors.white),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w700),
            elevation: 2,
            actionsIconTheme: IconThemeData(color: Colors.black),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black38,
          )
        ),
        debugShowCheckedModeBanner: false,
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
