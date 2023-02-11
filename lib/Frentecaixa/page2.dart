import 'package:flutter/material.dart';
import 'package:gestao_de_caixa/FrenteCaixa/blocos/b1.dart';
import 'package:gestao_de_caixa/FrenteCaixa/blocos/b2.dart';
import 'package:gestao_de_caixa/FrenteCaixa/blocos/b3.dart';
import 'package:gestao_de_caixa/Frentecaixa/blocos/b4.dart';
import 'package:gestao_de_caixa/Frentecaixa/blocos/b5.dart';
import 'package:gestao_de_caixa/Frentecaixa/blocos/b6.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
                  b1(),
                  b2(),
                  b3(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
