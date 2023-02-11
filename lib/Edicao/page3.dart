import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/Edicao/blocos/b2.dart';

import 'blocos/b1.dart';

class Page3 extends StatefulWidget {
  Page3({super.key, this.dados});
  var dados;

  @override
  State<Page3> createState() => _Page3State(dados: dados);
}

class _Page3State extends State<Page3> {
  _Page3State({this.dados});
  var dados;
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff272530),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: largura > 600 ? 500 : largura,
              child: Column(
                children: [
                  b1(
                    dados: dados,
                  ),
                  b2(dados: dados),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
