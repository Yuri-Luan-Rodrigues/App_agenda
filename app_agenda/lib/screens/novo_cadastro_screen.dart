import 'package:flutter/material.dart';
import '../models/contato_entity.dart';

class NovoCadastroScreen extends StatefulWidget {
  final ContatoEntity? contato;

  const NovoCadastroScreen({super.key, this.contato});

  @override
  State<NovoCadastroScreen> createState() => _NovoCadastroScreenState();
}

class _NovoCadastroScreenState extends State<NovoCadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _telefoneController;
  late TextEditingController _emailController;
  bool _bloqueado = false;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.contato?.nome ?? '');
    _telefoneController = TextEditingController(text: widget.contato?.telefone ?? '');
    _emailController = TextEditingController(text: widget.contato?.email ?? '');
    _bloqueado = widget.contato?.bloqueado ?? false;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _salvarContato() {
    if (_formKey.currentState!.validate()) {
      final novoContato = ContatoEntity(
        nome: _nomeController.text.trim(),
        telefone: _telefoneController.text.trim(),
        email: _emailController.text.trim(),
        bloqueado: _bloqueado,
      );
      Navigator.of(context).pop(novoContato);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contato == null ? 'Novo Contato' : 'Editar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo Nome
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo Telefone
              TextFormField(
                controller: _telefoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o telefone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo E-mail
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o e-mail';
                  }
                  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Switch Bloqueado
              SwitchListTile(
                title: const Text('Bloqueado'),
                value: _bloqueado,
                onChanged: (value) {
                  setState(() {
                    _bloqueado = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Botão Salvar
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.save),
                label: const Text('Salvar'),
                onPressed: _salvarContato,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
