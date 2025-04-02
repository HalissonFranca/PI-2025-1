import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:login_app/controllers/user_provider.dart';
import 'package:login_app/models/user.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  TextEditingController nationalityController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  File? _image;
  late User currentUser;

  @override
  Widget build(BuildContext context) {
    // Acessando o UserProvider dentro do build
    final userProvider = UserProvider.of(context);
    if (userProvider != null && userProvider.users.isNotEmpty) {
      currentUser = userProvider.users.first; // Pegando o primeiro usuário
    }

    return Scaffold(
      appBar: AppBar(title: Text("Configurações do Usuário")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:
            currentUser == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    // Foto do usuário
                    _image != null
                        ? CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(_image!),
                        )
                        : CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person, size: 50),
                        ),
                    SizedBox(height: 10),
                    // Nome do usuário
                    Text(
                      currentUser.nome,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // E-mail do usuário
                    Text(
                      currentUser.email,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    // Botões de selecionar imagem
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () => _pickImage(ImageSource.camera),
                        ),
                        IconButton(
                          icon: Icon(Icons.image),
                          onPressed: () => _pickImage(ImageSource.gallery),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Campos de entrada
                    TextField(
                      controller: nationalityController,
                      decoration: InputDecoration(labelText: "Nacionalidade"),
                    ),
                    TextField(
                      controller: birthdateController,
                      decoration: InputDecoration(
                        labelText: "Data de Nascimento",
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: saveSettings,
                      child: Text("Salvar"),
                    ),
                  ],
                ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        currentUser.profileImage = _image!.path;
      });
    }
  }

  void saveSettings() {
    setState(() {
      currentUser.nationality = nationalityController.text;
      currentUser.birthdate = birthdateController.text;
      if (_image != null) {
        currentUser.profileImage = _image!.path;
      }
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Informações salvas com sucesso!")));
  }
}
