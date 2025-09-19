import 'package:flutter/material.dart';
import '../models/contato_entity.dart';

class DetalhesContatoScreen extends StatelessWidget {
  final ContatoEntity contato;

  const DetalhesContatoScreen({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ícone do contato
            Center(
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),

            // Nome
            Text(
              contato.nome,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Telefone
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 8),
                Text(
                  contato.telefone,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // E-mail
            Row(
              children: [
                const Icon(Icons.email),
                const SizedBox(width: 8),
                Text(
                  contato.email,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Bloqueado
            Row(
              children: [
                Icon(
                  contato.bloqueado ? Icons.block : Icons.check_circle,
                  color: contato.bloqueado ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  contato.bloqueado ? 'Bloqueado' : 'Ativo',
                  style: TextStyle(
                    color: contato.bloqueado ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
