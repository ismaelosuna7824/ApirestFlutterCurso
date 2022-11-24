import 'package:cursoapp/pages/tabs/tab1/characters.dart';
import 'package:flutter/material.dart';

class TabsHome extends StatefulWidget {
  const TabsHome({Key? key}) : super(key: key);

  @override
  State<TabsHome> createState() => _TabsHomeState();
}

class _TabsHomeState extends State<TabsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ]),
        ),
        body: const TabBarView(
          children: [
            CharacterPage(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
