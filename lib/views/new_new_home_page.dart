import 'package:flutter/material.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  int _quantidade = 1;
  int _quantidadeMorango = 0;
  int _quantidadeGranulado = 0;
  int _quantidadeNinho = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildImageWidget(),
              buildQuantidadeWidget(),
              buildPrecoWidget(),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFFF43),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.arrow_back,
            color: Color(0xFF20AB4E),
          ),
          Icon(
            Icons.location_on_sharp,
            color: Color(0xFF20AB4E),
          ),
          Text(
            'Rua França Pinto, 406 - Vila Mariana',
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF20AB4E),
          ),
          Icon(
            Icons.search,
            color: Color(0xFF20AB4E),
          ),
        ],
      ),
    );
  }

  Widget buildImageWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Image.asset(
        "assets/images/chocolate-melted-chocolate-and-al...",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildQuantidadeWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: _diminuirQuantidade,
          ),
          Text('Quantidade: $_quantidade'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _aumentarQuantidade,
          ),
        ],
      ),
    );
  }

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

  Widget buildPrecoWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Morango: R\$ ${_quantidadeMorango * _quantidade}",
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            "Granulado: R\$ ${_quantidadeGranulado * _quantidade}",
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            "Ninho: R\$ ${_quantidadeNinho * _quantidade}",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
