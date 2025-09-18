class ContatoEntity {
  String nome;
  String email;
  String telefone;
  bool bloqueado;

  ContatoEntity({
    this.nome = '',
    this.email = '',
    this.telefone = '',
    this.bloqueado = false,
  });
}
