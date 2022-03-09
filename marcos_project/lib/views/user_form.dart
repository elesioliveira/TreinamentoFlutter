import 'package:flutter/material.dart';
import 'package:marcos_project/models/user.dart';
import 'package:marcos_project/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _Form = GlobalKey<FormState>(); //metodo de validação
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuario'),
        actions: [
          IconButton(
            onPressed: () {
              final isValid =
                  _Form.currentState!.validate(); //metodo de validação
              if (isValid) {
                _Form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    //metodo para adicionar um novo valor a lista
                    id: _formData['id'].toString(),
                    name: _formData['name'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatarUrl'].toString(),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _Form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
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
                initialValue: _formData['email'],
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
                initialValue: _formData['avatarUrl'],
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
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Cadastrar'),
        icon: const Icon(Icons.save),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
