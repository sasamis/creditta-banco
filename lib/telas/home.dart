import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _saldoVisivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradiente de fundo
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
            const SizedBox(height: 30), // Reduzi o espaçamento
            // Linha com ícone de perfil e ícones estáticos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Reduzi o padding
              child: Row(
                children: [
                  // Ícone de perfil
                  CircleAvatar(
                    radius: 22, 
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 13, 71, 161),
                      size: 26,
                    ),
                  ),
                  const Spacer(),
                  // Ícones estáticos
                  Icon(Icons.notifications, color: Colors.white, size: 22), // Reduzi o tamanho
                  const SizedBox(width: 10), // Reduzi o espaçamento
                  Icon(Icons.settings, color: Colors.white, size: 22), // Reduzi o tamanho
                ],
              ),
            ),
            const SizedBox(height: 16), 
            // Cartão fictício centralizado no topo
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 340,
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Banco Creditta',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 13, 71, 161),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Agência: 0001  Conta: 12345-6',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _saldoVisivel ? 'Saldo: R\$ 12.345,67' : 'Saldo: ••••••••',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _saldoVisivel ? Icons.visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _saldoVisivel = !_saldoVisivel;
                                });
                              },
                            ),
                          ],
                        ),
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
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        child: SizedBox(
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.swap_horiz, size: 40, color: Colors.blue),
                              SizedBox(height: 8),
                              Text('Transferências', style: TextStyle(fontSize: 16)),
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
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
            const Spacer(),
            // Rodapé institucional
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                '© 2025 Banco Creditta • Segurança e confiança para você',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}