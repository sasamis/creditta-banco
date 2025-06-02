import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Transferencia extends StatefulWidget {
  const Transferencia({super.key});

  @override
  State<Transferencia> createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  final List<Map<String, String>> transferencias = [
    {'nome': 'João Silva', 'valor': 'R\$ 150,00'},
    {'nome': 'Maria Souza', 'valor': 'R\$ 320,50'},
    {'nome': 'Carlos Lima', 'valor': 'R\$ 75,20'},
    {'nome': 'Ana Paula', 'valor': 'R\$ 1.200,00'},
    {'nome': 'Pedro Santos', 'valor': 'R\$ 50,00'},
  ];

  final _nomeController = TextEditingController();
  final _valorController = TextEditingController();

  void _limparCampos() {
    _nomeController.clear();
    _valorController.clear();
  }

  void _adicionarTransferencia() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova Transferência'),
        content: _formularioTransferencia(),
        actions: [
          TextButton(
            onPressed: () {
              _limparCampos();
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_nomeController.text.isNotEmpty && _valorController.text.isNotEmpty) {
                setState(() {
                  String valor = _valorController.text.trim();
                  if (!valor.startsWith('R\$')) {
                    valor = 'R\$ $valor';
                  }
                  transferencias.insert(0, {
                    'nome': _nomeController.text,
                    'valor': valor,
                  });
                });
                Navigator.pop(context);
                _mostrarComprovante(_nomeController.text, _valorController.text);
                _limparCampos();
              }
            },
            child: const Text('Transferir'),
          ),
        ],
      ),
    );
  }

  Widget _formularioTransferencia() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _nomeController,
          decoration: const InputDecoration(labelText: 'Nome do destinatário'),
        ),
        TextField(
          controller: _valorController,
          decoration: const InputDecoration(labelText: 'Valor (ex: R\$ 100,00)'),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  void _mostrarComprovante(String nome, String valor) {
    showDialog(
      context: context,
      builder: (context) => _comprovanteDialog(nome, valor),
    );
  }

  Widget _comprovanteDialog(String nome, String valor) {
    final texto = 'Comprovante de Transferência\n'
        'Destinatário: $nome\n'
        'Valor: $valor\n'
        'Banco Creditta\nAgência: 0001  Conta: 12345-6';
    return AlertDialog(
      title: const Text('Comprovante de Transferência'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Destinatário: $nome'),
          Text('Valor: $valor'),
          const SizedBox(height: 12),
          const Text('Banco Creditta\nAgência: 0001  Conta: 12345-6'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Fechar'),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.share),
          label: const Text('Compartilhar'),
          onPressed: () => Share.share(texto),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _adicionarTransferencia,
        icon: const Icon(Icons.add),
        label: const Text('Nova Transferência'),
        backgroundColor: const Color.fromARGB(255, 13, 71, 161),
        foregroundColor: Colors.white, // <-- Adicione esta linha
      ),
    );
  }
}