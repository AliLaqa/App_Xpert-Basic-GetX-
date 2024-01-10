import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Views/HomeScreen.dart';

///TODO: Start from GetX Variables, was trying to change theme using GetX variables and it's theme changing propery
///Todo: Youtube Video Link : https://www.youtube.com/watch?v=sOZsWLijELE
///
/////First Learn how to use and change GetX variables then make App Theme changing function. --> Done

void main() {
  runApp(const MyApp());
}

///In this Project we are learning below GetX properties

// 1: SnackBar -->Done
// 2: DialogueBox --> Done
// 3: PageRouting --> Done
// 4: Controllers --> Done
// 5: GetX Variables --> Done
// 6: GetX StateManagement --> Done
// 7: GetX ChangeTheme --> Done

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
