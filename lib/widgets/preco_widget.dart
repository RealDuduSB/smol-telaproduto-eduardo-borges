import 'package:flutter/material.dart';

import '../views/view_home.dart';

class PrecoProduto extends StatefulWidget {
  final List<Bombom> listaBombons;

  const PrecoProduto({Key? key, required this.listaBombons}) : super(key: key);

  @override
  _PrecoProdutoState createState() => _PrecoProdutoState();
}

class _PrecoProdutoState extends State<PrecoProduto> {
  double get precoTotal {
    return widget.listaBombons.length * 5.0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Preço: R\$ ${precoTotal.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}





