import 'package:flutter/material.dart';
import '../models/contato_entity.dart';
import '../screens/detalhes_contato_screen.dart';

class ContatoTile extends StatelessWidget {
  final ContatoEntity contato;
  final int index;
  final void Function(int) onDelete;
  final void Function(ContatoEntity, int) onEdit;
  final void Function(int) onToggleBloqueado;

  const ContatoTile({
    super.key,
    required this.contato,
    required this.index,
    required this.onDelete,
    required this.onEdit,
    required this.onToggleBloqueado,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          contato.bloqueado ? Icons.block : Icons.account_circle,
          color: contato.bloqueado ? Colors.red : colorScheme.primary,
          size: 32,
        ),
        title: Text(contato.nome),
        subtitle: Text(contato.telefone),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesContatoScreen(contato: contato),
            ),
          );
        },
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'editar':
                onEdit(contato, index);
                break;
              case 'excluir':
                onDelete(index);
                break;
              case 'bloquear':
                onToggleBloqueado(index);
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'editar',
              child: Text('Editar'),
            ),
            const PopupMenuItem(
              value: 'excluir',
              child: Text('Excluir'),
            ),
            PopupMenuItem(
              value: 'bloquear',
              child: Text(contato.bloqueado ? 'Desbloquear' : 'Bloquear'),
            ),
          ],
        ),
      ),
    );
  }
}
