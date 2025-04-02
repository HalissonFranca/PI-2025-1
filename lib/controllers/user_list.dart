import 'package:flutter/material.dart';
import 'package:login_app/models/user.dart';
import 'package:login_app/controllers/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    List<User> users = userProvider.users;

    int userslength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
        leading: BackButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/LoginScreen");
          },
        ),
      ),
      body: ListView.builder(
        itemCount: userslength,
        itemBuilder:
            (BuildContext contextBuilder, indexBuilder) => Container(
              child: ListTile(title: Text(users[indexBuilder].nome)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.8)),
              ),
            ),
      ),
    );
  }
}
