import 'package:flutter/material.dart';
import 'package:login_app/controllers/user_provider.dart';
import 'package:login_app/models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;
    List<User> users = userProvider.users;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? foundUser = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => User(nome: "", email: "", password: ""),
    );

    if (foundUser.nome.isNotEmpty) {
      Navigator.pushReplacementNamed(
        context,
        "/settings",
        arguments: foundUser,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Usuário ou senha inválidos!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: Text("Entrar")),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/create");
              },
              child: Text("Cadastrar-se"),
            ),
          ],
        ),
      ),
    );
  }
}
