import 'package:app_agenda/ContatoEntity.dart';
import 'package:app_agenda/NovoCadastroScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Agenda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ContatoEntity> contatos = <ContatoEntity>[];

  void _novoContato() async {
    ContatoEntity? contatoEntity = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const NovoCadastroScreen()));
    if (contatoEntity != null) {
      contatos.add(contatoEntity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Icon(Icons.account_circle_sharp, size: 70),
              accountName: Text('Yuri Luan'),
              accountEmail: Text('Yuri.rodrigues@detran.go.gov.br'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Contatos'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Marcadores'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.block),
              title: Text('Bloqueados'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _novoContato,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
