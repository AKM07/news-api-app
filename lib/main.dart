import 'package:flutter/material.dart';
import 'package:mobile_skeleton/model/sqliteModel.dart';
import 'package:mobile_skeleton/pages/NewsPage.dart';
import 'package:mobile_skeleton/utils/injector.dart';

import 'constants/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();
  final bool isInitialized = await SkeletonDBModel().initializeDB();
  if (isInitialized) {
    runApp(MyApp());
  } else {
    debugPrint("fail to init db");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: NewsPage(),
      initialRoute: '/',
      routes: {
        '/home': (context) => NewsPage(),
      },
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(color: Color(Constants.appMainColor), elevation: 0),
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        accentColor: Color(0xFFe0e0e0),
        backgroundColor: Constants.appBackgroundColor,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
