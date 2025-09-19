import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contato_entity.dart';
import '../screens/novo_cadastro_screen.dart';
import '../screens/bloqueados_screen.dart';
import '../widgets/contato_tile.dart';
import '../controllers/theme_controller.dart';

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

  void _alternarBloqueio(int index) {
    setState(() {
      contatos[index].bloqueado = !contatos[index].bloqueado;
    });
  }

  void _ordenarContatos() {
    contatos.sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Contatos'),
        actions: [
          Consumer<ThemeController>(
            builder: (context, themeController, _) {
              final isDark = themeController.themeMode == ThemeMode.dark;
              return IconButton(
                icon: Icon(
                  isDark ? Icons.wb_sunny : Icons.nightlight_round,
                ),
                tooltip: 'Alternar tema',
                onPressed: () {
                  themeController.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              currentAccountPicture: Icon(Icons.account_circle_sharp, size: 70),
              accountName: Text('Yuri Luan'),
              accountEmail: Text('Yuri.rodrigues@detran.go.gov.br'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Contatos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Bloqueados'),
              onTap: () {
                Navigator.pop(context);
                final bloqueados = contatos.where((c) => c.bloqueado).toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BloqueadosScreen(contatos: bloqueados),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                // Futuro: Navigator.pushNamed(context, '/configuracoes');
              },
            ),
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
                  onEdit: (contatoEditado, i) {
                    _novoContato(contatoExistente: contatoEditado, index: i);
                  },
                  onToggleBloqueado: _alternarBloqueio,
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
