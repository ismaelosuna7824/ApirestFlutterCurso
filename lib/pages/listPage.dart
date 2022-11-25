import 'dart:convert';

import 'package:cursoapp/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:cursoapp/widgets/listWidget.dart';

import '../models/userModel.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<User> list = [];
  bool _isLoading = true;
  _getUser() {
    ApiUser.getUser().then((response) {
      list = response;
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/user');
        },
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ))
          : ListWidget(list: list),
    );
  }
}
