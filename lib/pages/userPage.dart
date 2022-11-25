import 'dart:convert';

import 'package:cursoapp/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:cursoapp/providers/userProvider.dart';

class UserPage extends StatefulWidget {
  final User? user;
  const UserPage({Key? key, this.user}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _fomkey = GlobalKey<FormState>();
  int iduser = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.user?.name == null ? '' : widget.user!.name;
    lastNameController.text =
        widget.user?.lastname == null ? '' : widget.user!.lastname ?? '';

    iduser = widget.user?.id == null ? 0 : widget.user!.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
        leading: IconButton(
          onPressed: () => {Navigator.pushReplacementNamed(context, '/')},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: _fomkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your full name',
                  labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your full lastname',
                  labelText: 'lastname'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 60),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_fomkey.currentState!.validate()) {
                        if (iduser == 0) {
                          ApiUser.createUser(User(
                                  name: nameController.value.text,
                                  id: iduser,
                                  lastname: lastNameController.value.text))
                              .then((value) {
                            var resp = json.decode(value.body);
                            if (resp['status']) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackbar('user added successfully'));
                              Navigator.pushReplacementNamed(context, '/');
                            }
                          });
                        } else {
                          ApiUser.updateUser(User(
                                  name: nameController.value.text,
                                  id: iduser,
                                  lastname: lastNameController.value.text))
                              .then((value) {
                            var resp = json.decode(value.body);
                            if (resp['status']) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackbar('user updated successfully'));
                              Navigator.pushReplacementNamed(context, '/');
                            }
                          });
                        }
                        //print(nameController.value.text);
                      } else {
                        // print("faltan campos por llenar");
                        // print(nameController.value);
                      }
                    },
                    child: Text(iduser == 0 ? 'Guardar' : 'Actualizar'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  iduser != 0
                      ? ElevatedButton(
                          onPressed: () {
                            showAlertDialog(context, iduser);
                          },
                          child: const Text('Eliminar'))
                      : Container()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

SnackBar snackbar(String title) {
  return SnackBar(
    content: Text(title),
    action: SnackBarAction(
      label: 'dismiss',
      onPressed: () {},
    ),
  );
}

showAlertDialog(BuildContext context, int idUser) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: () {
      final data = {"id": idUser};
      //print(data);
      ApiUser.deleteUser(json.encode(data)).then((value) {
        var resp = json.decode(value.body);
        if (resp['status']) {
          ScaffoldMessenger.of(context)
              .showSnackBar(snackbar('user deleted successfully'));
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/');
        }
      });
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Warning"),
    content: const Text("Would you like to continue?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
