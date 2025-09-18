import 'package:flutter/material.dart';
import '../models/contato_entity.dart';

class ContatoTile extends StatelessWidget {
  final ContatoEntity contato;
  final int index;
  final Function(int) onDelete;
  final Function(ContatoEntity, int) onEdit;

  const ContatoTile({
    super.key,
    required this.contato,
    required this.index,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(contato.nome),
      subtitle: Text('${contato.email}\n${contato.telefone}'),
      isThreeLine: true,
      onTap: () => onEdit(contato, index),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () => onDelete(index),
      ),
    );
  }
}
