import 'package:flutter/material.dart';
import '../models/contato_entity.dart';

class NovoCadastroScreen extends StatefulWidget {
  final ContatoEntity? contato;

  const NovoCadastroScreen({super.key, this.contato});

  @override
  State<NovoCadastroScreen> createState() => _NovoCadastroScreenState();
}

class _NovoCadastroScreenState extends State<NovoCadastroScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ContatoEntity contatoEntity;

  @override
  void initState() {
    super.initState();
    contatoEntity = widget.contato != null
        ? ContatoEntity(
            nome: widget.contato!.nome,
            email: widget.contato!.email,
            telefone: widget.contato!.telefone,
          )
        : ContatoEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cadastro de Contato'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: contatoEntity.nome,
                decoration: const InputDecoration(hintText: 'Nome'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
                onChanged: (value) => contatoEntity.nome = value,
              ),
              TextFormField(
                initialValue: contatoEntity.email,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
                onChanged: (value) => contatoEntity.email = value,
              ),
              TextFormField(
                initialValue: contatoEntity.telefone,
                decoration: const InputDecoration(hintText: 'Telefone'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obrigatório' : null,
                onChanged: (value) => contatoEntity.telefone = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, contatoEntity);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
