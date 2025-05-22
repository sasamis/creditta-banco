import 'package:flutter/material.dart';
import 'telas/login.dart';
import 'telas/home.dart';
import 'telas/cotacao.dart';
import 'telas/transferencia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Digital',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/cotacao': (context) => const Cotacao(),
        '/transferencia': (context) => const Transferencia(),
      },
    );
  }
}
