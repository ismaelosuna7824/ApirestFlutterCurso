import 'package:flutter/material.dart';

import 'color_filter.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Column(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: const NetworkImage(
                        'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  const Text('Rick',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24))
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.all(16).copyWith(bottom: 0),
                  child: Text('Nombre')),
              const SizedBox(height: 10),
            ]),
          );
        });
  }
}
