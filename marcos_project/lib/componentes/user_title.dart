import 'dart:html';

import 'package:flutter/material.dart';
import 'package:marcos_project/models/user.dart';
import 'package:marcos_project/provider/users.dart';
import 'package:marcos_project/routes/app_routes.dart';
import 'package:provider/provider.dart';

class Usertitle extends StatelessWidget {
  final User user;
  final _Form = GlobalKey<FormState>(); //metodo de validação
  final Map<String, String> _formData = {};

  Usertitle(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          ); //Codigo para definer se vai usar com ou sem avatar passado pelo usuario
    return ListTile(
      //listTitle moca todos os dados dos usuarios a serem passados
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                // para editar dados
                showDialog(
                  context: context,
                  builder: (_) => _customDialog(
                      context: context,
                      id: user.id,
                      name: user.name,
                      email: user.email,
                      avatarUrl: user.avatarUrl),
                );
              },
              color: Colors.amber,
              icon: Icon(
                Icons.edit,
              ),
            ),
            IconButton(
              onPressed: () {
                Provider.of<Users>(context, listen: false).remove(user);
              },
              color: Colors.red,
              icon: Icon(
                Icons.delete,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customDialog(

      // para editar dados
      {required BuildContext context,
      required String id,
      required String name,
      required String email,
      required String avatarUrl}) {
    return AlertDialog(
      title: Text('Editar usuario'),
      content: Form(
        key: _Form,
        child: Column(
          children: [
            TextFormField(
              initialValue: name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo incorreto';
                }
                return null;
              },
              onSaved: (value) => _formData['name'] = value.toString(),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                labelText: 'Nome',
                hintText: 'Seu nome completo',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            TextFormField(
              initialValue: email,
              onSaved: (value) => _formData['email'] = value.toString(),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                labelText: 'Email',
                hintText: 'Ex: highPower@gmail.com.br',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            TextFormField(
              initialValue: avatarUrl,
              onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                labelText: 'Avatar',
                hintText: 'Linkin para avatar',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  tooltip: 'Salvar',
                  onPressed: () {
                    final isValid = _Form.currentState!.validate();

                    if (isValid && user != null) {
                      _Form.currentState!.save();
                      Provider.of<Users>(context, listen: false).put(
                        User(
                          id: _formData['id']='',
                          name: _formData['name'].toString(),
                          email: _formData['email'].toString(),
                          avatarUrl: _formData['avatarUrl'].toString()
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  icon: Icon(Icons.save),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
