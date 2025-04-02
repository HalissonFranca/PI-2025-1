import 'package:flutter/material.dart';
import 'package:login_app/controllers/user_list.dart';
import 'package:login_app/controllers/user_provider.dart';
import 'package:login_app/views/home.dart';
import 'package:login_app/views/user_form.dart';
import 'package:login_app/views/user_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'Receitas',
        home: LoginScreen(),
        routes: {
          "/create": (_) => UserForm(),
          "/list": (_) => UserList(),
          "/LoginScreen": (_) => LoginScreen(),
          "/settings": (_) => UserSettings(),
        },
      ),
    );
  }
}
