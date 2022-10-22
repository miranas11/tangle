import 'package:flutter/material.dart';
import 'package:tangle/presentation/config/app_router.dart';
import 'presentation/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
