import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          // Cartão fictício centralizado no topo
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
          // Opções em quadrados
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Área de Transferência
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/transferencia'),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.swap_horiz, size: 40, color: Colors.blue),
                            SizedBox(height: 8),
                            Text('Transferências',style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Área de Cotação
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/cotacao'),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.attach_money, size: 40, color: Colors.orange),
                            SizedBox(height: 8),
                            Text('Cotação', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Em breve...
                Expanded(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: SizedBox(
                      height: 120,
                      child: Center(
                        child: Text('Em breve...', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}