class User {
  String nome;
  String email;
  String password;
  String? nationality; // Opcional
  String? birthdate; // Opcional
  String? profileImage; // Caminho da foto

  User({
    required this.nome,
    required this.email,
    required this.password,
    this.nationality,
    this.birthdate,
    this.profileImage,
  });
}
