import 'package:apiproject/screenWithModel.dart';
import 'package:apiproject/screenWithoutModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API',
      theme: ThemeData(
        primaryColor: Color(0xff4538),
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScreenWithoutModel() ,
    );
  }
}
