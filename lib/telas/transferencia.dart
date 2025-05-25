import 'package:flutter/material.dart';

class Transferencia extends StatelessWidget {
  const Transferencia({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de transferências fictícias
    final List<Map<String, String>> transferencias = [
      {'nome': 'João Silva', 'valor': 'R\$ 150,00'},
      {'nome': 'Maria Souza', 'valor': 'R\$ 320,50'},
      {'nome': 'Carlos Lima', 'valor': 'R\$ 75,20'},
      {'nome': 'Ana Paula', 'valor': 'R\$ 1.200,00'},
      {'nome': 'Pedro Santos', 'valor': 'R\$ 50,00'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Transferência')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Banco Creditta', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Agência: 0001  Conta: 12345-6'),
                      SizedBox(height: 8),
                      Text('Saldo: R\$ 12.345,67', style: TextStyle(fontSize: 18, color: Colors.green)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Transferências Recentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              itemCount: transferencias.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final t = transferencias[index];
                return ListTile(
                  leading: const Icon(Icons.account_circle, size: 32),
                  title: Text(t['nome']!),
                  trailing: Text(
                    t['valor']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}