import 'package:flutter/material.dart';
import '../models/contato_entity.dart';

class ContatoTile extends StatelessWidget {
  final ContatoEntity contato;
  final int index;
  final Function(int) onDelete;
  final Function(ContatoEntity, int) onEdit;
  final Function(int) onToggleBloqueado;

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
    return ListTile(
      leading: Icon(
        contato.bloqueado ? Icons.block : Icons.person,
        color: contato.bloqueado ? Colors.red : null,
      ),
      title: Text(contato.nome),
      subtitle: Text('${contato.email}\n${contato.telefone}'),
      isThreeLine: true,
      onTap: () => onEdit(contato, index),
      trailing: Wrap(
        spacing: 8,
        children: [
          IconButton(
            icon: Icon(
              contato.bloqueado ? Icons.lock_open : Icons.lock,
              color: contato.bloqueado ? Colors.green : Colors.grey,
            ),
            tooltip: contato.bloqueado ? 'Desbloquear' : 'Bloquear',
            onPressed: () => onToggleBloqueado(index),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: 'Excluir',
            onPressed: () => onDelete(index),
          ),
        ],
      ),
    );
  }
}
