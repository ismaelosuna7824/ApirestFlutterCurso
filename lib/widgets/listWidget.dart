import 'dart:convert';

import 'package:cursoapp/pages/userPage.dart';
import 'package:cursoapp/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:cursoapp/models/userModel.dart';

class ListWidget extends StatelessWidget {
  final List<User> list;
  const ListWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 0,
          child: ListTile(
            //onTap: () => {print(list[index].id)},
            leading: const Icon(Icons.person),
            title: Text('${list[index].name} ${list[index].lastname}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPage(
                                    user: list[index],
                                  )));
                    },
                    icon: const Icon(Icons.edit)),
              ],
            ),
          ),
        );
      },
    );
  }
}
// ListTile(
//           title: Text('${list[index].name} ${list[index].lastname}'),
//           onTap: () => {print(list[index].id)},

