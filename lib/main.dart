import 'package:envio_gif/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Envio GIPHYs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeAppGifs(),
    );
  }
}
