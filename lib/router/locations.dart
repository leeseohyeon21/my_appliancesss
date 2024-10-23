import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_appliances/screens/start_screen.dart';
import '../screens/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState>{
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state){
    return [
      BeamPage(
        key: ValueKey('home'),
        child: StartScreen(),
        // child: HomeScreen(),
      ),
    ];
  }

  @override
  List<String> get pathPatterns => ['/'];
}