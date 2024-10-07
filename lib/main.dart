import 'package:flutter/material.dart';
import 'package:pcs5practice4/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Музыкальные плейлисты',
        theme: ThemeData(),
        home: const HomePage()
    );
  }
}