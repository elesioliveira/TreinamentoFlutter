import 'package:flutter/material.dart';
import 'package:marcos_project/componentes/user_title.dart';
import 'package:marcos_project/provider/users.dart';
import 'package:marcos_project/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
        context); //navega nos elementos fazendo a mudança qando notificada

    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            'Usuario',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white30,
              tooltip: 'Cadastrar',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => Usertitle(
            users.byIndex(i),
          ), // Listview que lista todos elementos em base do Provider
        ));
  }
}
