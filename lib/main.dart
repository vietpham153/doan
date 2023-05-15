import 'package:flutter/material.dart';
import 'package:flutter_application_1/users/quanlydangnhap/login_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'doctorship',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          builder: (context, datasnapshot) {
            return LoginScreen();
          },
        ));
  }
}
