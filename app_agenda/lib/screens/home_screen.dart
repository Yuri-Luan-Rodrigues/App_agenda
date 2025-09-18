import 'package:flutter/material.dart';
import '../models/contato_entity.dart';
import '../screens/novo_cadastro_screen.dart';
import '../widgets/contato_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContatoEntity> contatos = [];

  void _novoContato({ContatoEntity? contatoExistente, int? index}) async {
    ContatoEntity? resultado = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NovoCadastroScreen(contato: contatoExistente),
      ),
    );

    if (resultado != null) {
      setState(() {
        if (contatoExistente != null && index != null) {
          contatos[index] = resultado;
        } else {
          contatos.add(resultado);
        }
        _ordenarContatos();
      });
    }
  }

  void _excluirContato(int index) {
    setState(() {
      contatos.removeAt(index);
    });
  }

  void _ordenarContatos() {
    contatos.sort(
      (a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Contatos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: Icon(Icons.account_circle_sharp, size: 70),
              accountName: Text('Yuri Luan'),
              accountEmail: Text('Yuri.rodrigues@detran.go.gov.br'),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Início')),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Contatos'),
            ),
            ListTile(leading: Icon(Icons.add), title: Text('Marcadores')),
            Divider(),
            ListTile(leading: Icon(Icons.block), title: Text('Bloqueados')),
          ],
        ),
      ),
      body: contatos.isEmpty
          ? const Center(child: Text('Nenhum contato cadastrado'))
          : ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                final contato = contatos[index];
                return ContatoTile(
                  contato: contato,
                  index: index,
                  onDelete: _excluirContato,
                  onEdit: (contato, index) {
                    _novoContato(contatoExistente: contato, index: index);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _novoContato(),
        tooltip: 'Adicionar Contato',
        child: const Icon(Icons.add),
      ),
    );
  }
}
