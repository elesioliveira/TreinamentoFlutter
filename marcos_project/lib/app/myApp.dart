// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:marcos_project/data/dummy_users.dart';
import 'package:marcos_project/provider/users.dart';
import 'package:marcos_project/routes/app_routes.dart';
import 'package:marcos_project/views/user_form.dart';
import 'package:marcos_project/views/users_list.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //vai notificar quando algo ser alterado na lista
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'ProjectMarcos',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}

