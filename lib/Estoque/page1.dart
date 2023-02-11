import 'package:flutter/material.dart';

import 'package:gestao_de_caixa/Estoque/blocos/b2.dart';
import 'package:gestao_de_caixa/Estoque/blocos/b3.dart';

import 'blocos/b1.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff272530),
        body: Center(
          child: SizedBox(
            width: largura > 600 ? 500 : largura,
            child: Column(
              children: [b1(), b2(), b3()],
            ),
          ),
        ),
      ),
    );
  }
}
