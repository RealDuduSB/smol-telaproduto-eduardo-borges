import 'package:flutter/material.dart';

class BombomPage extends StatefulWidget {
  const BombomPage({super.key});

  @override
  _BombomPageState createState() => _BombomPageState();
}

class _BombomPageState extends State<BombomPage> {
  int _quantidade = 1;
  int _quantidadeMorango = 0;
  int _quantidadeGranulado = 0;
  int _quantidadeNinho = 0;

  void _diminuirQuantidade() {
    if (_quantidade > 1) {
      setState(() {
        _quantidade--;
      });
    }
  }

  void _aumentarQuantidade() {
    setState(() {
      _quantidade++;
    });
  }

  void _diminuirQuantidadeMorango() {
    if (_quantidadeMorango > 0) {
      setState(() {
        _quantidadeMorango--;
      });
    }
  }

  void _aumentarQuantidadeMorango() {
    if (_quantidadeMorango == 3 ||
        _quantidadeGranulado == 3 ||
        _quantidadeNinho == 3 ||
        _quantidadeGranulado == 1 &&
            _quantidadeMorango == 1 &&
            _quantidadeNinho == 1 ||
        _quantidadeGranulado == 2 && _quantidadeNinho == 1 ||
        _quantidadeGranulado == 2 && _quantidadeMorango == 1 ||
        _quantidadeMorango == 2 && _quantidadeNinho == 1 ||
        _quantidadeNinho == 2 && _quantidadeMorango == 1) {
      _quantidadeMorango = _quantidadeMorango;
    } else if (_quantidadeMorango >= 0 && _quantidadeMorango < 3) {
      setState(() {
        _quantidadeMorango++;
      });
    }
  }

  void _diminuirQuantidadeGranulado() {
    if (_quantidadeGranulado > 0) {
      setState(() {
        _quantidadeGranulado--;
      });
    }
  }

  void _aumentarQuantidadeGranulado() {
    if (_quantidadeMorango == 3 ||
        _quantidadeGranulado == 3 ||
        _quantidadeNinho == 3 ||
        _quantidadeGranulado == 1 &&
            _quantidadeMorango == 1 &&
            _quantidadeNinho == 1 ||
        _quantidadeGranulado == 2 && _quantidadeNinho == 1 ||
        _quantidadeGranulado == 2 && _quantidadeMorango == 1 ||
        _quantidadeMorango == 2 && _quantidadeNinho == 1 ||
        _quantidadeNinho == 2 && _quantidadeMorango == 1) {
      _quantidadeGranulado = _quantidadeGranulado;
    } else if (_quantidadeGranulado >= 0 && _quantidadeGranulado < 3) {
      setState(() {
        _quantidadeGranulado++;
      });
    }
  }

  void _diminuirQuantidadeNinho() {
    if (_quantidadeNinho > 0) {
      setState(() {
        _quantidadeNinho--;
      });
    }
  }

  void _aumentarQuantidadeNinho() {
    if (_quantidadeMorango == 3 ||
        _quantidadeGranulado == 3 ||
        _quantidadeNinho == 3 ||
        _quantidadeGranulado == 1 &&
            _quantidadeMorango == 1 &&
            _quantidadeNinho == 1 ||
        _quantidadeGranulado == 2 && _quantidadeNinho == 1 ||
        _quantidadeGranulado == 2 && _quantidadeMorango == 1 ||
        _quantidadeMorango == 2 && _quantidadeNinho == 1 ||
        _quantidadeNinho == 2 && _quantidadeMorango == 1) {
      _quantidadeNinho = _quantidadeNinho;
    } else if (_quantidadeNinho >= 0 && _quantidadeNinho < 3) {
      setState(() {
        _quantidadeNinho++;
      });
    }
  }

  double _calcularPrecoTotal() {
    return ((_quantidadeMorango + _quantidadeGranulado + _quantidadeNinho) *
                1.5 +
            4.5) *
        _quantidade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bombom"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Ingredientes",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text("Morango (R\$ 1,50)"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: _diminuirQuantidadeMorango,
                    icon: const Icon(Icons.remove),
                  ),
                  Text(_quantidadeMorango.toString()),
                  IconButton(
                    onPressed: _aumentarQuantidadeMorango,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("Granulado (R\$ 1,50)"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: _diminuirQuantidadeGranulado,
                    icon: const Icon(Icons.remove),
                  ),
                  Text(_quantidadeGranulado.toString()),
                  IconButton(
                    onPressed: _aumentarQuantidadeGranulado,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("Ninho (R\$ 1,50)"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: _diminuirQuantidadeNinho,
                    icon: const Icon(Icons.remove),
                  ),
                  Text(_quantidadeNinho.toString()),
                  IconButton(
                    onPressed: _aumentarQuantidadeNinho,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Preço Total: R\$ ${_calcularPrecoTotal().toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _diminuirQuantidade,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  _quantidade.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: _aumentarQuantidade,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
