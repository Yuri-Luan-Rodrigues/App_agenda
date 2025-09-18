import 'package:flutter/material.dart';

class BloqueadosScreen extends StatelessWidget {
  const BloqueadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos Bloqueados'),
      ),
      body: const Center(
        child: Text('Nenhum contato bloqueado ainda.'),
      ),
    );
  }
}
