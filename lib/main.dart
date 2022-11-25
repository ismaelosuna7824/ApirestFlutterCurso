import 'package:cursoapp/pages/listPage.dart';
import 'package:cursoapp/pages/tabs/tabs.dart';
import 'package:cursoapp/pages/userPage.dart';
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ListPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListPage(),
        '/user': (context) => const UserPage(),
        '/tabs': (context) => const TabsHome()
      },
    );
  }
}
