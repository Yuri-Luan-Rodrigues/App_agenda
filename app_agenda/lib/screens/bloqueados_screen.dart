import 'package:flutter/material.dart';
import '../models/contato_entity.dart';

class BloqueadosScreen extends StatelessWidget {
  final List<ContatoEntity> contatos;

  const BloqueadosScreen({super.key, required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos Bloqueados'),
      ),
      body: contatos.isEmpty
          ? const Center(child: Text('Nenhum contato bloqueado.'))
          : ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                final contato = contatos[index];
                return ListTile(
                  leading: const Icon(Icons.block, color: Colors.red),
                  title: Text(contato.nome),
                  subtitle: Text('${contato.email}\n${contato.telefone}'),
                  isThreeLine: true,
                );
              },
            ),
    );
  }
}
