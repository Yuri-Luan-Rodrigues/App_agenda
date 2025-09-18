import 'package:app_agenda/ContatoEntity.dart';
import 'package:flutter/material.dart';

class NovoCadastroScreen extends StatefulWidget {
  const NovoCadastroScreen({super.key});

  @override
  State<NovoCadastroScreen> createState() => _NovoCadastroScrennState();
}

class _NovoCadastroScrennState extends State<NovoCadastroScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ContatoEntity contatoEntity = ContatoEntity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Novo Cadastro'),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: contatoEntity.email,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: contatoEntity.telefone,
                decoration: const InputDecoration(hintText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pop(context, contatoEntity);

                    }
                    
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
