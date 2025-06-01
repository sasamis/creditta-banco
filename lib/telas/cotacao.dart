import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cotacao extends StatefulWidget {
  const Cotacao({super.key});

  @override
  State<Cotacao> createState() => _CotacaoState();
}

class _CotacaoState extends State<Cotacao> {
  double? dolar;
  double? euro;
  bool loading = false;

  Future<void> buscarCotacoes() async {
    setState(() => loading = true);
    final url = Uri.parse(
      'https://api.hgbrasil.com/finance?format=json-cors&key=d65f9298',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        dolar = data['results']['currencies']['USD']['buy']?.toDouble();
        euro = data['results']['currencies']['EUR']['buy']?.toDouble();
        loading = false;
      });
    } else {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao buscar cotação')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    buscarCotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotação'),
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
        child: Center(
          child: loading
              ? const CircularProgressIndicator(color: Colors.white)
              : (dolar != null && euro != null)
                  ? Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              'Cotações do dia',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0D47A1),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.monetization_on, color: Colors.green, size: 28),
                                    const SizedBox(width: 8),
                                    const Text('Dólar:', style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Text(
                                  'R\$ ${dolar!.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.euro, color: Colors.blue, size: 28),
                                    const SizedBox(width: 8),
                                    const Text('Euro:', style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Text(
                                  'R\$ ${euro!.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0D47A1),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  elevation: 0,
                                  splashFactory: NoSplash.splashFactory,
                                  animationDuration: Duration.zero,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                onPressed: buscarCotacoes,
                                child: const Text(
                                  'Atualizar',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Text(
                      'Não foi possível obter as cotações',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
        ),
      ),
    );
  }
}