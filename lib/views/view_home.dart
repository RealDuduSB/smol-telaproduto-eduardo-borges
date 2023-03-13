import 'package:flutter/material.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  double valIng = 1.25;
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
    if (_quantidadeMorango >= 0) {
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
    if (_quantidadeGranulado >= 0) {
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
    if (_quantidadeNinho >= 0) {
      setState(() {
        _quantidadeNinho++;
      });
    }
  }
  void adicionarProduto() {
    if (_quantidadeMorango >= 3 ||
        _quantidadeGranulado >= 3 ||
        _quantidadeNinho >= 3 ||
        _quantidadeGranulado >= 1 &&
            _quantidadeMorango >= 1 &&
            _quantidadeNinho >= 1 ||
        _quantidadeGranulado >= 2 && _quantidadeNinho >= 1 ||
        _quantidadeGranulado >= 2 && _quantidadeMorango >= 1 ||
        _quantidadeMorango >= 2 && _quantidadeNinho >= 1 ||
        _quantidadeMorango >= 2 && _quantidadeGranulado >= 1 ||
        _quantidadeNinho >= 2 && _quantidadeMorango >= 1 ||
        _quantidadeNinho >= 2 && _quantidadeGranulado >= 1) {
      // exibir alerta de sucesso
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sucesso"),
            content: Text("Você adicionou o produto no carrinho!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _quantidadeMorango = 0;
                    _quantidadeNinho = 0;
                    _quantidadeGranulado = 0;
                    _quantidade = 1;
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      // exibir alerta de erro
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Erro"),
            content: const Text(
                "Você precisa escolher pelo menos 3 adicionais para continuar."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  double _calcularPrecoTotal() {
    return ((_quantidadeMorango + _quantidadeGranulado + _quantidadeNinho) *
                valIng +
            4.5) *
        _quantidade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                buildImageWidget(),
                buildCircularLogo(),
              ],
            ),
            buildContentCentro(),
            const SizedBox(
              height: 16.5,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 150, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: const Color(0xFF30FC6F),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ninho",
                          style: TextStyle(
                            color: Color(0xFF8D8B8B),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                                "+ R\$ ${valIng.toStringAsFixed(2).replaceAll('.', ',')}",
                                style: const TextStyle(
                                  color: Color(0xFF8D8B8B),
                                )),
                            Visibility(
                              visible: _quantidadeNinho > 0,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: _diminuirQuantidadeNinho,
                                    icon: const Icon(
                                      Icons.remove_circle_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  Text(_quantidadeNinho.toString()),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: _aumentarQuantidadeNinho,
                              icon: const Icon(
                                Icons.add_circle,
                                color: Color(0xFF18833D),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.5),
                      child: Container(
                        padding: const EdgeInsets.only(top: 100, left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                          ),
                          border: Border.all(
                            color: const Color(0xFF30FC6F),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Granulado",
                                style: TextStyle(
                                  color: Color(0xFF8D8B8B),
                                )),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "+ R\$ ${valIng.toStringAsFixed(2).replaceAll('.', ',')}",
                                    style: const TextStyle(
                                      color: Color(0xFF8D8B8B),
                                    )),
                                Visibility(
                                  visible: _quantidadeGranulado > 0,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: _diminuirQuantidadeGranulado,
                                        icon: const Icon(
                                          Icons.remove_circle_outlined,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                      Text(_quantidadeGranulado.toString()),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: _aumentarQuantidadeGranulado,
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Color(0xFF18833D),
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.5),
                          child: Container(
                            padding: const EdgeInsets.only(top: 50, left: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                              ),
                              border: Border.all(
                                color: const Color(0xFF30FC6F),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Morango ",
                                    style: TextStyle(
                                      color: Color(0xFF8D8B8B),
                                    )),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        "+ R\$ ${valIng.toStringAsFixed(2).replaceAll('.', ',')}",
                                        style: const TextStyle(
                                          color: Color(0xFF8D8B8B),
                                        )),
                                    Visibility(
                                      visible: _quantidadeMorango > 0,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed:
                                                _diminuirQuantidadeMorango,
                                            icon: const Icon(
                                              Icons.remove_circle_outlined,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                          Text(_quantidadeMorango.toString()),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: _aumentarQuantidadeMorango,
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Color(0xFF18833D),
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFF43),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Adicionais',
                                    style: TextStyle(
                                      color: Color(0xFF18833D),
                                    ),
                                  ),
                                  const Text(
                                    'complemente o seu pedido',
                                    style: TextStyle(
                                      color: Color(0xFF18833D),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Container(
                                      width: 80,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF28D45E),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: const Text(
                                        'OPICIONAL',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF28D45E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _diminuirQuantidade,
                        icon: const Icon(
                          Icons.remove_circle_outlined,
                          color: Color(0xFF18833D),
                          size: 20,
                        ),
                      ),
                      Text(
                        _quantidade.toString(),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: _aumentarQuantidade,
                        icon: const Icon(
                          Icons.add_circle,
                          color: Color(0xFF18833D),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "R\$ ${_calcularPrecoTotal().toStringAsFixed(2).replaceAll('.', ',')}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Container(
                    width: 80,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFF18833D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        adicionarProduto();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF18833D),
                        // cor de fundo do botão
                        onPrimary: Colors.white,
                        // cor do texto do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFFF43),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CircleAvatar(
            backgroundColor: Color(0xFF20AB4E),
            radius: 10,
            child: Icon(
              Icons.chevron_left,
              size: 20,
              color: Color(0xFFFFFF43),
            ),
          ),
          Icon(
            Icons.location_on_sharp,
            color: Color(0xFF20AB4E),
          ),
          Text(
            'Rua França Pinto, 406 - Vila Mariana',
            style: TextStyle(color: Colors.black, fontSize: 14),
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
        "assets/images/chocolate-melted-chocolate-and-almond-on-black-bac-JPNY6NP.png",
        fit: BoxFit.fitWidth,
        width: double.infinity,
        height: 136,
      ),
    );
  }

  Widget buildCircularLogo() {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2DC9E),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContentCentro() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.5, left: 16.5, top: 16.5),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF30FC6F),
                    width: 1,
                  ),
                ),
                width: double.maxFinite,
                height: 254,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Bombom 1 ",
                                    style: TextStyle(
                                      color: Color(0xFF8D8B8B),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "R\$4,50",
                                    style: TextStyle(
                                      color: Color(0xFF20AB4E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 16.5),
                              child: Icon(
                                Icons.favorite_border,
                                color: Color(0xFFFF0000),
                              ),
                            ),
                          ],
                        ),
                        const Text("Doce de chocolate",
                            style: TextStyle(
                              color: Color(0xFF8D8B8B),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      border: Border.all(
                        color: const Color(0xFFC4C4C4),
                        width: 1,
                      ),
                    ),
                    width: double.maxFinite,
                    height: 254,
                    child: Image.asset("assets/images/Vector.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
