import 'package:clean_architecture/config/routes/routes.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
