import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marcos_project/data/dummy_users.dart';
import 'package:marcos_project/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...Dummy_USERS};

  List<User> get all {
    //retornar todos valores
    return [..._items.values];
  }

  int get count {
    //retornar total de elementos
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //Func put parar adicionar ou alterar
  void put(User user) {
    //caso os campos estejam vazios, nao ira adicionar
    if (user == null) {
      return null;
    }

    if (user.id != null && //metodo alterar
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
            id: user.id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl),
      );
    } else {
      //metodo adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl));
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
