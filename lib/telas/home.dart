import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Ir para Cotação'),
              onPressed: () => Navigator.pushNamed(context, '/cotacao'),
            ),
            ElevatedButton(
              child: const Text('Ir para Transferência'),
              onPressed: () => Navigator.pushNamed(context, '/transferencia'),
            ),
          ],
        ),
      ),
    );
  }
}
