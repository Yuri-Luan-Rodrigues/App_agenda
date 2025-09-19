class ContatoEntity {
  String nome;
  String telefone;
  String email;
  bool bloqueado;

  ContatoEntity({
    required this.nome,
    required this.telefone,
    required this.email,
    this.bloqueado = false,
  });
}
