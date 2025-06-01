import 'package:flutter/material.dart';

class Transferencia extends StatelessWidget {
  const Transferencia({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> transferencias = [
      {'nome': 'João Silva', 'valor': 'R\$ 150,00'},
      {'nome': 'Maria Souza', 'valor': 'R\$ 320,50'},
      {'nome': 'Carlos Lima', 'valor': 'R\$ 75,20'},
      {'nome': 'Ana Paula', 'valor': 'R\$ 1.200,00'},
      {'nome': 'Pedro Santos', 'valor': 'R\$ 50,00'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 13, 71, 161),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 13, 71, 161), Color.fromARGB(255, 66, 165, 245)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 320,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Banco Creditta',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 13, 71, 161),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Agência: 0001  Conta: 12345-6',
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Saldo: R\$ 12.345,67',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemCount: transferencias.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final t = transferencias[index];
                    return ListTile(
                      leading: const Icon(Icons.account_circle, size: 32, color: Color(0xFF0D47A1)),
                      title: Text(
                        t['nome']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        t['valor']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}