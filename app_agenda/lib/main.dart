import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/bloqueados_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/bloqueados': (context) => const BloqueadosScreen(),
        // Futuras rotas:
        // '/configuracoes': (context) => const ConfiguracoesScreen(),
        // '/favoritos': (context) => const FavoritosScreen(),
      },
    );
  }
}
