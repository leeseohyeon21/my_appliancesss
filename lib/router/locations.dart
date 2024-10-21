import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import '../screens/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState>{
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state){
    return [
      BeamPage(
        key: ValueKey('home'),
        child: HomeScreen(),
      ),
    ];
  }

  @override
  List<String> get pathPatterns => ['/'];
}