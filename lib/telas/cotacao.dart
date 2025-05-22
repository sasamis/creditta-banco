import 'package:flutter/material.dart';

class Cotacao extends StatelessWidget {
  const Cotacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cotação')),
      body: const Center(
        child: Text('Aqui vai a tela de Cotação'),
      ),
    );
  }
}
