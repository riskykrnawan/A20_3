import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'models/state_model.dart';
import 'package:provider/provider.dart';
import '/splash_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Acul Komputer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
          hintStyle: TextStyle(color: Colors.grey),
        )
        ),
      home: const SplashScreen(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: ((context) => AppStateModel()..loadProducts()),
      child: const MyApp(),
    ),
  );
}
