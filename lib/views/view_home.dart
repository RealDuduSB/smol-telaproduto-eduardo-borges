import 'package:flutter/material.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFF43),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Adicional',
                    ),
                    const Text(
                      'complemente seu pedido',
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
            ),

            const Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 10.0),
            ),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _diminuirQuantidade,
                        icon: const Icon(Icons.remove_circle_outlined,
                          color: Colors.black,
                          size: 20,),
                      ),
                      Text(
                        _quantidade.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: _aumentarQuantidade,
                        icon: const Icon(Icons.add_circle,
                          color: Color(0xFF18833D),
                          size: 20,),
                      ),

                    ],
                  ),
                  Text(
                    "Preço Total: R\$ ${_calcularPrecoTotal().toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Container(
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF18833D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
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
    return   SizedBox(
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
      padding:
      const EdgeInsets.only(right: 16.5, left: 16.5, top: 16.5),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF30FC6F),
                    width: 1,
                  ),
                ),
                width: double.maxFinite,
                height: 254,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Bombom 1 ",
                                style: TextStyle(
                                  color: Color(0xFFC4C4C4),
                                ),
                              ),
                              Text(
                                "R\$4,50",
                                style: TextStyle(
                                  color: Color(0xFF20AB4E),
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Color(0xFFFF0000),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 100),
                        child: Text(
                          "Doce de chocolate",
                          style: TextStyle(
                            color: Color(0xFFC4C4C4),
                          ),
                        ),
                      )
                    ],
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
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
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
