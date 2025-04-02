import 'package:flutter/material.dart';
import 'package:login_app/models/user.dart';
import 'package:login_app/controllers/user_provider.dart';
import 'package:login_app/views/field_forme.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      User user = User(
        nome: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      //instancia usuario
      userProvider.users.insert(0, user);

      int userslength = userProvider.users.length;
      //salva ususario na lista
      print(userProvider.users[0].nome);

      //navegar para lista de usuarios
      Navigator.popAndPushNamed(context, "/LoginScreen");
    }

    return Scaffold(
      appBar: AppBar(title: Text('Create User')),
      body: Center(
        child: Column(
          children: [
            FieldForme(
              label: 'Name',
              isPassword: false,
              controller: controllerName,
            ),
            FieldForme(
              label: 'Email',
              isPassword: false,
              controller: controllerEmail,
            ),
            FieldForme(
              label: 'senha',
              isPassword: true,
              controller: controllerPassword,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: save,
                child: Text('Salvar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
